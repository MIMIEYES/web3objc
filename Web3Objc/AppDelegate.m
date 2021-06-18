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
    NSLog(@"getBalance : %@", [web3.utils formatEther:[web3.eth getBalance:testAddress2]]);
    
    
    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【区块链网络相关】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    /** 获取当前网络平均价格 **/
    NSLog(@"getGasPrice : %@", [web3.eth getGasPrice]);
    /** 获取网络最新高度 **/
    NSLog(@"getBlockNumber : %@", [web3.eth getBlockNumber]);
    
    
    /**-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=【组装交易并广播交易】-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=****/
    /** ETH转账0.01个，from testAddress1 to testAddress2 **/
    NSString *ethTx = [NerveTools sendEth:web3 PriKey:testPrivateKey To:testAddress2 Value:@"0.02"];
    NSLog(@"广播eth转账交易 : %@", [web3.eth sendSignedTransaction:ethTx]);


    /** 查询地址的token余额 */
    NSString *tokenBalance = [NerveTools getERC20Balance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress];
    NSLog(@"查询testAddress1的token余额 : %@", tokenBalance);

    /** token转账 0.1个HT，from testAddress1 to testAddress2 **/
    NSString *erc20Tx = [NerveTools sendERC20:web3 PriKey:testPrivateKey ERC20Contract:htTokenAddress ERC20Decimals:18 To:testAddress2 Value:@"0.1"];
    NSLog(@"广播token转账交易 : %@", [web3.eth sendSignedTransaction:erc20Tx]);

    /** token授权 1个HT，from testAddress1 to testAddress2 **/
    NSString *approveTx = [NerveTools approveERC20:web3 PriKey:testPrivateKey ERC20Contract:htTokenAddress ERC20Decimals:18 To:testAddress2 Value:@"1"];
    NSLog(@"广播token授权交易 : %@", [web3.eth sendSignedTransaction:approveTx]);

    /** 查询地址的token授权额度 **/
    NSString *allowance = [NerveTools getERC20Allowance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress Spender:multyAddress];
    NSLog(@"查询testAddress1授权给multyAddress的授权额度 : %@", allowance);
    NSString *allowance1 = [NerveTools getERC20Allowance:web3 Owner:testAddress1 ERC20Contract:htTokenAddress Spender:testAddress2];
    NSLog(@"查询testAddress1授权给testAddress2的授权额度 : %@", allowance1);

    /** eth网络跨链转入nerve，这里有两种情况，一种是转主资产eth，另一种是转token **/
    // 第一种，转主资产eth，0.01个，from testAddress1 to nerveAddress
    NSString *crossTxWithEth = [NerveTools crossOutWithETH:web3 PriKey:testPrivateKey MultyContract:multyAddress To:nerveAddress Value:@"0.01"];
    NSLog(@"广播eth跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:crossTxWithEth]);

    // 第二种，转token资产HT，2个，from testAddress1 to nerveAddress
    NSString *crossTxWithERC20 = [NerveTools crossOutWithERC20:web3 PriKey:testPrivateKey MultyContract:multyAddress ERC20Contract:htTokenAddress ERC20Decimals:18 To:nerveAddress Value:@"2"];
    NSLog(@"广播token跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:crossTxWithERC20]);
    
    /** Nabox 插件接收应用传递的交易原始参数，组装交易 **/
    NSString *tx = [NerveTools sendRawTransaction:web3 PriKey:testPrivateKey nonce:@"84" gasPrice:@"10000000000" gas:@"22000" To:testAddress2 Value:@"" data:@""];
    NSLog(@"Nabox广播eth交易 : %@", [web3.eth sendSignedTransaction:tx]);
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
