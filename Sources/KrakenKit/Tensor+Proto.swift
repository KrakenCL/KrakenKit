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
/* Currently leads to compile abort
 Index: Duplicate USR! s:10TensorFlow0A0V9KrakenKitE9protoType5Proto015Tensorflow_DataF0Ovg
 !dbg attachment points at wrong subprogram for function
 !105 = distinct !DISubprogram(name: "proto.get", linkageName: "$s10TensorFlow0A0V9KrakenKitE5proto5Proto011Tensorflow_aF0Vvg", scope: !6, file: !5, line: 25, type: !106, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: false, unit: !0, retainedNodes: !2)
 void (%T5Proto017Tensorflow_TensorA0V*, %T10TensorFlow0A6HandleC*, %swift.type*, i8**)* @"$s10TensorFlow0A0V9KrakenKitE5proto5Proto011Tensorflow_aF0Vvg"
 store %T10TensorFlow0A6HandleC* %1, %T10TensorFlow0A6HandleC** %10, align 8, !dbg !98
 !98 = !DILocation(line: 0, scope: !93)
 !93 = distinct !DISubprogram(name: "protoType.get", linkageName: "$s10TensorFlow0A0V9KrakenKitE9protoType5Proto015Tensorflow_DataF0Ovg", scope: !6, file: !5, line: 20, type: !94, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, retainedNodes: !2)
 !93 = distinct !DISubprogram(name: "protoType.get", linkageName: "$s10TensorFlow0A0V9KrakenKitE9protoType5Proto015Tensorflow_DataF0Ovg", scope: !6, file: !5, line: 20, type: !94, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, unit: !0, retainedNodes: !2)
 <unknown>:0: error: fatal error encountered during compilation; please file a bug report with your project and the crash log
 <unknown>:0: note: Broken module found, compilation aborted!

 */
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
        tensorProto.dtype = Tensorflow_DataType(swiftType: Scalar.self)
        
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
