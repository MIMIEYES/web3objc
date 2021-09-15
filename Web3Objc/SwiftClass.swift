//
//  SwiftClass.swift
//  Web3Objc
//
//  Created by mimi on 2021/7/8.
//  Copyright © 2021 coin. All rights reserved.
//

import UIKit
import WalletCore

@objcMembers class SwiftClass: NSObject {
    
    func signTypedDataV4(message : String) -> String {
        let hash = EthereumAbi.encodeTyped(messageJson: message);
        return hash.hexString;
    };
    
    func getPrivatekeyByMnemonic(mnemonic: String) -> String {
        let hh = HDWallet.init(mnemonic: mnemonic, passphrase: "");
        return hh?.getKeyForCoin(coin: CoinType.ethereum).data.hexString ?? "";
    }
}
