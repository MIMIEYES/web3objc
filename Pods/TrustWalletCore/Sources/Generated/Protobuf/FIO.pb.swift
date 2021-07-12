// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: FIO.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// A public blockchain address, such as {"BTC", "bc1qvy4074rggkdr2pzw5vpnn62eg0smzlxwp70d7v"}
public struct TW_FIO_Proto_PublicAddress {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Coin symbol for the address (a.k.a. tokenCode)
  public var coinSymbol: String = String()

  /// The address
  public var address: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Payload content for New Funds requests
public struct TW_FIO_Proto_NewFundsContent {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Public addressed of the payee, on the mentioned blockchain.
  public var payeePublicAddress: String = String()

  /// Amount requested (as string)
  public var amount: String = String()

  /// Coin symbol of the amount requested (a.k.a. tokenCode)
  public var coinSymbol: String = String()

  /// Memo free text.  Optional, may be empty.
  public var memo: String = String()

  /// Hash.  Optional, may be empty.
  public var hash: String = String()

  /// Attached offline URL.  Optional, may be empty.
  public var offlineURL: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Different Actions
public struct TW_FIO_Proto_Action {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var messageOneof: TW_FIO_Proto_Action.OneOf_MessageOneof? = nil

  public var registerFioAddressMessage: TW_FIO_Proto_Action.RegisterFioAddress {
    get {
      if case .registerFioAddressMessage(let v)? = messageOneof {return v}
      return TW_FIO_Proto_Action.RegisterFioAddress()
    }
    set {messageOneof = .registerFioAddressMessage(newValue)}
  }

  public var addPubAddressMessage: TW_FIO_Proto_Action.AddPubAddress {
    get {
      if case .addPubAddressMessage(let v)? = messageOneof {return v}
      return TW_FIO_Proto_Action.AddPubAddress()
    }
    set {messageOneof = .addPubAddressMessage(newValue)}
  }

  public var transferMessage: TW_FIO_Proto_Action.Transfer {
    get {
      if case .transferMessage(let v)? = messageOneof {return v}
      return TW_FIO_Proto_Action.Transfer()
    }
    set {messageOneof = .transferMessage(newValue)}
  }

  public var renewFioAddressMessage: TW_FIO_Proto_Action.RenewFioAddress {
    get {
      if case .renewFioAddressMessage(let v)? = messageOneof {return v}
      return TW_FIO_Proto_Action.RenewFioAddress()
    }
    set {messageOneof = .renewFioAddressMessage(newValue)}
  }

  public var newFundsRequestMessage: TW_FIO_Proto_Action.NewFundsRequest {
    get {
      if case .newFundsRequestMessage(let v)? = messageOneof {return v}
      return TW_FIO_Proto_Action.NewFundsRequest()
    }
    set {messageOneof = .newFundsRequestMessage(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_MessageOneof: Equatable {
    case registerFioAddressMessage(TW_FIO_Proto_Action.RegisterFioAddress)
    case addPubAddressMessage(TW_FIO_Proto_Action.AddPubAddress)
    case transferMessage(TW_FIO_Proto_Action.Transfer)
    case renewFioAddressMessage(TW_FIO_Proto_Action.RenewFioAddress)
    case newFundsRequestMessage(TW_FIO_Proto_Action.NewFundsRequest)

  #if !swift(>=4.1)
    public static func ==(lhs: TW_FIO_Proto_Action.OneOf_MessageOneof, rhs: TW_FIO_Proto_Action.OneOf_MessageOneof) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.registerFioAddressMessage, .registerFioAddressMessage): return {
        guard case .registerFioAddressMessage(let l) = lhs, case .registerFioAddressMessage(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.addPubAddressMessage, .addPubAddressMessage): return {
        guard case .addPubAddressMessage(let l) = lhs, case .addPubAddressMessage(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.transferMessage, .transferMessage): return {
        guard case .transferMessage(let l) = lhs, case .transferMessage(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.renewFioAddressMessage, .renewFioAddressMessage): return {
        guard case .renewFioAddressMessage(let l) = lhs, case .renewFioAddressMessage(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.newFundsRequestMessage, .newFundsRequestMessage): return {
        guard case .newFundsRequestMessage(let l) = lhs, case .newFundsRequestMessage(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  /// Action for registering a FIO name; register_fio_address
  public struct RegisterFioAddress {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// The FIO name to be registered. Ex.: "alice@trust"
    public var fioAddress: String = String()

    /// FIO address of the owner. Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
    public var ownerFioPublicKey: String = String()

    /// Max fee to spend, can be obtained using get_fee API.
    public var fee: UInt64 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Acion for adding public chain addresses to a FIO name; add_pub_address
  public struct AddPubAddress {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// The FIO name already registered to the owner. Ex.: "alice@trust"
    public var fioAddress: String = String()

    /// List of public addresses to be registered, ex. {{"BTC", "bc1qv...7v"},{"BNB", "bnb1ts3...9s"}}
    public var publicAddresses: [TW_FIO_Proto_PublicAddress] = []

    /// Max fee to spend, can be obtained using get_fee API.
    public var fee: UInt64 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Action for transfering FIO coins; transfer_tokens_pub_key
  public struct Transfer {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// FIO address of the payee. Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
    public var payeePublicKey: String = String()

    /// Amount of FIO coins to be transferred.
    public var amount: UInt64 = 0

    /// Max fee to spend, can be obtained using get_fee API.
    public var fee: UInt64 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Action for renewing a FIO name; renew_fio_address
  public struct RenewFioAddress {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// The FIO name to be renewed. Ex.: "alice@trust"
    public var fioAddress: String = String()

    /// FIO address of the owner. Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
    public var ownerFioPublicKey: String = String()

    /// Max fee to spend, can be obtained using get_fee API.
    public var fee: UInt64 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  /// Action for creating a new payment request; new_funds_request
  public struct NewFundsRequest {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// The FIO name of the requested payer. Ex.: "alice@trust"
    public var payerFioName: String = String()

    /// The FIO address (not name) of the payer, owner of payee_fio_name.  Ex.: "FIO6m1fMdTpRkRBnedvYshXCxLFiC5suRU8KDfx8xxtXp2hntxpnf"
    public var payerFioAddress: String = String()

    /// Own FIO name.  Ex.: "bob@trust"
    public var payeeFioName: String = String()

    /// Payload content of the request
    public var content: TW_FIO_Proto_NewFundsContent {
      get {return _content ?? TW_FIO_Proto_NewFundsContent()}
      set {_content = newValue}
    }
    /// Returns true if `content` has been explicitly set.
    public var hasContent: Bool {return self._content != nil}
    /// Clears the value of `content`. Subsequent reads from it will return its default value.
    public mutating func clearContent() {self._content = nil}

    /// Max fee to spend, can be obtained using get_fee API.
    public var fee: UInt64 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}

    fileprivate var _content: TW_FIO_Proto_NewFundsContent? = nil
  }

  public init() {}
}

/// Represents current parameters of the FIO blockchain
public struct TW_FIO_Proto_ChainParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Constant chainId (32 bytes), obtained from get_info API
  public var chainID: Data = Data()

  /// The last block number, obtained from get_info API
  public var headBlockNumber: UInt64 = 0

  /// Block prefix of last block, obtained from get_block API
  public var refBlockPrefix: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Transaction signing input
public struct TW_FIO_Proto_SigningInput {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Expiry for this message, in unix time. Can be 0, then it is taken from current time with default expiry
  public var expiry: UInt32 = 0

  /// Current parameters of the FIO blockchain
  public var chainParams: TW_FIO_Proto_ChainParams {
    get {return _chainParams ?? TW_FIO_Proto_ChainParams()}
    set {_chainParams = newValue}
  }
  /// Returns true if `chainParams` has been explicitly set.
  public var hasChainParams: Bool {return self._chainParams != nil}
  /// Clears the value of `chainParams`. Subsequent reads from it will return its default value.
  public mutating func clearChainParams() {self._chainParams = nil}

  /// The private key matching the address, needed for signing
  public var privateKey: Data = Data()

  /// The FIO name of the originating wallet (project-wide constant)
  public var tpid: String = String()

  /// Context-specific action data
  public var action: TW_FIO_Proto_Action {
    get {return _action ?? TW_FIO_Proto_Action()}
    set {_action = newValue}
  }
  /// Returns true if `action` has been explicitly set.
  public var hasAction: Bool {return self._action != nil}
  /// Clears the value of `action`. Subsequent reads from it will return its default value.
  public mutating func clearAction() {self._action = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _chainParams: TW_FIO_Proto_ChainParams? = nil
  fileprivate var _action: TW_FIO_Proto_Action? = nil
}

/// Transaction signing output
public struct TW_FIO_Proto_SigningOutput {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Signed transaction in JSON
  public var json: String = String()

  /// Optional error
  public var error: TW_Common_Proto_SigningError = .ok

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "TW.FIO.Proto"

extension TW_FIO_Proto_PublicAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PublicAddress"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "coin_symbol"),
    2: .same(proto: "address"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.coinSymbol) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.address) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.coinSymbol.isEmpty {
      try visitor.visitSingularStringField(value: self.coinSymbol, fieldNumber: 1)
    }
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_PublicAddress, rhs: TW_FIO_Proto_PublicAddress) -> Bool {
    if lhs.coinSymbol != rhs.coinSymbol {return false}
    if lhs.address != rhs.address {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_NewFundsContent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".NewFundsContent"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "payee_public_address"),
    2: .same(proto: "amount"),
    3: .standard(proto: "coin_symbol"),
    4: .same(proto: "memo"),
    5: .same(proto: "hash"),
    6: .standard(proto: "offline_url"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.payeePublicAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.amount) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.coinSymbol) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.memo) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.hash) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.offlineURL) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.payeePublicAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.payeePublicAddress, fieldNumber: 1)
    }
    if !self.amount.isEmpty {
      try visitor.visitSingularStringField(value: self.amount, fieldNumber: 2)
    }
    if !self.coinSymbol.isEmpty {
      try visitor.visitSingularStringField(value: self.coinSymbol, fieldNumber: 3)
    }
    if !self.memo.isEmpty {
      try visitor.visitSingularStringField(value: self.memo, fieldNumber: 4)
    }
    if !self.hash.isEmpty {
      try visitor.visitSingularStringField(value: self.hash, fieldNumber: 5)
    }
    if !self.offlineURL.isEmpty {
      try visitor.visitSingularStringField(value: self.offlineURL, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_NewFundsContent, rhs: TW_FIO_Proto_NewFundsContent) -> Bool {
    if lhs.payeePublicAddress != rhs.payeePublicAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.coinSymbol != rhs.coinSymbol {return false}
    if lhs.memo != rhs.memo {return false}
    if lhs.hash != rhs.hash {return false}
    if lhs.offlineURL != rhs.offlineURL {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_Action: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Action"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "register_fio_address_message"),
    2: .standard(proto: "add_pub_address_message"),
    3: .standard(proto: "transfer_message"),
    4: .standard(proto: "renew_fio_address_message"),
    5: .standard(proto: "new_funds_request_message"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: TW_FIO_Proto_Action.RegisterFioAddress?
        if let current = self.messageOneof {
          try decoder.handleConflictingOneOf()
          if case .registerFioAddressMessage(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.messageOneof = .registerFioAddressMessage(v)}
      }()
      case 2: try {
        var v: TW_FIO_Proto_Action.AddPubAddress?
        if let current = self.messageOneof {
          try decoder.handleConflictingOneOf()
          if case .addPubAddressMessage(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.messageOneof = .addPubAddressMessage(v)}
      }()
      case 3: try {
        var v: TW_FIO_Proto_Action.Transfer?
        if let current = self.messageOneof {
          try decoder.handleConflictingOneOf()
          if case .transferMessage(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.messageOneof = .transferMessage(v)}
      }()
      case 4: try {
        var v: TW_FIO_Proto_Action.RenewFioAddress?
        if let current = self.messageOneof {
          try decoder.handleConflictingOneOf()
          if case .renewFioAddressMessage(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.messageOneof = .renewFioAddressMessage(v)}
      }()
      case 5: try {
        var v: TW_FIO_Proto_Action.NewFundsRequest?
        if let current = self.messageOneof {
          try decoder.handleConflictingOneOf()
          if case .newFundsRequestMessage(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.messageOneof = .newFundsRequestMessage(v)}
      }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.messageOneof {
    case .registerFioAddressMessage?: try {
      guard case .registerFioAddressMessage(let v)? = self.messageOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }()
    case .addPubAddressMessage?: try {
      guard case .addPubAddressMessage(let v)? = self.messageOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case .transferMessage?: try {
      guard case .transferMessage(let v)? = self.messageOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }()
    case .renewFioAddressMessage?: try {
      guard case .renewFioAddressMessage(let v)? = self.messageOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }()
    case .newFundsRequestMessage?: try {
      guard case .newFundsRequestMessage(let v)? = self.messageOneof else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_Action, rhs: TW_FIO_Proto_Action) -> Bool {
    if lhs.messageOneof != rhs.messageOneof {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_Action.RegisterFioAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = TW_FIO_Proto_Action.protoMessageName + ".RegisterFioAddress"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "fio_address"),
    2: .standard(proto: "owner_fio_public_key"),
    3: .same(proto: "fee"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fioAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.ownerFioPublicKey) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.fee) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fioAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.fioAddress, fieldNumber: 1)
    }
    if !self.ownerFioPublicKey.isEmpty {
      try visitor.visitSingularStringField(value: self.ownerFioPublicKey, fieldNumber: 2)
    }
    if self.fee != 0 {
      try visitor.visitSingularUInt64Field(value: self.fee, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_Action.RegisterFioAddress, rhs: TW_FIO_Proto_Action.RegisterFioAddress) -> Bool {
    if lhs.fioAddress != rhs.fioAddress {return false}
    if lhs.ownerFioPublicKey != rhs.ownerFioPublicKey {return false}
    if lhs.fee != rhs.fee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_Action.AddPubAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = TW_FIO_Proto_Action.protoMessageName + ".AddPubAddress"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "fio_address"),
    2: .standard(proto: "public_addresses"),
    3: .same(proto: "fee"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fioAddress) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.publicAddresses) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.fee) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fioAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.fioAddress, fieldNumber: 1)
    }
    if !self.publicAddresses.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.publicAddresses, fieldNumber: 2)
    }
    if self.fee != 0 {
      try visitor.visitSingularUInt64Field(value: self.fee, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_Action.AddPubAddress, rhs: TW_FIO_Proto_Action.AddPubAddress) -> Bool {
    if lhs.fioAddress != rhs.fioAddress {return false}
    if lhs.publicAddresses != rhs.publicAddresses {return false}
    if lhs.fee != rhs.fee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_Action.Transfer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = TW_FIO_Proto_Action.protoMessageName + ".Transfer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "payee_public_key"),
    2: .same(proto: "amount"),
    3: .same(proto: "fee"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.payeePublicKey) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.amount) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.fee) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.payeePublicKey.isEmpty {
      try visitor.visitSingularStringField(value: self.payeePublicKey, fieldNumber: 1)
    }
    if self.amount != 0 {
      try visitor.visitSingularUInt64Field(value: self.amount, fieldNumber: 2)
    }
    if self.fee != 0 {
      try visitor.visitSingularUInt64Field(value: self.fee, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_Action.Transfer, rhs: TW_FIO_Proto_Action.Transfer) -> Bool {
    if lhs.payeePublicKey != rhs.payeePublicKey {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.fee != rhs.fee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_Action.RenewFioAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = TW_FIO_Proto_Action.protoMessageName + ".RenewFioAddress"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "fio_address"),
    2: .standard(proto: "owner_fio_public_key"),
    3: .same(proto: "fee"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.fioAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.ownerFioPublicKey) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.fee) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.fioAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.fioAddress, fieldNumber: 1)
    }
    if !self.ownerFioPublicKey.isEmpty {
      try visitor.visitSingularStringField(value: self.ownerFioPublicKey, fieldNumber: 2)
    }
    if self.fee != 0 {
      try visitor.visitSingularUInt64Field(value: self.fee, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_Action.RenewFioAddress, rhs: TW_FIO_Proto_Action.RenewFioAddress) -> Bool {
    if lhs.fioAddress != rhs.fioAddress {return false}
    if lhs.ownerFioPublicKey != rhs.ownerFioPublicKey {return false}
    if lhs.fee != rhs.fee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_Action.NewFundsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = TW_FIO_Proto_Action.protoMessageName + ".NewFundsRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "payer_fio_name"),
    2: .standard(proto: "payer_fio_address"),
    3: .standard(proto: "payee_fio_name"),
    4: .same(proto: "content"),
    5: .same(proto: "fee"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.payerFioName) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.payerFioAddress) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.payeeFioName) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._content) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.fee) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.payerFioName.isEmpty {
      try visitor.visitSingularStringField(value: self.payerFioName, fieldNumber: 1)
    }
    if !self.payerFioAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.payerFioAddress, fieldNumber: 2)
    }
    if !self.payeeFioName.isEmpty {
      try visitor.visitSingularStringField(value: self.payeeFioName, fieldNumber: 3)
    }
    if let v = self._content {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if self.fee != 0 {
      try visitor.visitSingularUInt64Field(value: self.fee, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_Action.NewFundsRequest, rhs: TW_FIO_Proto_Action.NewFundsRequest) -> Bool {
    if lhs.payerFioName != rhs.payerFioName {return false}
    if lhs.payerFioAddress != rhs.payerFioAddress {return false}
    if lhs.payeeFioName != rhs.payeeFioName {return false}
    if lhs._content != rhs._content {return false}
    if lhs.fee != rhs.fee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_ChainParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ChainParams"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "chain_id"),
    2: .standard(proto: "head_block_number"),
    3: .standard(proto: "ref_block_prefix"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.chainID) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.headBlockNumber) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.refBlockPrefix) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.chainID.isEmpty {
      try visitor.visitSingularBytesField(value: self.chainID, fieldNumber: 1)
    }
    if self.headBlockNumber != 0 {
      try visitor.visitSingularUInt64Field(value: self.headBlockNumber, fieldNumber: 2)
    }
    if self.refBlockPrefix != 0 {
      try visitor.visitSingularUInt64Field(value: self.refBlockPrefix, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_ChainParams, rhs: TW_FIO_Proto_ChainParams) -> Bool {
    if lhs.chainID != rhs.chainID {return false}
    if lhs.headBlockNumber != rhs.headBlockNumber {return false}
    if lhs.refBlockPrefix != rhs.refBlockPrefix {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_SigningInput: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningInput"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "expiry"),
    2: .standard(proto: "chain_params"),
    3: .standard(proto: "private_key"),
    4: .same(proto: "tpid"),
    5: .same(proto: "action"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.expiry) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._chainParams) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.privateKey) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.tpid) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._action) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.expiry != 0 {
      try visitor.visitSingularUInt32Field(value: self.expiry, fieldNumber: 1)
    }
    if let v = self._chainParams {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if !self.privateKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.privateKey, fieldNumber: 3)
    }
    if !self.tpid.isEmpty {
      try visitor.visitSingularStringField(value: self.tpid, fieldNumber: 4)
    }
    if let v = self._action {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_SigningInput, rhs: TW_FIO_Proto_SigningInput) -> Bool {
    if lhs.expiry != rhs.expiry {return false}
    if lhs._chainParams != rhs._chainParams {return false}
    if lhs.privateKey != rhs.privateKey {return false}
    if lhs.tpid != rhs.tpid {return false}
    if lhs._action != rhs._action {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_FIO_Proto_SigningOutput: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningOutput"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "json"),
    2: .same(proto: "error"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.json) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.error) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.json.isEmpty {
      try visitor.visitSingularStringField(value: self.json, fieldNumber: 1)
    }
    if self.error != .ok {
      try visitor.visitSingularEnumField(value: self.error, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_FIO_Proto_SigningOutput, rhs: TW_FIO_Proto_SigningOutput) -> Bool {
    if lhs.json != rhs.json {return false}
    if lhs.error != rhs.error {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
