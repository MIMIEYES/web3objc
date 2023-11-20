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
    
    func getDogeAddressWithPubKey(pubKey: String) -> String {
//        let priK = PrivateKey(data: Data(hexString: "35a55afc4e392a9f92e1c3d757afa2cafc13a1d361167d6fe4c2b5b2deefb62d")!)!
//        let pubk0 = priK.getPublicKeySecp256k1(compressed: false);
//        print(pubk0.description, "uncompressed");
        // 0462aea8983e564be5fa43fbc51b0f8163f03d85088c162a07ae2d9b8874acc9ba058ffe5ba472289d4528a8c61ca05cfca693ddeb35eb6cf6c8455384bf6fe25b
        // 04da80f90a4f34efd387fff4788c8005f49f57b2aa9e888d54abc05632b68e320ef51dc2391c82b7da5ade67e159c8f8a9ae8b8e12f918e459c34261b5c75ac919
        let unPPP = "04da80f90a4f34efd387fff4788c8005f49f57b2aa9e888d54abc05632b68e320ef51dc2391c82b7da5ade67e159c8f8a9ae8b8e12f918e459c34261b5c75ac919"
        let unPubk = PublicKey(data: Data(hexString: unPPP)!, type: .secp256k1Extended)
        let tronAddr = AnyAddress(publicKey: unPubk!, coin: .tron).description
        print(tronAddr, "tron")
//        let ppp = "039e66a8c9371278966124a1e4f5f93b1fc8573b33661145f42936f8346c4c376f";
//        let pubk = PublicKey(data: Data(hexString: ppp)!, type: .secp256k1)
//        let s = AnyAddress(publicKey: pubk!, coin: .dogecoin).description
//        print(s)
//        let s1 = CoinType.dogecoin.deriveAddressFromPublicKey(publicKey: pubk!).description;
//        print(s1)
        return "aaa"
        
//        return CoinType.ethereum.deriveAddressFromPublicKey(publicKey: pubk)
    }
    
    func getAtposAddressWithPubKey(pubKey: String) -> String {
//        let unPPP = "0x049e66a8c9371278966124a1e4f5f93b1fc8573b33661145f42936f8346c4c376fd3dd3438b8adaf553cc1fdfea6d3a4990e792c307928c0fc48a970f35200105d"
//        let unPubk = PublicKey(data: Data(hexString: unPPP)!, type: .secp256k1Extended)
        let unPPP = "2f1656723e4232ef0cb51bdc0d6e05720a2fadcdcfe6274effff12c18bcb0084"
        let pubk0 = PublicKey(data: Data(hexString: unPPP)!, type: .ed25519)
//        let priK = PrivateKey(data: Data(hexString: "8bc0ccc66694555540cd83ea63b4de9426fff7d48dbd273d97981e135d51b3a8")!)!
//        let pubk0 = priK.getPublicKeyEd25519()
//        print(pubk0.data.hexString, "pubk0")
        let tronAddr = CoinType.aptos.deriveAddressFromPublicKey(publicKey: pubk0!)
        print(tronAddr, "atpos")
        return "aaa"
    }
}
