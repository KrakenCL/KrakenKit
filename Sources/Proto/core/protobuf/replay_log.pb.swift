// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tensorflow/core/protobuf/replay_log.proto
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

/// Records the creation of a new replay session.  We record the device listing
/// here to capture the state of the cluster.
public struct Tensorflow_NewReplaySession {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var devices: Tensorflow_ListDevicesResponse {
    get {return _storage._devices ?? Tensorflow_ListDevicesResponse()}
    set {_uniqueStorage()._devices = newValue}
  }
  /// Returns true if `devices` has been explicitly set.
  public var hasDevices: Bool {return _storage._devices != nil}
  /// Clears the value of `devices`. Subsequent reads from it will return its default value.
  public mutating func clearDevices() {_uniqueStorage()._devices = nil}

  public var sessionHandle: String {
    get {return _storage._sessionHandle}
    set {_uniqueStorage()._sessionHandle = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Tensorflow_ReplayOp {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var startTimeUs: Double {
    get {return _storage._startTimeUs}
    set {_uniqueStorage()._startTimeUs = newValue}
  }

  public var endTimeUs: Double {
    get {return _storage._endTimeUs}
    set {_uniqueStorage()._endTimeUs = newValue}
  }

  public var op: OneOf_Op? {
    get {return _storage._op}
    set {_uniqueStorage()._op = newValue}
  }

  public var createSession: Tensorflow_CreateSessionRequest {
    get {
      if case .createSession(let v)? = _storage._op {return v}
      return Tensorflow_CreateSessionRequest()
    }
    set {_uniqueStorage()._op = .createSession(newValue)}
  }

  public var extendSession: Tensorflow_ExtendSessionRequest {
    get {
      if case .extendSession(let v)? = _storage._op {return v}
      return Tensorflow_ExtendSessionRequest()
    }
    set {_uniqueStorage()._op = .extendSession(newValue)}
  }

  public var partialRunSetup: Tensorflow_PartialRunSetupRequest {
    get {
      if case .partialRunSetup(let v)? = _storage._op {return v}
      return Tensorflow_PartialRunSetupRequest()
    }
    set {_uniqueStorage()._op = .partialRunSetup(newValue)}
  }

  public var runStep: Tensorflow_RunStepRequest {
    get {
      if case .runStep(let v)? = _storage._op {return v}
      return Tensorflow_RunStepRequest()
    }
    set {_uniqueStorage()._op = .runStep(newValue)}
  }

  public var closeSession: Tensorflow_CloseSessionRequest {
    get {
      if case .closeSession(let v)? = _storage._op {return v}
      return Tensorflow_CloseSessionRequest()
    }
    set {_uniqueStorage()._op = .closeSession(newValue)}
  }

  public var listDevices: Tensorflow_ListDevicesRequest {
    get {
      if case .listDevices(let v)? = _storage._op {return v}
      return Tensorflow_ListDevicesRequest()
    }
    set {_uniqueStorage()._op = .listDevices(newValue)}
  }

  public var resetRequest: Tensorflow_ResetRequest {
    get {
      if case .resetRequest(let v)? = _storage._op {return v}
      return Tensorflow_ResetRequest()
    }
    set {_uniqueStorage()._op = .resetRequest(newValue)}
  }

  public var makeCallable: Tensorflow_MakeCallableRequest {
    get {
      if case .makeCallable(let v)? = _storage._op {return v}
      return Tensorflow_MakeCallableRequest()
    }
    set {_uniqueStorage()._op = .makeCallable(newValue)}
  }

  public var runCallable: Tensorflow_RunCallableRequest {
    get {
      if case .runCallable(let v)? = _storage._op {return v}
      return Tensorflow_RunCallableRequest()
    }
    set {_uniqueStorage()._op = .runCallable(newValue)}
  }

  public var releaseCallable: Tensorflow_ReleaseCallableRequest {
    get {
      if case .releaseCallable(let v)? = _storage._op {return v}
      return Tensorflow_ReleaseCallableRequest()
    }
    set {_uniqueStorage()._op = .releaseCallable(newValue)}
  }

  public var newReplaySession: Tensorflow_NewReplaySession {
    get {
      if case .newReplaySession(let v)? = _storage._op {return v}
      return Tensorflow_NewReplaySession()
    }
    set {_uniqueStorage()._op = .newReplaySession(newValue)}
  }

  public var response: OneOf_Response? {
    get {return _storage._response}
    set {_uniqueStorage()._response = newValue}
  }

  public var createSessionResponse: Tensorflow_CreateSessionResponse {
    get {
      if case .createSessionResponse(let v)? = _storage._response {return v}
      return Tensorflow_CreateSessionResponse()
    }
    set {_uniqueStorage()._response = .createSessionResponse(newValue)}
  }

  public var extendSessionResponse: Tensorflow_ExtendSessionResponse {
    get {
      if case .extendSessionResponse(let v)? = _storage._response {return v}
      return Tensorflow_ExtendSessionResponse()
    }
    set {_uniqueStorage()._response = .extendSessionResponse(newValue)}
  }

  public var partialRunSetupResponse: Tensorflow_PartialRunSetupResponse {
    get {
      if case .partialRunSetupResponse(let v)? = _storage._response {return v}
      return Tensorflow_PartialRunSetupResponse()
    }
    set {_uniqueStorage()._response = .partialRunSetupResponse(newValue)}
  }

  public var runStepResponse: Tensorflow_RunStepResponse {
    get {
      if case .runStepResponse(let v)? = _storage._response {return v}
      return Tensorflow_RunStepResponse()
    }
    set {_uniqueStorage()._response = .runStepResponse(newValue)}
  }

  public var closeSessionResponse: Tensorflow_CloseSessionResponse {
    get {
      if case .closeSessionResponse(let v)? = _storage._response {return v}
      return Tensorflow_CloseSessionResponse()
    }
    set {_uniqueStorage()._response = .closeSessionResponse(newValue)}
  }

  public var listDevicesResponse: Tensorflow_ListDevicesResponse {
    get {
      if case .listDevicesResponse(let v)? = _storage._response {return v}
      return Tensorflow_ListDevicesResponse()
    }
    set {_uniqueStorage()._response = .listDevicesResponse(newValue)}
  }

  public var resetRequestResponse: Tensorflow_ResetResponse {
    get {
      if case .resetRequestResponse(let v)? = _storage._response {return v}
      return Tensorflow_ResetResponse()
    }
    set {_uniqueStorage()._response = .resetRequestResponse(newValue)}
  }

  public var makeCallableResponse: Tensorflow_MakeCallableResponse {
    get {
      if case .makeCallableResponse(let v)? = _storage._response {return v}
      return Tensorflow_MakeCallableResponse()
    }
    set {_uniqueStorage()._response = .makeCallableResponse(newValue)}
  }

  public var runCallableResponse: Tensorflow_RunCallableResponse {
    get {
      if case .runCallableResponse(let v)? = _storage._response {return v}
      return Tensorflow_RunCallableResponse()
    }
    set {_uniqueStorage()._response = .runCallableResponse(newValue)}
  }

  public var releaseCallableResponse: Tensorflow_ReleaseCallableResponse {
    get {
      if case .releaseCallableResponse(let v)? = _storage._response {return v}
      return Tensorflow_ReleaseCallableResponse()
    }
    set {_uniqueStorage()._response = .releaseCallableResponse(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_Op: Equatable {
    case createSession(Tensorflow_CreateSessionRequest)
    case extendSession(Tensorflow_ExtendSessionRequest)
    case partialRunSetup(Tensorflow_PartialRunSetupRequest)
    case runStep(Tensorflow_RunStepRequest)
    case closeSession(Tensorflow_CloseSessionRequest)
    case listDevices(Tensorflow_ListDevicesRequest)
    case resetRequest(Tensorflow_ResetRequest)
    case makeCallable(Tensorflow_MakeCallableRequest)
    case runCallable(Tensorflow_RunCallableRequest)
    case releaseCallable(Tensorflow_ReleaseCallableRequest)
    case newReplaySession(Tensorflow_NewReplaySession)

  #if !swift(>=4.1)
    public static func ==(lhs: Tensorflow_ReplayOp.OneOf_Op, rhs: Tensorflow_ReplayOp.OneOf_Op) -> Bool {
      switch (lhs, rhs) {
      case (.createSession(let l), .createSession(let r)): return l == r
      case (.extendSession(let l), .extendSession(let r)): return l == r
      case (.partialRunSetup(let l), .partialRunSetup(let r)): return l == r
      case (.runStep(let l), .runStep(let r)): return l == r
      case (.closeSession(let l), .closeSession(let r)): return l == r
      case (.listDevices(let l), .listDevices(let r)): return l == r
      case (.resetRequest(let l), .resetRequest(let r)): return l == r
      case (.makeCallable(let l), .makeCallable(let r)): return l == r
      case (.runCallable(let l), .runCallable(let r)): return l == r
      case (.releaseCallable(let l), .releaseCallable(let r)): return l == r
      case (.newReplaySession(let l), .newReplaySession(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public enum OneOf_Response: Equatable {
    case createSessionResponse(Tensorflow_CreateSessionResponse)
    case extendSessionResponse(Tensorflow_ExtendSessionResponse)
    case partialRunSetupResponse(Tensorflow_PartialRunSetupResponse)
    case runStepResponse(Tensorflow_RunStepResponse)
    case closeSessionResponse(Tensorflow_CloseSessionResponse)
    case listDevicesResponse(Tensorflow_ListDevicesResponse)
    case resetRequestResponse(Tensorflow_ResetResponse)
    case makeCallableResponse(Tensorflow_MakeCallableResponse)
    case runCallableResponse(Tensorflow_RunCallableResponse)
    case releaseCallableResponse(Tensorflow_ReleaseCallableResponse)

  #if !swift(>=4.1)
    public static func ==(lhs: Tensorflow_ReplayOp.OneOf_Response, rhs: Tensorflow_ReplayOp.OneOf_Response) -> Bool {
      switch (lhs, rhs) {
      case (.createSessionResponse(let l), .createSessionResponse(let r)): return l == r
      case (.extendSessionResponse(let l), .extendSessionResponse(let r)): return l == r
      case (.partialRunSetupResponse(let l), .partialRunSetupResponse(let r)): return l == r
      case (.runStepResponse(let l), .runStepResponse(let r)): return l == r
      case (.closeSessionResponse(let l), .closeSessionResponse(let r)): return l == r
      case (.listDevicesResponse(let l), .listDevicesResponse(let r)): return l == r
      case (.resetRequestResponse(let l), .resetRequestResponse(let r)): return l == r
      case (.makeCallableResponse(let l), .makeCallableResponse(let r)): return l == r
      case (.runCallableResponse(let l), .runCallableResponse(let r)): return l == r
      case (.releaseCallableResponse(let l), .releaseCallableResponse(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tensorflow"

extension Tensorflow_NewReplaySession: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".NewReplaySession"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "devices"),
    2: .standard(proto: "session_handle"),
  ]

  fileprivate class _StorageClass {
    var _devices: Tensorflow_ListDevicesResponse? = nil
    var _sessionHandle: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _devices = source._devices
      _sessionHandle = source._sessionHandle
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._devices)
        case 2: try decoder.decodeSingularStringField(value: &_storage._sessionHandle)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._devices {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._sessionHandle.isEmpty {
        try visitor.visitSingularStringField(value: _storage._sessionHandle, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_NewReplaySession, rhs: Tensorflow_NewReplaySession) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._devices != rhs_storage._devices {return false}
        if _storage._sessionHandle != rhs_storage._sessionHandle {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tensorflow_ReplayOp: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ReplayOp"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    31: .standard(proto: "start_time_us"),
    32: .standard(proto: "end_time_us"),
    1: .standard(proto: "create_session"),
    2: .standard(proto: "extend_session"),
    3: .standard(proto: "partial_run_setup"),
    4: .standard(proto: "run_step"),
    5: .standard(proto: "close_session"),
    6: .standard(proto: "list_devices"),
    7: .standard(proto: "reset_request"),
    8: .standard(proto: "make_callable"),
    9: .standard(proto: "run_callable"),
    10: .standard(proto: "release_callable"),
    11: .standard(proto: "new_replay_session"),
    21: .standard(proto: "create_session_response"),
    22: .standard(proto: "extend_session_response"),
    23: .standard(proto: "partial_run_setup_response"),
    24: .standard(proto: "run_step_response"),
    25: .standard(proto: "close_session_response"),
    26: .standard(proto: "list_devices_response"),
    27: .standard(proto: "reset_request_response"),
    28: .standard(proto: "make_callable_response"),
    29: .standard(proto: "run_callable_response"),
    30: .standard(proto: "release_callable_response"),
  ]

  fileprivate class _StorageClass {
    var _startTimeUs: Double = 0
    var _endTimeUs: Double = 0
    var _op: Tensorflow_ReplayOp.OneOf_Op?
    var _response: Tensorflow_ReplayOp.OneOf_Response?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _startTimeUs = source._startTimeUs
      _endTimeUs = source._endTimeUs
      _op = source._op
      _response = source._response
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
        case 1:
          var v: Tensorflow_CreateSessionRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .createSession(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .createSession(v)}
        case 2:
          var v: Tensorflow_ExtendSessionRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .extendSession(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .extendSession(v)}
        case 3:
          var v: Tensorflow_PartialRunSetupRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .partialRunSetup(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .partialRunSetup(v)}
        case 4:
          var v: Tensorflow_RunStepRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .runStep(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .runStep(v)}
        case 5:
          var v: Tensorflow_CloseSessionRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .closeSession(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .closeSession(v)}
        case 6:
          var v: Tensorflow_ListDevicesRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .listDevices(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .listDevices(v)}
        case 7:
          var v: Tensorflow_ResetRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .resetRequest(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .resetRequest(v)}
        case 8:
          var v: Tensorflow_MakeCallableRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .makeCallable(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .makeCallable(v)}
        case 9:
          var v: Tensorflow_RunCallableRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .runCallable(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .runCallable(v)}
        case 10:
          var v: Tensorflow_ReleaseCallableRequest?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .releaseCallable(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .releaseCallable(v)}
        case 11:
          var v: Tensorflow_NewReplaySession?
          if let current = _storage._op {
            try decoder.handleConflictingOneOf()
            if case .newReplaySession(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._op = .newReplaySession(v)}
        case 21:
          var v: Tensorflow_CreateSessionResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .createSessionResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .createSessionResponse(v)}
        case 22:
          var v: Tensorflow_ExtendSessionResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .extendSessionResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .extendSessionResponse(v)}
        case 23:
          var v: Tensorflow_PartialRunSetupResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .partialRunSetupResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .partialRunSetupResponse(v)}
        case 24:
          var v: Tensorflow_RunStepResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .runStepResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .runStepResponse(v)}
        case 25:
          var v: Tensorflow_CloseSessionResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .closeSessionResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .closeSessionResponse(v)}
        case 26:
          var v: Tensorflow_ListDevicesResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .listDevicesResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .listDevicesResponse(v)}
        case 27:
          var v: Tensorflow_ResetResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .resetRequestResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .resetRequestResponse(v)}
        case 28:
          var v: Tensorflow_MakeCallableResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .makeCallableResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .makeCallableResponse(v)}
        case 29:
          var v: Tensorflow_RunCallableResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .runCallableResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .runCallableResponse(v)}
        case 30:
          var v: Tensorflow_ReleaseCallableResponse?
          if let current = _storage._response {
            try decoder.handleConflictingOneOf()
            if case .releaseCallableResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._response = .releaseCallableResponse(v)}
        case 31: try decoder.decodeSingularDoubleField(value: &_storage._startTimeUs)
        case 32: try decoder.decodeSingularDoubleField(value: &_storage._endTimeUs)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      switch _storage._op {
      case .createSession(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      case .extendSession(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      case .partialRunSetup(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      case .runStep(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      case .closeSession(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      case .listDevices(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      case .resetRequest(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
      case .makeCallable(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
      case .runCallable(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
      case .releaseCallable(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      case .newReplaySession(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      case nil: break
      }
      switch _storage._response {
      case .createSessionResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 21)
      case .extendSessionResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 22)
      case .partialRunSetupResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 23)
      case .runStepResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 24)
      case .closeSessionResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 25)
      case .listDevicesResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 26)
      case .resetRequestResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 27)
      case .makeCallableResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 28)
      case .runCallableResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 29)
      case .releaseCallableResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 30)
      case nil: break
      }
      if _storage._startTimeUs != 0 {
        try visitor.visitSingularDoubleField(value: _storage._startTimeUs, fieldNumber: 31)
      }
      if _storage._endTimeUs != 0 {
        try visitor.visitSingularDoubleField(value: _storage._endTimeUs, fieldNumber: 32)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Tensorflow_ReplayOp, rhs: Tensorflow_ReplayOp) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._startTimeUs != rhs_storage._startTimeUs {return false}
        if _storage._endTimeUs != rhs_storage._endTimeUs {return false}
        if _storage._op != rhs_storage._op {return false}
        if _storage._response != rhs_storage._response {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
