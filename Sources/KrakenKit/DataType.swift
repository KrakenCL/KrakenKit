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
import CTensorFlow
import Proto

extension Tensorflow_DataType {
    public var swiftType: Any.Type? {
        switch self {
        case .dtFloat: return Float.self
        case .dtDouble: return Double.self
        case .dtInt32: return Int32.self
        case .dtUint8: return UInt8.self
        case .dtInt16: return Int16.self
        case .dtInt8: return Int8.self
        case .dtString: return String.self
        case .dtInt64: return Int64.self
        case .dtBool: return Bool.self
        case .dtUint16: return UInt16.self
        case .dtUint32: return UInt32.self
        case .dtUint64: return UInt64.self
        default:
            return nil
        }
    }
    
    public init(swiftType: Any.Type?) {
        if swiftType == Float.self {
            self = .dtFloat
        } else if swiftType == Double.self {
            self = .dtDouble
        } else if swiftType == Int.self {
            self = .dtInt32
        } else if swiftType == Int16.self {
            self = .dtInt16
        } else if swiftType == Int32.self {
            self = .dtInt32
        } else if swiftType == Int8.self {
            self = .dtInt8
        } else if swiftType == UInt.self {
            self = .dtUint32
        } else if swiftType == UInt16.self {
            self = .dtUint16
        } else if swiftType == UInt32.self {
            self = .dtUint32
        } else if swiftType == UInt8.self {
            self = .dtUint8
        } else if swiftType == Bool.self {
            self = .dtBool
        }
        
        self = .dtInvalid
    }
    
    
}

