// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tensorflow/python/saved_model/saved_object_graph.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct Tensorflow_SavedObjectGraph {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// List of objects in the SavedModel.
  ///
  /// The position of the object in this list indicates its id.
  /// Nodes[0] is considered the root node.
  public var nodes: [Tensorflow_SavedObject] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct Tensorflow_SavedObject {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Objects which this object depends on: named edges in the dependency
  /// graph.
  ///
  /// Note: only valid if kind == "object".
  public var children: [Tensorflow_CheckpointableObjectGraph.CheckpointableObject.ObjectReference] {
    get {return _storage._children}
    set {_uniqueStorage()._children = newValue}
  }

  /// Slot variables owned by this object. This describes the three-way
  /// (optimizer, variable, slot variable) relationship; none of the three
  /// depend on the others directly.
  ///
  /// Note: only valid if kind == "object".
  public var slotVariables: [Tensorflow_CheckpointableObjectGraph.CheckpointableObject.SlotVariableReference] {
    get {return _storage._slotVariables}
    set {_uniqueStorage()._slotVariables = newValue}
  }

  public var kind: OneOf_Kind? {
    get {return _storage._kind}
    set {_uniqueStorage()._kind = newValue}
  }

  public var userObject: Tensorflow_SavedUserObject {
    get {
      if case .userObject(let v)? = _storage._kind {return v}
      return Tensorflow_SavedUserObject()
    }
    set {_uniqueStorage()._kind = .userObject(newValue)}
  }

  public var asset: Tensorflow_SavedAsset {
    get {
      if case .asset(let v)? = _storage._kind {return v}
      return Tensorflow_SavedAsset()
    }
    set {_uniqueStorage()._kind = .asset(newValue)}
  }

  public var function: Tensorflow_SavedPolymorphicFunction {
    get {
      if case .function(let v)? = _storage._kind {return v}
      return Tensorflow_SavedPolymorphicFunction()
    }
    set {_uniqueStorage()._kind = .function(newValue)}
  }

  public var variable: Tensorflow_SavedVariable {
    get {
      if case .variable(let v)? = _storage._kind {return v}
      return Tensorflow_SavedVariable()
    }
    set {_uniqueStorage()._kind = .variable(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Kind: Equatable {
    case userObject(Tensorflow_SavedUserObject)
    case asset(Tensorflow_SavedAsset)
    case function(Tensorflow_SavedPolymorphicFunction)
    case variable(Tensorflow_SavedVariable)

  #if !swift(>=4.1)
    public static func ==(lhs: Tensorflow_SavedObject.OneOf_Kind, rhs: Tensorflow_SavedObject.OneOf_Kind) -> Bool {
      switch (lhs, rhs) {
      case (.userObject(let l), .userObject(let r)): return l == r
      case (.asset(let l), .asset(let r)): return l == r
      case (.function(let l), .function(let r)): return l == r
      case (.variable(let l), .variable(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// A SavedUserObject is an object (in the object-oriented language of the
/// TensorFlow program) of some user- or framework-defined class other than
/// those handled specifically by the other kinds of SavedObjects.
///
/// This object cannot be evaluated as a tensor, and therefore cannot be bound
/// to an input of a function.
public struct Tensorflow_SavedUserObject {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Corresponds to a registration of the type to use in the loading program.
  public var identifier: String {
    get {return _storage._identifier}
    set {_uniqueStorage()._identifier = newValue}
  }

  /// Version information from the producer of this SavedUserObject.
  public var version: Tensorflow_VersionDef {
    get {return _storage._version ?? Tensorflow_VersionDef()}
    set {_uniqueStorage()._version = newValue}
  }
  /// Returns true if `version` has been explicitly set.
  public var hasVersion: Bool {return _storage._version != nil}
  /// Clears the value of `version`. Subsequent reads from it will return its default value.
  public mutating func clearVersion() {_uniqueStorage()._version = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// A SavedAsset represents a file in a SavedModel.
///
/// When bound to a function this object evaluates to a Variable from which the
/// absolute filename can be read. Users should not expect the filename to be
/// maintained.
public struct Tensorflow_SavedAsset {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Index into `MetaGraphDef.asset_file_def[]` that describes the Asset.
  ///
  /// Only the field `AssetFileDef.filename` is used. Other fields, such as
  /// `AssetFileDef.tensor_info`, MUST be ignored.
  public var assetFileDefIndex: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// A function with multiple signatures, possibly with non-Tensor arguments.
public struct Tensorflow_SavedPolymorphicFunction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var monomorphicFunction: [Tensorflow_SavedMonomorphicFunction] {
    get {return _storage._monomorphicFunction}
    set {_uniqueStorage()._monomorphicFunction = newValue}
  }

  public var functionSpec: Tensorflow_FunctionSpec {
    get {return _storage._functionSpec ?? Tensorflow_FunctionSpec()}
    set {_uniqueStorage()._functionSpec = newValue}
  }
  /// Returns true if `functionSpec` has been explicitly set.
  public var hasFunctionSpec: Bool {return _storage._functionSpec != nil}
  /// Clears the value of `functionSpec`. Subsequent reads from it will return its default value.
  public mutating func clearFunctionSpec() {_uniqueStorage()._functionSpec = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Tensorflow_SavedMonomorphicFunction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// A reference to a TensorFlow function in the MetaGraph's FunctionDefLibrary
  public var concreteFunction: String {
    get {return _storage._concreteFunction}
    set {_uniqueStorage()._concreteFunction = newValue}
  }

  /// Bound inputs to the function. The SavedObjects identified by the node ids
  /// given here are appended as extra inputs to the caller-supplied inputs.
  /// The only types of SavedObjects valid here are SavedVariable, SavedResource
  /// and SavedAsset.
  public var boundInputs: [Int32] {
    get {return _storage._boundInputs}
    set {_uniqueStorage()._boundInputs = newValue}
  }

  /// Input in canonicalized form that was received to create this concrete
  /// function.
  public var canonicalizedInputSignature: Tensorflow_StructuredValue {
    get {return _storage._canonicalizedInputSignature ?? Tensorflow_StructuredValue()}
    set {_uniqueStorage()._canonicalizedInputSignature = newValue}
  }
  /// Returns true if `canonicalizedInputSignature` has been explicitly set.
  public var hasCanonicalizedInputSignature: Bool {return _storage._canonicalizedInputSignature != nil}
  /// Clears the value of `canonicalizedInputSignature`. Subsequent reads from it will return its default value.
  public mutating func clearCanonicalizedInputSignature() {_uniqueStorage()._canonicalizedInputSignature = nil}

  /// Output that was the return value of this function after replacing all
  /// Tensors with TensorSpecs. This can be an arbitrary nested function and will
  /// be used to reconstruct the full structure from pure tensors.
  public var outputSignature: Tensorflow_StructuredValue {
    get {return _storage._outputSignature ?? Tensorflow_StructuredValue()}
    set {_uniqueStorage()._outputSignature = newValue}
  }
  /// Returns true if `outputSignature` has been explicitly set.
  public var hasOutputSignature: Bool {return _storage._outputSignature != nil}
  /// Clears the value of `outputSignature`. Subsequent reads from it will return its default value.
  public mutating func clearOutputSignature() {_uniqueStorage()._outputSignature = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Represents a Variable that is initialized by loading the contents from the
/// SavedModel checkpoint.
public struct Tensorflow_SavedVariable {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var dtype: Tensorflow_DataType {
    get {return _storage._dtype}
    set {_uniqueStorage()._dtype = newValue}
  }

  public var shape: Tensorflow_TensorShapeProto {
    get {return _storage._shape ?? Tensorflow_TensorShapeProto()}
    set {_uniqueStorage()._shape = newValue}
  }
  /// Returns true if `shape` has been explicitly set.
  public var hasShape: Bool {return _storage._shape != nil}
  /// Clears the value of `shape`. Subsequent reads from it will return its default value.
  public mutating func clearShape() {_uniqueStorage()._shape = nil}

  public var trainable: Bool {
    get {return _storage._trainable}
    set {_uniqueStorage()._trainable = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// Represents FunctionSpec used in PolymorphicFunction. This represents a
/// function that has been wrapped as a PolymorphicFunction.
public struct Tensorflow_FunctionSpec {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Full arg spec from inspect.getfullargspec().
  public var fullargspec: Tensorflow_StructuredValue {
    get {return _storage._fullargspec ?? Tensorflow_StructuredValue()}
    set {_uniqueStorage()._fullargspec = newValue}
  }
  /// Returns true if `fullargspec` has been explicitly set.
  public var hasFullargspec: Bool {return _storage._fullargspec != nil}
  /// Clears the value of `fullargspec`. Subsequent reads from it will return its default value.
  public mutating func clearFullargspec() {_uniqueStorage()._fullargspec = nil}

  /// Whether this represents a class method.
  public var isMethod: Bool {
    get {return _storage._isMethod}
    set {_uniqueStorage()._isMethod = newValue}
  }

  /// Which arguments to always prepend, in case the original function is based
  /// on a functools.partial.
  public var argsToPrepend: Tensorflow_StructuredValue {
    get {return _storage._argsToPrepend ?? Tensorflow_StructuredValue()}
    set {_uniqueStorage()._argsToPrepend = newValue}
  }
  /// Returns true if `argsToPrepend` has been explicitly set.
  public var hasArgsToPrepend: Bool {return _storage._argsToPrepend != nil}
  /// Clears the value of `argsToPrepend`. Subsequent reads from it will return its default value.
  public mutating func clearArgsToPrepend() {_uniqueStorage()._argsToPrepend = nil}

  /// Which kwargs to always include, in case the original function is based on a
  /// functools.partial.
  public var kwargsToInclude: Tensorflow_StructuredValue {
    get {return _storage._kwargsToInclude ?? Tensorflow_StructuredValue()}
    set {_uniqueStorage()._kwargsToInclude = newValue}
  }
  /// Returns true if `kwargsToInclude` has been explicitly set.
  public var hasKwargsToInclude: Bool {return _storage._kwargsToInclude != nil}
  /// Clears the value of `kwargsToInclude`. Subsequent reads from it will return its default value.
  public mutating func clearKwargsToInclude() {_uniqueStorage()._kwargsToInclude = nil}

  /// The input signature, if specified.
  public var inputSignature: Tensorflow_StructuredValue {
    get {return _storage._inputSignature ?? Tensorflow_StructuredValue()}
    set {_uniqueStorage()._inputSignature = newValue}
  }
  /// Returns true if `inputSignature` has been explicitly set.
  public var hasInputSignature: Bool {return _storage._inputSignature != nil}
  /// Clears the value of `inputSignature`. Subsequent reads from it will return its default value.
  public mutating func clearInputSignature() {_uniqueStorage()._inputSignature = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tensorflow"

extension Tensorflow_SavedObjectGraph: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SavedObjectGraph"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "nodes"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.nodes)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.nodes.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.nodes, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_SavedObjectGraph, rhs: Tensorflow_SavedObjectGraph) -> Bool {
    if lhs.nodes != rhs.nodes {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tensorflow_SavedObject: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SavedObject"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "children"),
    3: .standard(proto: "slot_variables"),
    4: .standard(proto: "user_object"),
    5: .same(proto: "asset"),
    6: .same(proto: "function"),
    7: .same(proto: "variable"),
  ]

  fileprivate class _StorageClass {
    var _children: [Tensorflow_CheckpointableObjectGraph.CheckpointableObject.ObjectReference] = []
    var _slotVariables: [Tensorflow_CheckpointableObjectGraph.CheckpointableObject.SlotVariableReference] = []
    var _kind: Tensorflow_SavedObject.OneOf_Kind?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _children = source._children
      _slotVariables = source._slotVariables
      _kind = source._kind
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeRepeatedMessageField(value: &_storage._children)
        case 3: try decoder.decodeRepeatedMessageField(value: &_storage._slotVariables)
        case 4:
          var v: Tensorflow_SavedUserObject?
          if let current = _storage._kind {
            try decoder.handleConflictingOneOf()
            if case .userObject(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._kind = .userObject(v)}
        case 5:
          var v: Tensorflow_SavedAsset?
          if let current = _storage._kind {
            try decoder.handleConflictingOneOf()
            if case .asset(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._kind = .asset(v)}
        case 6:
          var v: Tensorflow_SavedPolymorphicFunction?
          if let current = _storage._kind {
            try decoder.handleConflictingOneOf()
            if case .function(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._kind = .function(v)}
        case 7:
          var v: Tensorflow_SavedVariable?
          if let current = _storage._kind {
            try decoder.handleConflictingOneOf()
            if case .variable(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._kind = .variable(v)}
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._children.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._children, fieldNumber: 1)
      }
      if !_storage._slotVariables.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._slotVariables, fieldNumber: 3)
      }
      switch _storage._kind {
      case .userObject(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      case .asset(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      case .function(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      case .variable(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_SavedObject, rhs: Tensorflow_SavedObject) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._children != rhs_storage._children {return false}
        if _storage._slotVariables != rhs_storage._slotVariables {return false}
        if _storage._kind != rhs_storage._kind {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tensorflow_SavedUserObject: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SavedUserObject"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "identifier"),
    2: .same(proto: "version"),
  ]

  fileprivate class _StorageClass {
    var _identifier: String = String()
    var _version: Tensorflow_VersionDef? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _identifier = source._identifier
      _version = source._version
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._identifier)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._version)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._identifier.isEmpty {
        try visitor.visitSingularStringField(value: _storage._identifier, fieldNumber: 1)
      }
      if let v = _storage._version {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_SavedUserObject, rhs: Tensorflow_SavedUserObject) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._identifier != rhs_storage._identifier {return false}
        if _storage._version != rhs_storage._version {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tensorflow_SavedAsset: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SavedAsset"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "asset_file_def_index"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.assetFileDefIndex)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.assetFileDefIndex != 0 {
      try visitor.visitSingularInt32Field(value: self.assetFileDefIndex, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_SavedAsset, rhs: Tensorflow_SavedAsset) -> Bool {
    if lhs.assetFileDefIndex != rhs.assetFileDefIndex {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tensorflow_SavedPolymorphicFunction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SavedPolymorphicFunction"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "monomorphic_function"),
    2: .standard(proto: "function_spec"),
  ]

  fileprivate class _StorageClass {
    var _monomorphicFunction: [Tensorflow_SavedMonomorphicFunction] = []
    var _functionSpec: Tensorflow_FunctionSpec? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _monomorphicFunction = source._monomorphicFunction
      _functionSpec = source._functionSpec
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeRepeatedMessageField(value: &_storage._monomorphicFunction)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._functionSpec)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._monomorphicFunction.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._monomorphicFunction, fieldNumber: 1)
      }
      if let v = _storage._functionSpec {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_SavedPolymorphicFunction, rhs: Tensorflow_SavedPolymorphicFunction) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._monomorphicFunction != rhs_storage._monomorphicFunction {return false}
        if _storage._functionSpec != rhs_storage._functionSpec {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tensorflow_SavedMonomorphicFunction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SavedMonomorphicFunction"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "concrete_function"),
    2: .standard(proto: "bound_inputs"),
    3: .standard(proto: "canonicalized_input_signature"),
    4: .standard(proto: "output_signature"),
  ]

  fileprivate class _StorageClass {
    var _concreteFunction: String = String()
    var _boundInputs: [Int32] = []
    var _canonicalizedInputSignature: Tensorflow_StructuredValue? = nil
    var _outputSignature: Tensorflow_StructuredValue? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _concreteFunction = source._concreteFunction
      _boundInputs = source._boundInputs
      _canonicalizedInputSignature = source._canonicalizedInputSignature
      _outputSignature = source._outputSignature
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._concreteFunction)
        case 2: try decoder.decodeRepeatedInt32Field(value: &_storage._boundInputs)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._canonicalizedInputSignature)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._outputSignature)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._concreteFunction.isEmpty {
        try visitor.visitSingularStringField(value: _storage._concreteFunction, fieldNumber: 1)
      }
      if !_storage._boundInputs.isEmpty {
        try visitor.visitPackedInt32Field(value: _storage._boundInputs, fieldNumber: 2)
      }
      if let v = _storage._canonicalizedInputSignature {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._outputSignature {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_SavedMonomorphicFunction, rhs: Tensorflow_SavedMonomorphicFunction) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._concreteFunction != rhs_storage._concreteFunction {return false}
        if _storage._boundInputs != rhs_storage._boundInputs {return false}
        if _storage._canonicalizedInputSignature != rhs_storage._canonicalizedInputSignature {return false}
        if _storage._outputSignature != rhs_storage._outputSignature {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tensorflow_SavedVariable: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SavedVariable"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "dtype"),
    2: .same(proto: "shape"),
    3: .same(proto: "trainable"),
  ]

  fileprivate class _StorageClass {
    var _dtype: Tensorflow_DataType = .dtInvalid
    var _shape: Tensorflow_TensorShapeProto? = nil
    var _trainable: Bool = false

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _dtype = source._dtype
      _shape = source._shape
      _trainable = source._trainable
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularEnumField(value: &_storage._dtype)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._shape)
        case 3: try decoder.decodeSingularBoolField(value: &_storage._trainable)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._dtype != .dtInvalid {
        try visitor.visitSingularEnumField(value: _storage._dtype, fieldNumber: 1)
      }
      if let v = _storage._shape {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if _storage._trainable != false {
        try visitor.visitSingularBoolField(value: _storage._trainable, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_SavedVariable, rhs: Tensorflow_SavedVariable) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._dtype != rhs_storage._dtype {return false}
        if _storage._shape != rhs_storage._shape {return false}
        if _storage._trainable != rhs_storage._trainable {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tensorflow_FunctionSpec: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FunctionSpec"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "fullargspec"),
    2: .standard(proto: "is_method"),
    3: .standard(proto: "args_to_prepend"),
    4: .standard(proto: "kwargs_to_include"),
    5: .standard(proto: "input_signature"),
  ]

  fileprivate class _StorageClass {
    var _fullargspec: Tensorflow_StructuredValue? = nil
    var _isMethod: Bool = false
    var _argsToPrepend: Tensorflow_StructuredValue? = nil
    var _kwargsToInclude: Tensorflow_StructuredValue? = nil
    var _inputSignature: Tensorflow_StructuredValue? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _fullargspec = source._fullargspec
      _isMethod = source._isMethod
      _argsToPrepend = source._argsToPrepend
      _kwargsToInclude = source._kwargsToInclude
      _inputSignature = source._inputSignature
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._fullargspec)
        case 2: try decoder.decodeSingularBoolField(value: &_storage._isMethod)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._argsToPrepend)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._kwargsToInclude)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._inputSignature)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._fullargspec {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if _storage._isMethod != false {
        try visitor.visitSingularBoolField(value: _storage._isMethod, fieldNumber: 2)
      }
      if let v = _storage._argsToPrepend {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._kwargsToInclude {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._inputSignature {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_FunctionSpec, rhs: Tensorflow_FunctionSpec) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._fullargspec != rhs_storage._fullargspec {return false}
        if _storage._isMethod != rhs_storage._isMethod {return false}
        if _storage._argsToPrepend != rhs_storage._argsToPrepend {return false}
        if _storage._kwargsToInclude != rhs_storage._kwargsToInclude {return false}
        if _storage._inputSignature != rhs_storage._inputSignature {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}