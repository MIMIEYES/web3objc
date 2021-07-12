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

#import "NSData+SECP256K1.h"
#import "Web3Objc-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【异构网络初始化】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    PKWeb3Objc *web3 = [PKWeb3Objc sharedInstance];
    [web3 setEndPoint:@"https://ropsten.infura.io/v3/7e086d9f3bdc48e4996a3997b33b032f" AndChainID:@"3"];
    
    
    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【测试账户准备】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    NSString *testPrivateKey = @"0x4594348E3482B751AA235B8E580EFEF69DB465B3A291C5662CEDA6459ED12E39";
    NSString *testAddress1 = @"0xc11D9943805e56b630A401D4bd9A29550353EFa1"; //testPrivateKey -> address
    NSString *testAddress2 = @"0xde03261F1bd05bA98Ba1517E4F54A02e63810986";
    NSString *multyAddress = @"0x7d759a3330cec9b766aa4c889715535eed3c0484";
    NSString *htTokenAddress = @"0x5cCEffCFd3E2fE4AaCBF57123B6d42DDDc231990";
    NSString *nulsTokenAddress = @"0xae7fccff7ec3cf126cd96678adae83a2b303791c";
    NSString *nerveAddress = @"TNVTdTSPRnXkDiagy7enti1KL75NU5AxC9sQA";

    
    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【工具包】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    NSLog(@"randomHex 32 : %@", [web3.utils randomHex:32]);
    NSLog(@"sha3 : %@", [web3.utils sha3:@"hello world"]);
    NSLog(@"keccak256 : %@", [web3.utils keccak256:@"hello world"]);
    NSLog(@"toChecksumAddress : %@", [web3.utils toChecksumAddress:[testAddress1 lowercaseString]]);
    NSLog(@"checkAddressChecksum : %@", [web3.utils checkAddressChecksum:testAddress1] ? @"true" : @"false");
    NSLog(@"numberToHex : %@", [web3.utils numberToHex:@"1000"]);
    NSLog(@"hexToNumber : %@", [web3.utils hexToNumber:@"0x123"]);
    NSLog(@"utf8ToHex : %@", [web3.utils utf8ToHex:@"hello world"]);
    NSLog(@"hexToUtf8 : %@", [web3.utils hexToUtf8:@"0x68656c6c6f20776f726c64"]);
    NSLog(@"toWei : %@", [web3.utils parseEther:@"10"]);
    NSLog(@"fromWei : %@", [web3.utils formatEther:@"1000000"]);
    NSLog(@"幂除: %@", [web3.utils formatUnits:@"123456" WithUnit:3]);
    NSLog(@"幂乘: %@", [web3.utils parseUnits:@"234567" WithUnit:5]);
    BigNumber *asd = [BigNumber bigNumberWithHexString:@"0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"];
    NSLog(@"hexToNumber.decimalString : %@", asd.decimalString);
    NSLog(@"hexToNumber.hexString : %@", asd.hexString);
    BigNumber *qwe = [BigNumber bigNumberWithDecimalString:@"115792089237316195423570985008687907853269984665640564039457584007913129639935"];
    NSLog(@"numberToHex.decimalString : %@", qwe.decimalString);
    NSLog(@"numberToHex.hexString : %@", qwe.hexString);
    NSLog(@"numberToHex : %@", [web3.utils numberToHex:@"115792089237316195423570985008687907853269984665640564039457584007913129639935"]);


    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【账户相关】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    /** 创建账户 */
    NSLog(@"create : %@", [web3.eth.accounts create]);
    /** 通过私钥得到地址 */
    NSLog(@"privateKeyToAccount : %@", [web3.eth.accounts privateKeyToAccount:testPrivateKey]);
    /** 获取nonce **/
    NSLog(@"getTranactionCount : %@", [web3.eth getTranactionCount:testAddress2]);
    /** 获取地址余额 **/
    NSLog(@"getBalance address 1: %@", [web3.utils formatEther:[web3.eth getBalance:testAddress1]]);
    NSLog(@"getBalance address 2: %@", [web3.utils formatEther:[web3.eth getBalance:testAddress2]]);


    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【区块链网络相关】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    /** 获取当前网络平均价格 **/
    NSLog(@"getGasPrice : %@", [web3.eth getGasPrice]);
    /** 获取网络最新高度 **/
    NSLog(@"getBlockNumber : %@", [web3.eth getBlockNumber]);


    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【组装交易并广播交易】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    /** ETH转账0.01个，from testAddress1 to testAddress2 **/
    NSString *ethTx = [NerveTools sendEth:web3 PriKey:testPrivateKey To:testAddress2 Value:@"0.02"];
//    NSLog(@"广播eth转账交易 : %@", [web3.eth sendSignedTransaction:ethTx]);


    /** 查询地址的token余额 */
    NSString *tokenBalance = [NerveTools getERC20Balance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress];
//    NSLog(@"查询testAddress1的token余额 : %@", tokenBalance);

    /** token转账 0.1个HT，from testAddress1 to testAddress2 **/
    NSString *erc20Tx = [NerveTools sendERC20:web3 PriKey:testPrivateKey ERC20Contract:htTokenAddress ERC20Decimals:18 To:testAddress2 Value:@"0.1"];
//    NSLog(@"广播token转账交易 : %@", [web3.eth sendSignedTransaction:erc20Tx]);

    /** token授权 1个HT，from testAddress1 to testAddress2 **/
    NSString *approveTx = [NerveTools approveERC20:web3 PriKey:testPrivateKey ERC20Contract:nulsTokenAddress ERC20Decimals:8 To:testAddress2 Value:@"1"];
//    NSLog(@"广播token授权交易 : %@, hash: %@", approveTx, [web3.eth sendSignedTransaction:approveTx]);

    /** 查询地址的token授权额度 **/
    NSString *allowance = [NerveTools getERC20Allowance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress Spender:multyAddress];
    NSLog(@"查询testAddress1授权给multyAddress的授权额度 : %@", allowance);
    NSString *allowance1 = [NerveTools getERC20Allowance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress Spender:testAddress2];
    NSLog(@"查询testAddress1授权给testAddress2的授权额度 : %@", allowance1);

    /** eth网络跨链转入nerve，这里有两种情况，一种是转主资产eth，另一种是转token **/
    // 第一种，转主资产eth，0.01个，from testAddress1 to nerveAddress
    NSString *crossTxWithEth = [NerveTools crossOutWithETH:web3 PriKey:testPrivateKey MultyContract:multyAddress To:nerveAddress Value:@"0.01"];
//    NSLog(@"广播eth跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:crossTxWithEth]);

    // 第二种，转token资产HT，2个，from testAddress1 to nerveAddress
    NSString *crossTxWithERC20 = [NerveTools crossOutWithERC20:web3 PriKey:testPrivateKey MultyContract:multyAddress ERC20Contract:htTokenAddress ERC20Decimals:18 To:nerveAddress Value:@"2"];
//    NSLog(@"广播token跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:crossTxWithERC20]);

    /** Nabox 插件接收应用传递的交易原始参数，组装交易 **/
    NSString *tx = [NerveTools sendRawTransaction:web3 PriKey:testPrivateKey nonce:@"84" gasPrice:@"10000000000" gas:@"22000" To:testAddress2 Value:@"" data:@""];
//    NSLog(@"Nabox广播eth交易 : %@", [web3.eth sendSignedTransaction:tx]);
    
    
    /** eth_sign **/
    NSString *data = @"0xd86cf03a175cdaf761d2eda25a98ce404d96ce0db2a4f25b25d46d604c7cdc5c";
    NSString *_privKey = @"8212e7ba23c8b52790c45b0514490356cd819db15d364cbe08659b5888339e78";
    NSData *signature;
    signature = [[data parseHexData] signWithPrivateKeyData:[_privKey parseHexData]];
    NSString *asd1 = [NSString stringWithFormat:@"0x%@", [signature dataDirectString]];
    NSLog(@"signature : %@", asd1);
    NSLog(@"signature : %@", [NerveTools ethSign:_privKey Message:data]);


    /** eth_personal_sign **/
    /*
    hello world:
    0x939b12bd9a8af144665906dd2d8041f6e0c2e38cd74210295ce02b29585378610cacd4f0399a0dfc0a4a5b2d5a5d1aaf132998fe900395d0ad5de926f1ceb2561c
    
    0xd86cf03a175cdaf761d2eda25a98ce404d96ce0db2a4f25b25d46d604c7cdc5c:
    0x5350242e4eebe80b1da83733fcc04440701c631ed1ba1401e562552a19a94c1b4801c59f85390f7375ce45efca93c7b6be3d633aa5579f6a618a062b64ddaf7b1b
    
    hello:
    0xf6bb8c6c72c0fd9e4a4ce2ad43a91b29a9ceeaa329071b17d2a9e8846eee729d11a1dca62a0b5097c474672a495c15df291a6da1c2b0af5946984a06648155b51b
    
    d86cf03a175cdaf7:
    0x5e3823650d7f40af57641bc07208aa586a28833a9922d4845355ba790357031e4d408b6696329745698a8a72d4ef34edeb9440aec90b099e1c385ef35eba31bb1c
    */
    NSString *personalMsg = @"hello world";
    NSDictionary *asd2 = [web3.eth.accounts sign:personalMsg WithPrivateKey:_privKey];
    NSLog(@"personal_sign1 : %@", [asd2 valueForKey:@"signature"]);
    NSLog(@"personal_sign1 : %@", [NerveTools personalSign:_privKey Message:personalMsg]);
    
    personalMsg = @"0xd86cf03a175cdaf761d2eda25a98ce404d96ce0db2a4f25b25d46d604c7cdc5c";
    asd2 = [web3.eth.accounts sign:personalMsg WithPrivateKey:_privKey];
    NSLog(@"personal_sign2 : %@", [asd2 valueForKey:@"signature"]);
    NSLog(@"personal_sign2 : %@", [NerveTools personalSign:_privKey Message:personalMsg]);
    
    personalMsg = @"hello";
    asd2 = [web3.eth.accounts sign:personalMsg WithPrivateKey:_privKey];
    NSLog(@"personal_sign3 : %@", [asd2 valueForKey:@"signature"]);
    NSLog(@"personal_sign3 : %@", [NerveTools personalSign:_privKey Message:personalMsg]);
    
    personalMsg = @"d86cf03a175cdaf7";
    asd2 = [web3.eth.accounts sign:personalMsg WithPrivateKey:_privKey];
    NSLog(@"personal_sign4 : %@", [asd2 valueForKey:@"signature"]);
    NSLog(@"personal_sign4 : %@", [NerveTools personalSign:_privKey Message:personalMsg]);

    /** signTypedDataV4 **/
    SwiftClass *sc = [[SwiftClass alloc] init];
    NSString *msg = @"{\"domain\":{\"chainId\":1,\"name\":\"Ether Mail\",\"verifyingContract\":\"0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC\",\"version\":\"1\"},\"message\":{\"contents\":\"Hello, Bobe!\",\"from\":{\"name\":\"Cow\",\"wallets\":[\"0xCD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826\",\"0xDeaDbeefdEAdbeefdEadbEEFdeadbeEFdEaDbeeF\"]},\"to\":[{\"name\":\"Bob\",\"wallets\":[\"0xbBbBBBBbbBBBbbbBbbBbbbbBBbBbbbbBbBbbBBbB\",\"0xB0BdaBea57B0BDABeA57b0bdABEA57b0BDabEa57\",\"0xB0B0b0b0b0b0B000000000000000000000000000\"]}]},\"primaryType\":\"Mail\",\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"Group\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"members\",\"type\":\"Person[]\"}],\"Mail\":[{\"name\":\"from\",\"type\":\"Person\"},{\"name\":\"to\",\"type\":\"Person[]\"},{\"name\":\"contents\",\"type\":\"string\"}],\"Person\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"wallets\",\"type\":\"address[]\"}]}}";
    NSString *str2 = [sc signTypedDataV4WithMessage:msg];
    NSLog(@"encode hash : %@", str2);
    signature = [[str2 parseHexData] signWithPrivateKeyData:[_privKey parseHexData]];
    asd1 = [NSString stringWithFormat:@"0x%@", [signature dataDirectString]];
    NSLog(@"signTypedDataV4 signature : %@", asd1);
    NSLog(@"signTypedDataV4 signature : %@", [NerveTools signTypedDataV4:_privKey Message:msg]);
    // 0x255aeb286e4b55f13aceec4084cb479cf6b13993154e8423e20decdaeed4c6a64be9bd3748131a7a3d1e636dfbecab70cef1ffe18dc590a77a9a6c26c56199801c
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
