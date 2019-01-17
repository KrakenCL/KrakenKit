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
import CTensorFlow

public protocol TensorBoardRepresentable: TensorFlowScalar {}

public class Summary {
    private var values = [Tensorflow_Summary.Value]()
    fileprivate let summaryQueue = DispatchQueue(label: "com.krakencl.krakenkit", qos: .default)

    public init() {
        
    }
    
    /*
     image(Tensorflow_Summary.Image)
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
    
    public func histogram(array: [Double], tag: String) {
        let histo = Histogram(ofSequence: array)
        var value = valueTemplate
        value.histo = histo.proto
        add(value, tag: tag)
    }
    
    
    /// Just add histogram
//    public func histogram(tensor: Tensor<Double>, tag: String) {
//        histogram(array: tensor.scalars, tag: tag)
//    }
    
    /// Convert any `BinaryFloatingPoint` Scalar value to Double and pass to histogram
    public func histogram<Scalar: BinaryFloatingPoint>(tensor: Tensor<Scalar>, tag: String) {
        histogram(array: tensor.scalars.map { Double($0) }, tag: tag)
    }
    
    /// Convert any `BinaryInteger` Scalar value to Double and pass to histogram
    public func histogram<Scalar: BinaryInteger>(tensor: Tensor<Scalar>, tag: String) {
        histogram(array: tensor.scalars.map { Double($0) }, tag: tag)
    }

    public func image(array: [Float], tag: String) {
        var value = valueTemplate
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
