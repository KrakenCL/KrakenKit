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
import TensorFlow
import Proto

public protocol ProtoDataTypeRepresentable {
    var protoType: Tensorflow_DataType { get }
}
extension ProtoDataTypeRepresentable {
    public var protoType: Tensorflow_DataType { return .dtInvalid }
}

extension Tensor {
    public var protoType: Tensorflow_DataType { return Tensorflow_DataType(swiftType: Scalar.self)  }
}


extension TensorShape {
    var proto: Tensorflow_TensorShapeProto {
        var tensorShape = Tensorflow_TensorShapeProto()
        for dimIndex in 0..<count {
            var dim = Tensorflow_TensorShapeProto.Dim()
            dim.size = Int64(self[dimIndex])
            tensorShape.dim.append(dim)
        }
        return tensorShape
    }
}
extension Tensor {
    var proto: Tensorflow_TensorProto {
        var tensorProto = Tensorflow_TensorProto()        

        tensorProto.tensorShape = shape.proto
        tensorProto.dtype = self.protoType
        
        if let tensor = self as? Tensor<Double> {
            tensorProto.doubleVal = tensor.scalars
        } else if let tensor = self as? Tensor<Float> {
            tensorProto.floatVal = tensor.scalars
        } else if let tensor = self as? Tensor<Int8> {
            tensorProto.intVal = tensor.scalars.map { Int32($0) }
        } else if let tensor = self as? Tensor<Int16> {
            tensorProto.intVal = tensor.scalars.map { Int32($0) }
        } else if let tensor = self as? Tensor<Int32> {
            tensorProto.intVal = tensor.scalars
        } else if let tensor = self as? Tensor<Int64> {
            tensorProto.int64Val = tensor.scalars
        } else if let tensor = self as? Tensor<UInt8> {
            tensorProto.uint32Val = tensor.scalars.map { UInt32($0) }
        } else if let tensor = self as? Tensor<UInt16> {
            tensorProto.uint32Val = tensor.scalars.map { UInt32($0) }
        } else if let tensor = self as? Tensor<UInt32> {
            tensorProto.uint32Val = tensor.scalars
        } else if let tensor = self as? Tensor<UInt64> {
            tensorProto.uint64Val = tensor.scalars
        }
        
        return tensorProto
    }
    
}
