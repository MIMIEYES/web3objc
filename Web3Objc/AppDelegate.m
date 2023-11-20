//
//  AppDelegate.m
//  Web3Objc
//
//  Created by coin on 06/05/2020.
//  Copyright © 2020 coin. All rights reserved.
//

#import "AppDelegate.h"
#import "PKWeb3Objc.h"

#import "rlp.h"
#import "CVETHWallet.h"

#import "CVBTCWallet.h"
#import "BigNumber.h"
#import "NerveTools.h"

//#import "BTCBase58.h"
//#import "CBSecp256k1.h"
//#import "NSData+BTCData.h"
#import "BTCKey.h"
#import "segwit_addr.h"
//#import "BTCData.h"
//#import "BTCBase58.h"
//#import "BTCKeychain.h"
//#import "BTCNetwork.h"
//#import <CBSecp256k1.h>

#import "NSData+SECP256K1.h"
#import "Web3Objc-Swift.h"
#import "GMEllipticCurveCrypto.h"
//#import "GMObjC.h"
#import "stdio.h"
#import "string.h"
#import "sodium.h"
#import "secp256k1_ios/secp256k1.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【异构网络初始化】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    PKWeb3Objc *web3 = [PKWeb3Objc sharedInstance];
    [web3 setEndPoint:@"https://polygon-mumbai.gateway.tenderly.co" AndChainID:@"80001"];
//    [web3 setEndPoint:@"https://data-seed-prebsc-1-s1.binance.org:8545/" AndChainID:@"97"];
//    [web3 setEndPoint:@"https://cronos-testnet-3.crypto.org:8545" AndChainID:@"338"];
//    [web3 setEndPoint:@"https://rinkeby.arbitrum.io/rpc" AndChainID:@"421611"];
    
//    NSString *tokenAddress = @"0xd938e45680da19ad36646ae8d4c671b2b1270f39";
//    NSLog(@"token: %@", [NerveTools getERC20Symbol:web3 ERC20Contract:tokenAddress]);
//    NSLog(@"token: %@", [NerveTools getERC20Name:web3 ERC20Contract:tokenAddress]);
//    NSLog(@"token: %@", [NerveTools getERC20Decimals:web3 ERC20Contract:tokenAddress]);
    
//    PKWeb3Objc *bbb = [PKWeb3Objc sharedInstance];
//    [bbb setEndPoint:@"https://bsc-dataseed.binance.org/" AndChainID:@"56"];
//    NSString *tx = @"0xf9018f1685012a05f20083035e1d9410ed43c718714eb63d5aa57b78b54704e256024e83000000b901248803dbee000000000000000000000000000000000000000000000000000000174876e800000000000000000000000000000000000000000000000000000000f1dd63588900000000000000000000000000000000000000000000000000000000000000a000000000000000000000000054103606d9fcdb40539d06344c8f8c6367ffc9b80000000000000000000000000000000000000000000000000000000060ef9664000000000000000000000000000000000000000000000000000000000000000300000000000000000000000055d398326f99059ff775485246999027b31979550000000000000000000000007130d2a12b9bcbfae4f2634d864a1ee1ce3ead9c000000000000000000000000e0e514c71282b6f4e823703a39374cf58dc3ea4f8193a07b52d7405556b698759a4402f75cba2d8b6b9b7cc9917f6cf447ed046567b5b8a0317755ddc07281655b159527937f0030dcc5984192528b312ea26ae4bc8c7493";
//    NSLog(@"广播交易 : %@", [web3.eth sendSignedTransaction:tx]);
    
    
    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【测试账户准备】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
//    NSString *testPrivateKey = @"8212e7ba23c8b52790c45b0514490356cd819db15d364cbe08659b5888339e78";
//    NSString *testAddress1 = @"0xc11D9943805e56b630A401D4bd9A29550353EFa1"; //testPrivateKey -> address
//    NSString *testAddress2 = @"0xde03261F1bd05bA98Ba1517E4F54A02e63810986";
//    NSString *multyAddress = @"0x7d759a3330cec9b766aa4c889715535eed3c0484";
//    NSString *htTokenAddress = @"0x5cCEffCFd3E2fE4AaCBF57123B6d42DDDc231990";
//    NSString *nulsTokenAddress = @"0x72755f739b56ef98bda25e2622c63add229dec01";
//    NSString *nerveAddress = @"TNVTdTSPRnXkDiagy7enti1KL75NU5AxC9sQA";
//
//    NSString *prikey = @"8212e7ba23c8b52790c45b0514490356cd819db15d364cbe08659b5888339e78";
//    NSString *msg = @"Hi there from NFT Circle! Sign this message to prove you have access to this wallet and we’ll log you in, here’s a unique message ID they can’t guess: 7a34f74197d8622e81be7300c7009f022100dba51";
//    NSData *encodeMsg = [msg dataUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"msg length: %ld", encodeMsg.length);
//    NSLog(@"DER sign: %@", [NerveTools signMessage:prikey Message:msg]);
//    NSData *tmp = [encodeMsg signWithPrivateKeyData:[prikey parseHexData]];
//    NSLog(@"sign: %@", [tmp dataDirectString]);
//    NSLog(@"DER sign: %@", [[encodeMsg signDataEncodeToDER:[prikey parseHexData]] dataDirectString]);
    
//    NSString *prikey1 = @"3d920abcf4e24d3a68b02d5b332665094da18e9b187747fb2425c040cdbc3690";
//    NSDictionary *dic = [NerveTools sendRawTransaction:web3 PriKey:prikey1 nonce:@"127" gasPrice:@"2925000000" gas:@"64539" To:@"0xa71edc38d189767582c38a3145b5873052c3e47a" Value:@"0" data:@"a9059cbb00000000000000000000000021decdab7af693437e77936e081c2f4d4391094a0000000000000000000000000000000000000000000000004563918244f40000"];
//    NSLog(@"dic: %@", dic);
    
        /** Nabox 插件接收应用传递的交易原始参数，组装交易 **/
//        NSDictionary *tx = [NerveTools sendRawTransaction:web3 PriKey:testPrivateKey nonce:nil gasPrice:nil gas:@"220701" To:@"0x10ed43c718714eb63d5aa57b78b54704e256024e" Value:nil data:@"0x8803dbee000000000000000000000000000000000000000000000000000000174876e800000000000000000000000000000000000000000000000000000000f0a4c8e19d00000000000000000000000000000000000000000000000000000000000000a000000000000000000000000054103606d9fcdb40539d06344c8f8c6367ffc9b80000000000000000000000000000000000000000000000000000000060efa414000000000000000000000000000000000000000000000000000000000000000300000000000000000000000055d398326f99059ff775485246999027b31979550000000000000000000000007130d2a12b9bcbfae4f2634d864a1ee1ce3ead9c000000000000000000000000e0e514c71282b6f4e823703a39374cf58dc3ea4f"];
//        NSLog(tx.description);
//
//
//    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【工具包】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
//    NSLog(@"randomHex 32 : %@", [web3.utils randomHex:32]);
//    NSLog(@"sha3 : %@", [web3.utils sha3:@"hello world"]);
//    NSLog(@"keccak256 : %@", [web3.utils keccak256:@"hello world"]);
    // f92fb8f3ac7ef13a70a8401385a5f2c63b993d747f39d58d22b2070bc25e75f5
//    NSString *message = @"4b5b35cb1fdb";
//    NSData *signature = [[message parseHexData] deriveSharedSecret:[@"2a5e2a923f669d522e67deb12bef5fa66f4e04d16b9cf6b8bbb66cbd59b1cb4c" parseHexData] OtherPubkey:[@"04b739a0c4779e37e191570234ebf799c502e590a8055a75642a22291f4a4ad44d6d469dc70e34fb9277b5b84102b8308dbc5699fd8f057d2dd3838bebd4849179" parseHexData]];
//    NSString *result = [NSString stringWithFormat:@"0x%@", [signature dataDirectString]];
//    NSLog(@"DeriveSharedSecret result: %@", result);
    
    // 04b739a0c4779e37e191570234ebf799c502e590a8055a75642a22291f4a4ad44d6d469dc70e34fb9277b5b84102b8308dbc5699fd8f057d2dd3838bebd4849179 / 03b739a0c4779e37e191570234ebf799c502e590a8055a75642a22291f4a4ad44d
//    NSString *alicePrivateKey = @"2a5e2a923f669d522e67deb12bef5fa66f4e04d16b9cf6b8bbb66cbd59b1cb4c";
//    NSString *bobPublicKey = @"03b739a0c4779e37e191570234ebf799c502e590a8055a75642a22291f4a4ad44d";
//    NSString *bobePublicKey = @"049e66a8c9371278966124a1e4f5f93b1fc8573b33661145f42936f8346c4c376fd3dd3438b8adaf553cc1fdfea6d3a4990e792c307928c0fc48a970f35200105d";
    
    
    
//    NSData *otherPubKeyData = [bobePublicKey parseHexData];
//    const unsigned char *pubKey = (const unsigned char *)otherPubKeyData.bytes;
//    secp256k1_abcd(pubKey);
    
//    NSString *asd = @"9e66a8c9371278966124a1e4f5f93b1fc8573b33661145f42936f8346c4c376fd3dd3438b8adaf553cc1fdfea6d3a4990e792c307928c0fc48a970f35200105d";
//
//    NSData *asdData = [asd parseHexData];
//    NSString *asdasdStr = [CVETHWallet sha512:asdData];
//    NSLog(@"asdasdStr : %@", asdasdStr);
//    NSData *sha512Data = [asdData sha512];
//    NSString *sha512Str = [sha512Data dataDirectString];
//    NSLog(@"sha512Str : %@", sha512Str);
    
//    // 使用evm系私钥计算btc私钥
//    NSString *evmPrikey = @"0x63992e40734b1a25804affe4f91d5bbef73201dd63b3aa92282863892e1b92ac";
//    bool mainnet = true;
//
//    NSString *prefix = @"ef";
//    if (mainnet) {
//        prefix = @"80";
//    }
//    NSString *cleanHexPrefix = [[evmPrikey removePrefix0x] hexUp];
//    if (cleanHexPrefix.length != 64) {
//        NSLog(@"Invalid Key");
//        return nil;
//    }
//    NSString *extendedKey = [[prefix stringByAppendingString:cleanHexPrefix] stringByAppendingString:@"01"];
//    NSData *hashTwice = [[[extendedKey parseHexData] sha256] sha256];
//    NSString *hashTwiceHex = [hashTwice dataDirectString];
//    NSString *checksum = [hashTwiceHex substringWithRange:NSMakeRange(0, 8)];
//    extendedKey = [extendedKey stringByAppendingString:checksum];
//    NSString *btcKey = [[extendedKey parseHexData] base58];
//    NSLog(@"btc key: %@", btcKey);
//
//    // 使用btc私钥计算evm系私钥
//    NSData *btcData = [btcKey base58ToData];
//    if (btcData == NULL) {
//        NSLog(@"Error BTC Private Key");
//    }
//    NSString *btcHex = [btcData dataDirectString];
//    NSString *prefixBtc = [btcHex substringWithRange:NSMakeRange(0, 2)];
//    if (mainnet) {
//        if (![prefixBtc isEqualToString:@"80"]) {
//            NSLog(@"Error BTC Private Key");
//            return nil;
//        }
//    } else {
//        if (![[prefixBtc lowercaseString] isEqualToString:@"ef"]) {
//            NSLog(@"Error BTC Private Key");
//            return nil;
//        }
//    }
//    NSString *btcChecksum = [btcHex substringWithRange:NSMakeRange(btcHex.length - 8, 8)];
//    NSString *btcExtendedKey = [btcHex substringWithRange:NSMakeRange(0, btcHex.length - 8)];
//    NSData *btcHashTwice = [[[btcExtendedKey parseHexData] sha256] sha256];
//    NSString *btcHashTwiceHex = [btcHashTwice dataDirectString];
//    NSString *calcBtcChecksum = [btcHashTwiceHex substringWithRange:NSMakeRange(0, 8)];
//    if (![[btcChecksum lowercaseString] isEqualToString:[calcBtcChecksum lowercaseString]]) {
//        NSLog(@"Error BTC checksum");
//        return nil;
//    }
//    NSString *calcEvmPrikey = [btcExtendedKey substringWithRange:NSMakeRange(2, 64)];
//    NSLog(@"evmPrikey: %@", calcEvmPrikey);
    
//    NSLog(@"btcPrikey: %@", [NerveTools calcBtcPriByEvmPri:@"0xb54db432bba7e13a6c4a28f65b925b18e63bcb79143f7b894fa735d5d3d09db5" WithMainnet:true]);
//    NSLog(@"evmPrikey: %@", [NerveTools calcEvmPriByBtcPri:@"5HueCGU8rMjxEXxiPuD5BDku4MkFqeZyd4dZ1jvhTVqvbTLvyTJ" WithMainnet:true]);
//    NSLog(@"evmPrikey: %@", [NerveTools calcEvmPriByBtcPri:@"KwdMAjGmerYanjeui5SHS7JkmpZvVipYvB2LJGU1ZxJwYvP98617" WithMainnet:true]);
//
//    NSData *uncompressPubKeyData = [CVETHWallet uncompressPublicKey:[bobPublicKey parseHexData]];
//    NSLog(@"uncompressPubKeyData : %@", [uncompressPubKeyData dataDirectString]);
//    NSLog(@"uncompressPubKeyData 1: %@", [[CVETHWallet uncompressPublicKey:[@"02cc8a4bc64d897bddc5fbc2f670f7a8ba0b386779106cf1223c6fc5d7cd6fc115" parseHexData]] dataDirectString]);
//    NSLog(@"uncompressPubKeyData 2: %@", [[CVETHWallet uncompressPublicKey:[@"03cc8a4bc64d897bddc5fbc2f670f7a8ba0b386779106cf1223c6fc5d7cd6fc115" parseHexData]] dataDirectString]);
    
    NSString *bobPublicKey = @"03cc8a4bc64d897bddc5fbc2f670f7a8ba0b386779106cf1223c6fc5d7cd6fc115";
    NSLog(@"bobPublicKey 1: %@", bobPublicKey);
    NSData *bobData = [bobPublicKey parseHexData];
    if (bobData.length != 33) {
        NSLog(@"Error Compressed PublicKey");
        return nil;
    }
    NSUInteger length = bobData.length;
    unsigned char* bobBytes = [bobData bytes];
    if (bobBytes[0] == 0x03) {
        bobBytes[0] = 0x02;
    }
    NSLog(@"bobPublicKey 2: %@", [bobData dataDirectString]);
    NSData *uncompressBobData = [CVETHWallet uncompressPublicKey: bobData];
    NSData *x = [uncompressBobData subdataWithRange:NSMakeRange(1, 32)];
    NSData *y = [uncompressBobData subdataWithRange:NSMakeRange(33, 32)];
    NSString *xHex = [x dataDirectString];
    NSString *yHex = [y dataDirectString];
    NSString *xStr = [BigNumber bigNumberWithData:x];
    NSString *yStr = [BigNumber bigNumberWithData:y];
    NSLog(@"xStr: %@", xStr);
    NSLog(@"yStr: %@", yStr);
    NSLog(@"xHex: %@", xHex);
    NSLog(@"yHex: %@", yHex);
    
    NSString *aaa = [[[BigNumber bigNumberWithDecimalString:@"75098798818242655252486134754694785223032048533939306124635785683558282848332"] hexString] removePrefix0x];
    NSLog(@"aaa: %@", aaa);
    
    char* output = malloc(100);
    int witver = 1;
    
    const uint8_t *witprog = [[@"a60869f0dbcf1dc659c9cecbaf8050135ea9e8cdc487053f1dc6880949dc684c" parseHexData] bytes];
    
    segwit_addr_encode(output, "bc", witver, witprog, 32);
    NSString *result = [[NSString alloc] initWithUTF8String:output];
    NSLog(@"result: %@", result);
    free(output);
    
    /*
     02cc8a4bc64d897bddc5fbc2f670f7a8ba0b386779106cf1223c6fc5d7cd6fc115
     x: cc8a4bc64d897bddc5fbc2f670f7a8ba0b386779106cf1223c6fc5d7cd6fc115
     y: 7e6f540ae051df90f5e37da8e812aedc999df252737d4f67f8180d85791a3834

     03cc8a4bc64d897bddc5fbc2f670f7a8ba0b386779106cf1223c6fc5d7cd6fc115
     x: cc8a4bc64d897bddc5fbc2f670f7a8ba0b386779106cf1223c6fc5d7cd6fc115
     y: 8190abf51fae206f0a1c825717ed512366620dad8c82b09807e7f27986e5c3fb
     */
    // Alice performs...
//    GMEllipticCurveCrypto *alice = [GMEllipticCurveCrypto cryptoForCurve:
//                                                   GMEllipticCurveSecp256r1];
//    alice.privateKey = [alicePrivateKey parseHexData];
//    NSData *aliceSharedSecret = [alice sharedSecretForPublicKey:[bobPublicKey parseHexData]];
//    NSLog(@"Shared Secret Alice: %@", [NSString stringWithFormat:@"0x%@", [aliceSharedSecret dataDirectString]]);
    
//    NSString *clientECDH0 = [NerveTools computeECDH:bobePublicKey privateKey:alicePrivateKey];
//    NSLog(@"GMSm2Utils Shared Secret : %@", clientECDH0);
//    NSString *sha512 = [[[clientECDH0 parseHexData] sha512] dataDirectString];
//    NSLog(@"Shared Secret sha512: %@", sha512);
//
//    NSData *ivData = [@"00000000000000000000000000000000" parseHexData];
//    [CVETHWallet encryptMessage:[message parseHexData] WithPubKey:[bobePublicKey parseHexData] WithSigner:[alicePrivateKey parseHexData] WithIV:ivData];
//
//    NSString *ephemPublicKey = @"04c590421386c62a6875b5e7fa6f640a8660b4d77fe6d587c2a6f1cef150df258afaa1b49fc25bccf77c0218731efc6d7d7468943305143b14a4f526dce5adb0fc";
//    NSString *iv = @"00000000000000000000000000000000";
//    NSString *cipher = @"e317eb39f70a3d691d6b1c6379f9b66e";
//    NSString *mac = @"be6affa614a99960914e94c35f9d9831ac6aeef637ba7a59c964cd5fa7d3228c";
//    NSString *_privkey = @"4594348E3482B751AA235B8E580EFEF69DB465B3A291C5662CEDA6459ED12E39";
//    NSDictionary *_encData = @{@"ephemPublicKey":[ephemPublicKey parseHexData], @"iv":[iv parseHexData], @"mac":[mac parseHexData], @"cipher":[cipher parseHexData]};
//    NSData *decryptMessage = [CVETHWallet decryptMessage:_encData WithPrivKey:[_privkey parseHexData]];
//    NSLog(@"decryptMessage: %@", [decryptMessage dataDirectString]);
//    NSString *tmp = [[NSString alloc] initWithData:decryptMessage encoding:NSUTF8StringEncoding];
//    NSLog(@"decryptMessage utf8 string: %@", tmp);
//
//    NSString *data = @"04c590421386c62a6875b5e7fa6f640a8660b4d77fe6d587c2a6f1cef150df258afaa1b49fc25bccf77c0218731efc6d7d7468943305143b14a4f526dce5adb0fc00000000000000000000000000000000e317eb39f70a3d691d6b1c6379f9b66ebe6affa614a99960914e94c35f9d9831ac6aeef637ba7a59c964cd5fa7d3228c";
//    NSData *dataBytes = [data parseHexData];
//    unsigned long length = dataBytes.length;
//    unsigned long encryptSize = length - 65 - 16 - 32;
//    NSData *ephemPublicKey1 = [NSData dataWithBytesNoCopy:(char *)dataBytes.bytes + 0 length:65 freeWhenDone:false];
//    NSData *iv1 = [NSData dataWithBytesNoCopy:(char *)dataBytes.bytes + 65 length:16 freeWhenDone:false];
//    NSData *cipher1 = [NSData dataWithBytesNoCopy:(char *)dataBytes.bytes + 65 + 16 length:encryptSize freeWhenDone:false];
//    NSData *mac1 = [NSData dataWithBytesNoCopy:(char *)dataBytes.bytes + length - 32 length:32 freeWhenDone:false];
//    NSLog(@"ephemPublicKey1: %@", [ephemPublicKey1 dataDirectString]);
//    NSLog(@"iv1: %@", [iv1 dataDirectString]);
//    NSLog(@"cipher1: %@", [cipher1 dataDirectString]);
//    NSLog(@"mac1: %@", [mac1 dataDirectString]);
//
//    message = @"hello world, 客户端client生成一对公私钥";
//    NSLog(@"message: %@", message);
//    NSString *encrypt = [NerveTools encryptMessage:message WithPubKey:@"023788f6b82b1fb910f58140bba5cc6d064055855d58cab64a01102ba78e248745"];
//    NSLog(@"encrypt: %@", encrypt);
//    NSString *prikey = @"4594348E3482B751AA235B8E580EFEF69DB465B3A291C5662CEDA6459ED12E39";
//    NSString *decrypt = [NerveTools decryptMessage:encrypt WithPrivKey:prikey];
//    NSLog(@"decrypt: %@", decrypt);
    
//    NSString *clientECDH0 = [GMSm2Utils computeECDH:bobePublicKey privateKey:alicePrivateKey];
//    NSLog(@"GMSm2Utils Shared Secret : %@", clientECDH0);
    
//    // 客户端client生成一对公私钥
//    NSArray *clientKey = [GMSm2Utils createKeyPair];
//    NSString *cPubKey = clientKey[0];
//    NSString *cPriKey = clientKey[1];
//
//    // 服务端server生成一对公私钥
//    NSArray *serverKey = [GMSm2Utils createKeyPair];
//    NSString *sPubKey = serverKey[0];
//    NSString *sPriKey = serverKey[1];
//
//    // 客户端client从服务端server获取公钥sPubKey，client协商出32字节对称密钥clientECDH，转Hex后为64字节
//    NSString *clientECDH = [GMSm2Utils computeECDH:sPubKey privateKey:cPriKey];
//    // 客户端client将公钥cPubKey发送给服务端server，server协商出32字节对称密钥serverECDH，转Hex后为64字节
//    NSString *serverECDH = [GMSm2Utils computeECDH:cPubKey privateKey:sPriKey];
//
//    // 在全部明文传输的情况下，client与server协商出相等的对称密钥，clientECDH==serverECDH 成立
//    if ([clientECDH isEqualToString:serverECDH]) {
//        NSLog(@"ECDH 密钥协商成功，协商出的对称密钥为：\n%@", clientECDH);
//    }else{
//        NSLog(@"ECDH 密钥协商失败");
//    }
    
//    NSLog(@"toChecksumAddress : %@", [web3.utils toChecksumAddress:[testAddress1 lowercaseString]]);
//    NSLog(@"checkAddressChecksum : %@", [web3.utils checkAddressChecksum:testAddress1] ? @"true" : @"false");
//    NSLog(@"numberToHex : %@", [web3.utils numberToHex:@"1000"]);
//    NSLog(@"hexToNumber : %@", [web3.utils hexToNumber:@"0x123"]);
//    NSLog(@"utf8ToHex : %@", [web3.utils utf8ToHex:@"hello world"]);
//    NSLog(@"hexToUtf8 : %@", [web3.utils hexToUtf8:@"0x68656c6c6f20776f726c64"]);
//    NSLog(@"toWei : %@", [web3.utils parseEther:@"10"]);
//    NSLog(@"fromWei : %@", [web3.utils formatEther:@"1000000"]);
//    NSLog(@"幂除: %@", [web3.utils formatUnits:@"123456" WithUnit:3]);
//    NSLog(@"幂乘: %@", [web3.utils parseUnits:@"29.346828826842430128" WithUnit:8]);
//    BigNumber *asd = [BigNumber bigNumberWithHexString:@"0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"];
//    NSLog(@"hexToNumber.decimalString : %@", asd.decimalString);
//    NSLog(@"hexToNumber.hexString : %@", asd.hexString);
//    BigNumber *qwe = [BigNumber bigNumberWithDecimalString:@"115792089237316195423570985008687907853269984665640564039457584007913129639935"];
//    NSLog(@"numberToHex.decimalString : %@", qwe.decimalString);
//    NSLog(@"numberToHex.hexString : %@", qwe.hexString);
//    NSLog(@"numberToHex : %@", [web3.utils numberToHex:@"115792089237316195423570985008687907853269984665640564039457584007913129639935"]);
//    BigNumber *qwe1 = [BigNumber bigNumberWithDecimalString:@"1156.2344564564565"];
//    BigNumber *qwe2 = [BigNumber bigNumberWithDecimalString:@"100000000"];
//    NSLog(@"numberToHex.qwe1 : %@", qwe1);
//    NSLog(@"numberToHex.qwe2 : %@", qwe2);
//    NSLog(@"numberToHex.qwe1 * qwe2 : %@", [qwe1 mul:qwe2].decimalString);
//    BigNumber *qwe3 = [BigNumber bigNumberWithDecimalString:@""];
//    NSLog(@"numberToHex.qwe3 : %@", qwe3);
//    NSLog(@"numberToHex.test : %@", [BigNumber bigNumberWithDecimalString:@"-115792089237316195423570985008687907853269984665640564039457584007913129639935.123123"]);
//    NSLog(@"numberToHex.test : %@", [BigNumber bigNumberWithDecimalString:@"100000000.0sa"]);
//    NSLog(@"numberToHex.test : %@", [BigNumber bigNumberWithDecimalString:@"1000a0000"]);
//    NSLog(@"numberToHex.test : %@", [BigNumber bigNumberWithDecimalString:@"--100000000"]);
//    NSLog(@"numberToHex.test : %@", [BigNumber bigNumberWithDecimalString:@"100000000a"]);
//    NSLog(@"numberToHex.test : %@", [BigNumber bigNumberWithDecimalString:@"100000000..789"]);
//    NSLog(@"numberToHex.test : %@", [BigNumber bigNumberWithDecimalString:@"115792089237316195423570985008687907853269984665640564039457584007913129639935.0234"]);
//    NSLog(@"幂除: %@", [NerveTools formatUnits:@"123456" WithUnit:3]);
//    NSLog(@"幂乘: %@", [NerveTools parseUnits:@"234567" WithUnit:5]);
    
//
//
//    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【账户相关】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
//    /** 创建账户 */
//    NSLog(@"create : %@", [web3.eth.accounts create]);
//    /** 通过私钥得到地址 */
//    NSLog(@"privateKeyToAccount : %@", [web3.eth.accounts privateKeyToAccount:testPrivateKey]);
//    /** 获取nonce **/
//    NSLog(@"getTranactionCount : %@", [web3.eth getTranactionCount:@"0x3083f7ed267dca41338de3401c4e054db2a1cd2f"]);
//    /** 获取地址余额 **/
//    NSLog(@"getBalance address 1: %@", [NerveTools formatEther:[web3.eth getBalance:@"0xc11D9943805e56b630A401D4bd9A29550353EFa1"]]);
//
//    NSString *_from = @"0xc11D9943805e56b630A401D4bd9A29550353EFa1";
//    NSString *_to = @"0x3083f7ed267dca41338de3401c4e054db2a1cd2f";
//    NSString *_value = @"0.290801304936644638";
//    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
//    tx.to = [_to removePrefix0x];
//    tx.value = [web3.utils numberToHex:[web3.utils parseEther:_value]];
//    NSString *estimateGas = [web3.eth estimateGasFrom:_from TX:tx];
//    NSLog(@"estimateGas : %@", estimateGas);
    

    
//    NSString *erc721Tx = [NerveTools sendERC721:web3 PriKey:@"7ce617815b0e2f570d0c7eb77339d85fbdaf132f389ee5a2d1f9a30c05861b45" ERC721Contract:@"0xE1C8E1f7e2D8afFfA5271456af454243C39B6542" To:@"0x3083F7eD267DcA41338de3401c4E054dB2A1cD2f" TokenId:@"2" HexData:@"234567"];
//    NSLog(@"广播token721转账交易 : %@", [web3.eth sendSignedTransaction:erc721Tx]);
    
//    NSLog(@"getBalance address 2: %@", [web3.utils formatEther:[web3.eth getBalance:testAddress2]]);
//
//
//    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【区块链网络相关】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
//    /** 获取当前网络平均价格 **/
//    NSLog(@"getGasPrice : %@", [web3.eth getGasPrice]);
//    /** 获取网络最新高度 **/
//    NSLog(@"getBlockNumber : %@", [web3.eth getBlockNumber]);
//
//
//    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【组装交易并广播交易】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    /** ETH转账0.01个，from testAddress1 to testAddress2 **/
//    NSString *ethTx = [NerveTools sendEth:web3 PriKey:@"0d4fd685cdaee9c9fb327f6de941e0bb59dad0171ab97281954519abafbc9fe3" To:@"0xb71a392288a743f69d4eda98da50fe67298c1b3b" Value:@"0.02"];
//    NSLog(@"广播eth转账交易 : %@", [web3.eth sendSignedTransaction:ethTx]);
    
//    NSLog(@"广播eth转账交易 : %@", [web3.eth sendSignedTransaction:@"0xf86a0e84ae57f54082520894a67f7a5f327647138a63d2ebe7b02cdcb830a0d28502540be40080820124a0240baf2285aff2b71248746f6a344a971e9bc4ce0337895d9e55d4c4e91b779fa021948c6bf3a0ecb2b4e69f5528658c026180f4bd27e146d346198380954043cd"]);
//
//
    /** 查询地址的token余额 */
//    NSString *tokenBalance = [NerveTools getERC20Balance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress];
//    NSLog(@"查询testAddress1的token余额 : %@", tokenBalance);
//    [web3.utils formatUnits:[NerveTools getERC20Balance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress] WithUnit:tokenDecimals]
//
//    /** token转账 0.1个HT，from testAddress1 to testAddress2 **/
//    NSString *erc20Tx = [NerveTools sendERC20:web3 PriKey:testPrivateKey ERC20Contract:htTokenAddress ERC20Decimals:18 To:testAddress2 Value:@"0.1"];
////    NSLog(@"广播token转账交易 : %@", [web3.eth sendSignedTransaction:erc20Tx]);
//
//    /** token授权 1个HT，from testAddress1 to testAddress2 **/
//    NSString *approveTx = [NerveTools approveERC20:web3 PriKey:testPrivateKey ERC20Contract:nulsTokenAddress ERC20Decimals:8 To:testAddress2 Value:@"1"];
////    NSLog(@"广播token授权交易 : %@, hash: %@", approveTx, [web3.eth sendSignedTransaction:approveTx]);
//
    /** 查询地址的token授权额度 **/
//    NSString *allowance = [NerveTools getERC20Allowance:web3 Owner:@"0xe9e7cea3dedca5984780bafc599bd69add087d56" ERC20Contract:@"0x84BBdBEDDAF13DA566ac2D1f89CC3F516bA1c85E" Spender:@"0x3758AA66caD9F2606F1F501c9CB31b94b713A6d5"];
//    NSLog(@"查询testAddress1授权给multyAddress的授权额度 : %@", allowance);
//
//    int isAllowance = [NerveTools needERC20Allowance:web3 Owner:@"0x84BBdBEDDAF13DA566ac2D1f89CC3F516bA1c85E" ERC20Contract:@"0xe9e7cea3dedca5984780bafc599bd69add087d56" Spender:@"0x3758AA66caD9F2606F1F501c9CB31b94b713A6d5"];
//    NSLog(@"查询 %d", isAllowance);
//
//    @try {
//        BigNumber *currentAllowance = [BigNumber bigNumberWithDecimalString:nil];
//        NSLog(@"查询 %@", currentAllowance.decimalString);
//    } @catch (NSException *exception) {
//        NSLog(@"查询 %@", [exception name]);
//        NSLog(@"查询 %@", [exception reason]);
//        NSLog(@"查询 %@", [exception userInfo]);
//    } @finally {
//
//    }
    
//    NSString *gas = [NerveTools getGasLimit_sendERC20:web3 From:testAddress1 ERC20Contract:@"0x02e1aFEeF2a25eAbD0362C4Ba2DC6d20cA638151" ERC20Decimals:18 To:testAddress2 Value:@"200"];
//    NSLog(@"查询 %@", gas);
//    NSString *allowance1 = [NerveTools getERC20Allowance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress Spender:testAddress2];
//    NSLog(@"查询testAddress1授权给testAddress2的授权额度 : %@", allowance1);
//
//    /** eth网络跨链转入nerve，这里有两种情况，一种是转主资产eth，另一种是转token **/
    // 第一种，转主资产eth，0.01个，from testAddress1 to nerveAddress
//    NSString *crossTxWithEth = [NerveTools crossOutWithETH:web3 PriKey:testPrivateKey MultyContract:multyAddress To:nerveAddress Value:@"0.01"];
//    NSLog(@"广播eth跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:crossTxWithEth]);
//
//    // 第二种，转token资产HT，2个，from testAddress1 to nerveAddress
//    NSString *crossTxWithERC20 = [NerveTools crossOutWithERC20:web3 PriKey:testPrivateKey MultyContract:multyAddress ERC20Contract:htTokenAddress ERC20Decimals:18 To:nerveAddress Value:@"2"];
////    NSLog(@"广播token跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:crossTxWithERC20]);
//
//    /** Nabox 插件接收应用传递的交易原始参数，组装交易 **/
//    NSDictionary *tx = [NerveTools sendRawTransaction:web3 PriKey:@"7ce617815b0e2f570d0c7eb77339d85fbdaf132f389ee5a2d1f9a30c05861b45" nonce:@"17" gasPrice:@"20000000000" gas:@"66628" To:@"0xd8eb69948e214da7fd8da6815c9945f175a4fce7" Value:@"0" data:@"095ea7b3000000000000000000000000b490f2a3ec0b90e5faa1636be046d82ab7cdac74ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"];
//    NSLog(@"交易详情 : %@", tx.description);
//    NSLog(@"Nabox广播eth交易 : %@", [web3.eth sendSignedRawTransaction:[tx valueForKey:@"rawTransaction"]]);
//
//
//    /** eth_sign **/
//    NSString *data = @"0xd86cf03a175cdaf761d2eda25a98ce404d96ce0db2a4f25b25d46d604c7cdc5c";
//    NSString *_privKey = @"8212e7ba23c8b52790c45b0514490356cd819db15d364cbe08659b5888339e78";
//    NSData *signature;
//    signature = [[data parseHexData] signWithPrivateKeyData:[_privKey parseHexData]];
//    NSString *asd1 = [NSString stringWithFormat:@"0x%@", [signature dataDirectString]];
//    NSLog(@"signature : %@", asd1);
//    NSLog(@"signature : %@", [NerveTools ethSign:_privKey Message:data]);
//
//
//    /** eth_personal_sign **/
//    /*
//    hello world:
//    0x939b12bd9a8af144665906dd2d8041f6e0c2e38cd74210295ce02b29585378610cacd4f0399a0dfc0a4a5b2d5a5d1aaf132998fe900395d0ad5de926f1ceb2561c
//
//    0xd86cf03a175cdaf761d2eda25a98ce404d96ce0db2a4f25b25d46d604c7cdc5c:
//    0x5350242e4eebe80b1da83733fcc04440701c631ed1ba1401e562552a19a94c1b4801c59f85390f7375ce45efca93c7b6be3d633aa5579f6a618a062b64ddaf7b1b
//
//    hello:
//    0xf6bb8c6c72c0fd9e4a4ce2ad43a91b29a9ceeaa329071b17d2a9e8846eee729d11a1dca62a0b5097c474672a495c15df291a6da1c2b0af5946984a06648155b51b
//
//    d86cf03a175cdaf7:
//    0x5e3823650d7f40af57641bc07208aa586a28833a9922d4845355ba790357031e4d408b6696329745698a8a72d4ef34edeb9440aec90b099e1c385ef35eba31bb1c
//    */
//    NSString *personalMsg = @"hello world";
//    NSDictionary *asd2 = [web3.eth.accounts sign:personalMsg WithPrivateKey:_privKey];
//    NSLog(@"personal_sign1 : %@", [asd2 valueForKey:@"signature"]);
//    NSLog(@"personal_sign1 : %@", [NerveTools personalSign:_privKey Message:personalMsg]);
//
//    personalMsg = @"0xd86cf03a175cdaf761d2eda25a98ce404d96ce0db2a4f25b25d46d604c7cdc5c";
//    asd2 = [web3.eth.accounts sign:personalMsg WithPrivateKey:_privKey];
//    NSLog(@"personal_sign2 : %@", [asd2 valueForKey:@"signature"]);
//    NSLog(@"personal_sign2 : %@", [NerveTools personalSign:_privKey Message:personalMsg]);
//
//    personalMsg = @"hello";
//    asd2 = [web3.eth.accounts sign:personalMsg WithPrivateKey:_privKey];
//    NSLog(@"personal_sign3 : %@", [asd2 valueForKey:@"signature"]);
//    NSLog(@"personal_sign3 : %@", [NerveTools personalSign:_privKey Message:personalMsg]);
//
//    personalMsg = @"d86cf03a175cdaf7";
//    asd2 = [web3.eth.accounts sign:personalMsg WithPrivateKey:_privKey];
//    NSLog(@"personal_sign4 : %@", [asd2 valueForKey:@"signature"]);
//    NSLog(@"personal_sign4 : %@", [NerveTools personalSign:_privKey Message:personalMsg]);

//    /** signTypedDataV4 **/
//    NSString *mn = @"deny they health custom company worth tank hungry police direct eternal urban";
//    SwiftClass *sc = [[SwiftClass alloc] init];
//    NSString *rrr = [sc getPrivatekeyByMnemonicWithMnemonic:mn];
//    NSLog(@"getPrivatekeyByMnemonicWithMnemonic: %@", rrr);
    
//    SwiftClass *sc = [[SwiftClass alloc] init];
//    NSString *rrr = [sc getDogeAddressWithPubKeyWithPubKey:@""];
////    NSLog(@"getDogeAddressWithPubKeyWithPubKey: %@", rrr);
//    NSString *aaa = [sc getAtposAddressWithPubKeyWithPubKey:@""];
//    NSLog(@"getAtposAddressWithPubKeyWithPubKey: %@", aaa);
    
//    NSString *msg = @"{\"domain\":{\"chainId\":3,\"name\":\"Ether Mail\",\"verifyingContract\":\"0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC\",\"version\":\"1\"},\"message\":{\"contents\":\"Hello, Bob!\",\"from\":{\"name\":\"Cow\",\"wallets\":[\"0xCD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826\",\"0xDeaDbeefdEAdbeefdEadbEEFdeadbeEFdEaDbeeF\"]},\"to\":[{\"name\":\"Bob\",\"wallets\":[\"0xbBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB\",\"0xB0BdaBea57B0BDABeA57b0bdABEA57b0BDabEa57\",\"0xB0B0b0b0b0b0B000000000000000000000000000\"]}]},\"primaryType\":\"Mail\",\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"Group\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"members\",\"type\":\"Person[]\"}],\"Mail\":[{\"name\":\"from\",\"type\":\"Person\"},{\"name\":\"to\",\"type\":\"Person[]\"},{\"name\":\"contents\",\"type\":\"string\"}],\"Person\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"wallets\",\"type\":\"address[]\"}]}}";
//    NSString *str2 = [sc signTypedDataV4WithMessage:msg];
//    NSLog(@"encode hash : %@", str2);
//    signature = [[str2 parseHexData] signWithPrivateKeyData:[_privKey parseHexData]];
//    asd1 = [NSString stringWithFormat:@"0x%@", [signature dataDirectString]];
//    NSLog(@"signTypedDataV4 signature : %@", asd1);
//    NSLog(@"signTypedDataV4 signature : %@", [NerveTools signTypedDataV4:_privKey Message:msg]);
//
//    msg = @"{\"domain\":{\"chainId\":1,\"name\":\"Ether Mail\",\"verifyingContract\":\"0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC\",\"version\":\"1\"},\"message\":{\"contents\":\"Hello, Bob!\",\"from\":{\"name\":\"Cow\",\"wallets\":[\"0xCD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826\",\"0xDeaDbeefdEAdbeefdEadbEEFdeadbeEFdEaDbeeF\"]},\"to\":[{\"name\":\"Bob\",\"wallets\":[\"0xbBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB\",\"0xB0BdaBea57B0BDABeA57b0bdABEA57b0BDabEa57\",\"0xB0B0b0b0b0b0B000000000000000000000000000\"]}]},\"primaryType\":\"Mail\",\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"Group\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"members\",\"type\":\"Person[]\"}],\"Mail\":[{\"name\":\"from\",\"type\":\"Person\"},{\"name\":\"to\",\"type\":\"Person[]\"},{\"name\":\"contents\",\"type\":\"string\"}],\"Person\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"wallets\",\"type\":\"address[]\"}]}}";
//    NSLog(@"signTypedDataV4 signature : %@", [NerveTools signTypedDataV4:_privKey Message:msg]);
//
//    // 0x255aeb286e4b55f13aceec4084cb479cf6b13993154e8423e20decdaeed4c6a64be9bd3748131a7a3d1e636dfbecab70cef1ffe18dc590a77a9a6c26c56199801c
//    msg = @"{\"domain\":{\"chainId\":1,\"name\":\"Ether Mail\",\"verifyingContract\":\"0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC\",\"version\":\"1\"},\"message\":{\"contents\":\"Hello, Bobe!\",\"from\":{\"name\":\"Cow\",\"wallets\":[\"0xCD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826\",\"0xDeaDbeefdEAdbeefdEadbEEFdeadbeEFdEaDbeeF\"]},\"to\":[{\"name\":\"Bob\",\"wallets\":[\"0xbBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB\",\"0xB0BdaBea57B0BDABeA57b0bdABEA57b0BDabEa57\",\"0xB0B0b0b0b0b0B000000000000000000000000000\"]}]},\"primaryType\":\"Mail\",\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"Group\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"members\",\"type\":\"Person[]\"}],\"Mail\":[{\"name\":\"from\",\"type\":\"Person\"},{\"name\":\"to\",\"type\":\"Person[]\"},{\"name\":\"contents\",\"type\":\"string\"}],\"Person\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"wallets\",\"type\":\"address[]\"}]}}";
//    NSLog(@"signTypedDataV4 signature : %@", [NerveTools signTypedDataV4:_privKey Message:msg]);
    
//    msg = @"{\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"Permit\":[{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"spender\",\"type\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\"},{\"name\":\"nonce\",\"type\":\"uint256\"},{\"name\":\"deadline\",\"type\":\"uint256\"}]},\"domain\":{\"name\":\"Pancake LPs\",\"version\":\"1\",\"chainId\":56,\"verifyingContract\":\"0x7EFaEf62fDdCCa950418312c6C91Aef321375A00\"},\"primaryType\":\"Permit\",\"message\":{\"owner\":\"0x5a78059280E7B4E5494d18B44fbaef5228BA8598\",\"spender\":\"0x10ED43C718714eb63d5aA57B78B54704E256024E\",\"value\":\"771084146275153706937\",\"nonce\":\"0x03\",\"deadline\":1629191740}}";
//    NSLog(@"signTypedDataV4 signature : %@", [NerveTools signTypedDataV4:_privKey Message:msg]);
//
//    msg = @"{\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"Permit\":[{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"spender\",\"type\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\"},{\"name\":\"nonce\",\"type\":\"uint256\"},{\"name\":\"deadline\",\"type\":\"uint256\"}]},\"domain\":{\"name\":\"Pancake LPs\",\"version\":\"1\",\"chainId\":56,\"verifyingContract\":\"0x7EFaEf62fDdCCa950418312c6C91Aef321375A00\"},\"primaryType\":\"Permit\",\"message\":{\"owner\":\"0x5a78059280E7B4E5494d18B44fbaef5228BA8598\",\"spender\":\"0x10ED43C718714eb63d5aA57B78B54704E256024E\",\"value\":\"771084146275153706937\",\"nonce\":\"0x03\",\"deadline\":1629191740}}";
//    NSLog(@"signTypedDataV4 signature : %@", [NerveTools signTypedDataV4:_privKey Message:msg]);
    
//    msg = @"{\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"Permit\":[{\"name\":\"owner\",\"type\":\"address\"},{\"name\":\"spender\",\"type\":\"address\"},{\"name\":\"value\",\"type\":\"uint256\"},{\"name\":\"nonce\",\"type\":\"uint256\"},{\"name\":\"deadline\",\"type\":\"uint256\"}]},\"domain\":{\"name\":\"Pancake LPs\",\"version\":\"1\",\"chainId\":56,\"verifyingContract\":\"0x7EFaEf62fDdCCa950418312c6C91Aef321375A00\"},\"primaryType\":\"Permit\",\"message\":{\"owner\":\"0x5a78059280E7B4E5494d18B44fbaef5228BA8598\",\"spender\":\"0x10ED43C718714eb63d5aA57B78B54704E256024E\",\"value\":\"771084146275153706937\",\"nonce\":\"0x03\",\"deadline\":1629191740}}";
//    NSLog(@"signTypedDataV4 signature : %@", [NerveTools signTypedDataV4:_privKey Message:msg]);
//    NSString *nftTokenContractAbi = @"[{\"inputs\":[{\"internalType\":\"string\",\"name\":\"name\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"symbol\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"baseTokenURI\",\"type\":\"string\"}],\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"approved\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"Approval\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"operator\",\"type\":\"address\"},{\"indexed\":false,\"internalType\":\"bool\",\"name\":\"approved\",\"type\":\"bool\"}],\"name\":\"ApprovalForAll\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":false,\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"Paused\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"previousAdminRole\",\"type\":\"bytes32\"},{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"newAdminRole\",\"type\":\"bytes32\"}],\"name\":\"RoleAdminChanged\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"sender\",\"type\":\"address\"}],\"name\":\"RoleGranted\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"sender\",\"type\":\"address\"}],\"name\":\"RoleRevoked\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"Transfer\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":false,\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"Unpaused\",\"type\":\"event\"},{\"inputs\":[],\"name\":\"DEFAULT_ADMIN_ROLE\",\"outputs\":[{\"internalType\":\"bytes32\",\"name\":\"\",\"type\":\"bytes32\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"MINTER_ROLE\",\"outputs\":[{\"internalType\":\"bytes32\",\"name\":\"\",\"type\":\"bytes32\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"PAUSER_ROLE\",\"outputs\":[{\"internalType\":\"bytes32\",\"name\":\"\",\"type\":\"bytes32\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"approve\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"}],\"name\":\"balanceOf\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"burn\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"getApproved\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"}],\"name\":\"getRoleAdmin\",\"outputs\":[{\"internalType\":\"bytes32\",\"name\":\"\",\"type\":\"bytes32\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"uint256\",\"name\":\"index\",\"type\":\"uint256\"}],\"name\":\"getRoleMember\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"}],\"name\":\"getRoleMemberCount\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"grantRole\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"hasRole\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"operator\",\"type\":\"address\"}],\"name\":\"isApprovedForAll\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"}],\"name\":\"mint\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"name\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"ownerOf\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"pause\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"paused\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"renounceRole\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"revokeRole\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"safeTransferFrom\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"},{\"internalType\":\"bytes\",\"name\":\"_data\",\"type\":\"bytes\"}],\"name\":\"safeTransferFrom\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"operator\",\"type\":\"address\"},{\"internalType\":\"bool\",\"name\":\"approved\",\"type\":\"bool\"}],\"name\":\"setApprovalForAll\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes4\",\"name\":\"interfaceId\",\"type\":\"bytes4\"}],\"name\":\"supportsInterface\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"symbol\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"index\",\"type\":\"uint256\"}],\"name\":\"tokenByIndex\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"index\",\"type\":\"uint256\"}],\"name\":\"tokenOfOwnerByIndex\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"tokenURI\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"totalSupply\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"transferFrom\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"unpause\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]";
//    NSString *_contract = @"0x84d72ab95b5a11E957f29003Be8BE803e203Aaf6";
//    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:nftTokenContractAbi];
//    NSString *result = [tokenContract call:@"ownerOf(uint256)" WithArgument:@[@"2"]];
//    NSLog(@"owner result : %@", result);
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
