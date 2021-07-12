// Copyright © 2017-2020 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

public enum HRP: UInt32, CaseIterable, CustomStringConvertible  {
    case unknown = 0
    case bitcoin = 1
    case litecoin = 2
    case viacoin = 3
    case groestlcoin = 4
    case digiByte = 5
    case monacoin = 6
    case cosmos = 7
    case bitcoinCash = 8
    case bitcoinGold = 9
    case ioTeX = 10
    case zilliqa = 11
    case terra = 12
    case kava = 13
    case oasis = 14
    case bluzelle = 15
    case bandChain = 16
    case elrond = 17
    case binance = 18
    case thorchain = 19
    case harmony = 20
    case cardano = 21
    case qtum = 22

    public var description: String {
        switch self {
        case .unknown: return ""
        case .bitcoin: return "bc"
        case .litecoin: return "ltc"
        case .viacoin: return "via"
        case .groestlcoin: return "grs"
        case .digiByte: return "dgb"
        case .monacoin: return "mona"
        case .cosmos: return "cosmos"
        case .bitcoinCash: return "bitcoincash"
        case .bitcoinGold: return "btg"
        case .ioTeX: return "io"
        case .zilliqa: return "zil"
        case .terra: return "terra"
        case .kava: return "kava"
        case .oasis: return "oasis"
        case .bluzelle: return "bluzelle"
        case .bandChain: return "band"
        case .elrond: return "erd"
        case .binance: return "bnb"
        case .thorchain: return "thor"
        case .harmony: return "one"
        case .cardano: return "addr"
        case .qtum: return "qc"
        }
    }
}
