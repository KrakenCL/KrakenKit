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

public class Summary {
    private var values = [Tensorflow_Summary.Value]()
    fileprivate let summaryQueue = DispatchQueue(label: "com.krakencl.krakenkit", qos: .default)

    public init() {
        
    }
    
    /*
     simpleValue(Float)
     image(Tensorflow_Summary.Image)
     histo(Tensorflow_HistogramProto)
     audio(Tensorflow_Summary.Audio)
     tensor(Tensorflow_TensorProto)
     */
    
    lazy var valueTemplate: Tensorflow_Summary.Value = {
        return Tensorflow_Summary.Value()
    }()
    
    private func add(_ value: Tensorflow_Summary.Value, tag: String) {
        var value = value
        value.tag = tag
        summaryQueue.sync(flags: .barrier) {
            values.append(value)
        }
    }
    
    public func histogram(array: [Float], tag: String) {
        let histo = Histogram(ofSequence: array.map { Double($0) } )
        var value = valueTemplate
        value.histo = histo.proto
        add(value, tag: tag)
    }
    
    public func image(array: [Float], tag: String) {
        var value = valueTemplate
        values.append(value)
    }
    
    /// Extract `Tensorflow_Summary` and remove all events
    internal var proto: Tensorflow_Summary {
        var tensorflowSummary = Tensorflow_Summary()
        summaryQueue.sync(flags: .barrier) {
            tensorflowSummary.value = values
            values.removeAll()
        }
        return tensorflowSummary
    }
}

/*
/// Add Serialized GraphDef to events list to store it on file system
internal func add(graphDef data: Data) throws {
    var eventRecord = EventRecord(defaultKind: .value)
    eventRecord.event.summary = Tensorflow_Summary()
    eventRecord.event.graphDef = data
    let record = try eventRecord.record()
    dataQueue.sync(flags: .barrier) {
        records.append(record)
    }
}

/// One more feature to track some
public func add(scalar: Float, tag: String, step: Int64, time: TimeInterval = Date().timeIntervalSince1970) throws {
    var summary = Tensorflow_Summary()
    var summaryValue = Tensorflow_Summary.Value()
    summaryValue.simpleValue = scalar
    summaryValue.tag = tag
    summary.value.append(summaryValue)
    
    var eventRecord = EventRecord(defaultKind: .value)
    eventRecord.event.wallTime = time
    eventRecord.event.summary = summary
    eventRecord.event.step = step
    let record = try eventRecord.record()
    
    dataQueue.sync(flags: .barrier) {
        records.append(record)
    }
    try flush()
}

public func add(histogram: Tensorflow_HistogramProto, tag: String, step: Int64, time: TimeInterval = Date().timeIntervalSince1970) throws {
    var summary = Tensorflow_Summary()
    var summaryValue = Tensorflow_Summary.Value()
    summaryValue.histo = histogram
    summaryValue.tag = tag
    summary.value.append(summaryValue)
    
    var eventRecord = EventRecord(defaultKind: .value)
    eventRecord.event.wallTime = time
    eventRecord.event.summary = summary
    eventRecord.event.step = step
    let record = try eventRecord.record()
    
    dataQueue.sync(flags: .barrier) {
        records.append(record)
    }
    try flush()
}

/// Add summary as serialized proto buffer stored in `Tensor`.
public func add(serializedTensor data: Data, step: Int64, time: TimeInterval = Date().timeIntervalSince1970) throws {
    let summary = try Tensorflow_Summary(serializedData: data)
    
    var eventRecord = EventRecord(defaultKind: .value)
    eventRecord.event.wallTime = time
    eventRecord.event.summary = summary
    eventRecord.event.step = step
    let record = try eventRecord.record()
    
    dataQueue.sync(flags: .barrier) {
        records.append(record)
    }
    try flush()
}
*/
