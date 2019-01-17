/* Copyright 2018 The KrakenCL Authors. All Rights Reserved.
 
 Created by Volodymyr Pavliukevych
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */


import Foundation
import Proto
import Dispatch

public enum FileWriterError : Error {
    case canNotComputeFileURL
    case canNotCreateFile
}

public class FileWriter {
    /// List of stored records.
    fileprivate var records = [Record]()
    fileprivate var fileOffcet: UInt64 = 0
    /// Path to storage file.
    public private(set) var fileURL: URL?
    /// Path to storage folder.
    public private(set) var folderURL: URL?
    public private(set) var identifier: String
    /// Writing queue.
    fileprivate let dataQueue = DispatchQueue(label: "com.krakencl.krakenkit", qos: .default)
    
    /// Constructor, should receive url path to storage folder
    /// Also you can set some identifier for your file.
    public init(folder url: URL, identifier: String = "") throws {
        self.identifier = identifier

        try prepareFile(folder: url, identifier: identifier)
        try flush()
    }
    
    internal func prepareFile(folder url: URL, identifier : String) throws {
        let eventRecord = EventRecord.fileEvent()
        let fileEventRecord = try eventRecord.record()
        records.append(fileEventRecord)
        folderURL = url.appendingPathComponent("/")

        guard let computedFileURL = URL(string: "events.out.tfevents.\(Date().timeIntervalSince1970)-\(identifier).td", relativeTo: folderURL) else {
            throw FileWriterError.canNotComputeFileURL
        }
        
        fileURL = computedFileURL
    }
    
    /// Checking is folder available.
    internal func folderPreparation() throws {
        guard var folderURL = folderURL else { throw FileWriterError.canNotComputeFileURL }
        var isDirectory : ObjCBool = false
        if FileManager.default.fileExists(atPath: folderURL.absoluteString, isDirectory: &isDirectory) {
            #if os(Linux)
                if isDirectory {
                    return
                }
            #else
                if isDirectory.boolValue {
                    return
                }
            #endif
        }

        if folderURL.scheme == nil {
            folderURL = URL(string: "file://" + folderURL.absoluteString)!
        }

        try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
    }
    
    /// After records accumulated, you should save them on file system.
    public func flush() throws {
        guard let fileURL = fileURL else { throw FileWriterError.canNotCreateFile }
        try folderPreparation()
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            /// Create clear file
            guard FileManager.default.createFile(atPath: fileURL.absoluteString, contents: nil, attributes: nil) else {
                throw FileWriterError.canNotCreateFile
            }
        }
        
        let fileHandle = try FileHandle(forUpdating: fileURL)
        
        dataQueue.sync(flags: .barrier) {
            records.forEach { (record : Record) in
                fileHandle.seek(toFileOffset: fileOffcet)
                var mutableRecord = record
                var data = mutableRecord.header.encode()
                data.append(mutableRecord.data)
                data.append(mutableRecord.footer.encode())
                fileHandle.write(data)
                fileOffcet += UInt64(data.count)
            }
            records.removeAll()
            fileHandle.closeFile()
        }
    }

    /// Add `Summary` to FileWriter and clear `Summary` contant.
    public func add(summary: Summary, wallTime: TimeInterval = Date().timeIntervalSince1970, step: Int) throws {
        try add(summary: summary, wallTime: wallTime, step: Int64(step))
    }
    
    /// Add `Summary` to FileWriter and clear `Summary` contant.
    public func add(summary: Summary, wallTime: TimeInterval = Date().timeIntervalSince1970, step: Int64) throws {
        var eventRecord = EventRecord(defaultKind: .value)
        eventRecord.event.summary = summary.proto
        eventRecord.event.wallTime = wallTime
        eventRecord.event.step = step
        let record = try eventRecord.record()
        dataQueue.sync(flags: .barrier) {
            records.append(record)
        }
        try flush()
    }
}


