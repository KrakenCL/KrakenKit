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
import TensorFlow
import LibPNG

public protocol TensorBoardRepresentable: TensorFlowScalar {}

public enum SummaryError: Error {
    case canNotComputeImageData
}
public class Summary {
    private var values = [Tensorflow_Summary.Value]()
    fileprivate let summaryQueue = DispatchQueue(label: "com.krakencl.krakenkit", qos: .default)

    /// Represents Image `Colorspace`
    public enum Colorspace: Int32 {
        case grayscale = 1
        case grayscaleAlpha = 2
        case rgb = 3
        case rgba = 4
        
        fileprivate var colorType: LibPNG.ColorType {
            switch self {
            case .grayscale:
                return ColorType.greyscale
            case .grayscaleAlpha:
                return ColorType.greyscaleAlpha
            case .rgb:
                return ColorType.rgb
            case .rgba:
                return ColorType.rgba
            }
        }
    }
    
    /// Represents Image size for `Summary` image `Tensor`.
    public struct ImageSize {
        public let width: Int
        public let height: Int
        
        public var points: Int {
            return width * height
        }
        
        public init(width: Int, height: Int) {
            self.height = height
            self.width = width
        }
        
        public var longWidth: Int32 {
            return Int32(width)
        }
        
        public var longHeight: Int32 {
            return Int32(height)
        }
    }
    
    public init() {}
    
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
    
    public func histogram(array: [Double], tag: String) {
        let histo = Histogram(ofSequence: array)
        var value = valueTemplate
        value.histo = histo.proto
        add(value, tag: tag)
    }
    
    /// Convert any `BinaryFloatingPoint` Scalar value to Double and pass to histogram
    public func histogram<Scalar: BinaryFloatingPoint>(tensor: Tensor<Scalar>, tag: String) {
        histogram(array: tensor.scalars.map { Double($0) }, tag: tag)
    }
    
    /// Convert any `BinaryInteger` Scalar value to Double and pass to histogram
    public func histogram<Scalar: BinaryInteger>(tensor: Tensor<Scalar>, tag: String) {
        histogram(array: tensor.scalars.map { Double($0) }, tag: tag)
    }
    
    public func image<T: BinaryInteger>(array: [T], colorspace: Colorspace = .grayscale, badColor: UInt8 = 0, size: ImageSize, tag: String) throws {
        let pngImage = try Image(width: size.width,
                              height: size.height,
                              colorType: colorspace.colorType,
                              bitDepth: 8,
                              badColor: badColor,
                              pixelValues: array)
        guard let data = pngImage.data else {
            throw SummaryError.canNotComputeImageData
        }
        image(data: data, colorspace: colorspace, size: size, tag: tag)
    }
    
    public func image<T: BinaryFloatingPoint>(array: [T], colorspace: Colorspace = .grayscale, badColor: UInt8 = 0, size: ImageSize, tag: String) throws {
        let pngImage = try Image(width: size.width,
                              height: size.height,
                              colorType: colorspace.colorType,
                              bitDepth: 8,
                              badColor: badColor,
                              pixelValues: array)
        guard let data = pngImage.data else {
            throw SummaryError.canNotComputeImageData
        }
        image(data: data, colorspace: colorspace, size: size, tag: tag)
    }
    
    public func image(data: Data, colorspace: Colorspace, size: ImageSize, tag: String) {
        var value = valueTemplate
        
        var image = Tensorflow_Summary.Image()
        image.colorspace = colorspace.rawValue
        image.height = size.longHeight
        image.width = size.longWidth
        image.encodedImageString = data
        value.image = image
        value.tag = tag
        values.append(value)
    }
    
    public func add<T : Numeric>(scalar: T, tag: String) {
        var value = valueTemplate
        value.tag = tag
        
        if let scalar = scalar as? Double {
            value.simpleValue = Float(scalar)
        } else if let scalar = scalar as? Float {
            value.simpleValue = scalar
        } else if let scalar = scalar as? Int {
            value.simpleValue = Float(scalar)
        } else if let scalar = scalar as? Int8 {
            value.simpleValue = Float(scalar)
        } else if let scalar = scalar as? Int16 {
            value.simpleValue = Float(scalar)
        } else if let scalar = scalar as? Int32 {
            value.simpleValue = Float(scalar)
        } else if let scalar = scalar as? UInt {
            value.simpleValue = Float(scalar)
        } else if let scalar = scalar as? UInt8 {
            value.simpleValue = Float(scalar)
        } else if let scalar = scalar as? UInt16 {
            value.simpleValue = Float(scalar)
        } else if let scalar = scalar as? UInt32 {
            value.simpleValue = Float(scalar)
        }
        
        add(value, tag: tag)
    }
    
    public func add<Scalar>(tensor: Tensor<Scalar>, tag: String) {
        var value = valueTemplate
        value.tag = tag
        value.tensor = tensor.proto
        add(value, tag: tag)
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
