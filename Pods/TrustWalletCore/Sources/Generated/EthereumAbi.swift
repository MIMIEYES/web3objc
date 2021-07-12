// Copyright © 2017-2020 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

import Foundation

public final class EthereumAbi {

    public static func encodeTyped(messageJson: String) -> Data {
        let messageJsonString = TWStringCreateWithNSString(messageJson)
        defer {
            TWStringDelete(messageJsonString)
        }
        return TWDataNSData(TWEthereumAbiEncodeTyped(messageJsonString))
    }

    let rawValue: OpaquePointer

    init(rawValue: OpaquePointer) {
        self.rawValue = rawValue
    }


}
