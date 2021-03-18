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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**test
     web3 init
     */
    PKWeb3Objc *web3 = [PKWeb3Objc sharedInstance];
    [web3 setEndPoint:@"https://ropsten.infura.io/v3/7e086d9f3bdc48e4996a3997b33b032f" AndChainID:@"3"];
    
    /**test
     test var
     */
    NSString *testString = @"hello world";
    NSString *testPrivateKey = @"0x4594348E3482B751AA235B8E580EFEF69DB465B3A291C5662CEDA6459ED12E39";
    NSString *testAddress1 = @"0xc11D9943805e56b630A401D4bd9A29550353EFa1"; //testPrivateKey -> address
    NSString *testAddress2 = @"0xde03261F1bd05bA98Ba1517E4F54A02e63810986";
    NSString *zeroAddress = @"0x0000000000000000000000000000000000000000";
    NSString *multyAddress = @"0x7d759a3330cec9b766aa4c889715535eed3c0484";
    NSString *htTokenAddress = @"0x5cCEffCFd3E2fE4AaCBF57123B6d42DDDc231990";
    NSString *nerveAddress = @"TNVTdTSPRnXkDiagy7enti1KL75NU5AxC9sQA";

    /**test
     web3.crypto
     */
    NSData *testStringData = [testString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *privKeyData = [[testPrivateKey removePrefix0x] parseHexData];
    NSData *pubKeyData = [CVETHWallet _publicKeyFromPrivateKey:privKeyData];
    
    /**test
    web3.utils
    */
    NSLog(@"randomHex 32 : %@", [web3.utils randomHex:32]);
    NSLog(@"sha3 : %@", [web3.utils sha3:@"hello world"]);
    NSLog(@"keccak256 : %@", [web3.utils keccak256:@"hello world"]);
    NSLog(@"toChecksumAddress : %@", [web3.utils toChecksumAddress:[testAddress1 lowercaseString]]);
    NSLog(@"checkAddressChecksum : %@", [web3.utils checkAddressChecksum:testAddress1] ? @"true" : @"false");
    NSLog(@"numberToHex : %@", [web3.utils numberToHex:@"1000"]);
    NSLog(@"hexToNumber : %@", [web3.utils hexToNumber:@"0x123"]);
    NSLog(@"utf8ToHex : %@", [web3.utils utf8ToHex:@"hello world"]);
    NSLog(@"hexToUtf8 : %@", [web3.utils hexToUtf8:@"0x68656c6c6f20776f726c64"]);
    NSLog(@"toWei : %@", [web3.utils toWei:@"10" WithUnit:@"ether"]);
    NSLog(@"fromWei : %@", [web3.utils fromWei:@"1000000" WithUnit:@"ether"]);
    
    /**test
     web3.eth.accounts*/
    NSLog(@"create : %@", [web3.eth.accounts create]);
    NSLog(@"privateKeyToAccount : %@", [web3.eth.accounts privateKeyToAccount:testPrivateKey]);
    
    /** ETH转账0.01个，from testAddress1 to testAddress2 **/
    CVETHTransaction *testTx = [[CVETHTransaction alloc] init];
    testTx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
    testTx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    testTx.gasLimit = [web3.utils numberToHex:@"21000"];
    testTx.to = [testAddress2 removePrefix0x];
    testTx.value = [web3.utils numberToHex:[web3.utils toWei:@"0.01" WithUnit:@"ether"]];
    NSDictionary *signTx = [web3.eth.accounts signTransaction:testTx WithPrivateKey:testPrivateKey];
    NSLog(@"signTransaction : %@", signTx);
    NSLog(@"signtx-recover : %@", [web3.eth.accounts recoverTransaction:[signTx valueForKey:@"rawTransaction"]]);
    NSLog(@"signtx-rlp decode : %@", rlp_decode([[signTx valueForKey:@"rawTransaction"] parseHexData]));
    /** 估算gaslimit **/
    NSLog(@"estimateGasFrom : %@", [web3.eth estimateGasFrom:testAddress2 TX:testTx]);
    
    /** 广播交易 **/
    //NSLog(@"sendSignedTransaction : %@", [web3.eth sendSignedTransaction:[signTx valueForKey:@"rawTransaction"]]);

    /** 获取nonce **/
    NSLog(@"getTranactionCount : %@", [web3.eth getTranactionCount:testAddress2]);
    /** 获取当前网络平均价格 **/
    NSLog(@"getGasPrice : %@", [web3.eth getGasPrice]);
    /** 获取网络最新高度 **/
    NSLog(@"getBlockNumber : %@", [web3.eth getBlockNumber]);
    /** 获取地址余额 **/
    NSLog(@"getBalance : %@", [web3.utils fromWei:[web3.eth getBalance:testAddress2] WithUnit:@"ether"]);
    
    
    
    /** 查询地址的token余额 **/
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:htTokenAddress AbiJsonStr:@"[{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"balanceOf\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"type\":\"function\"},{\"name\":\"transfer\",\"type\":\"function\",\"inputs\":[{\"name\":\"_to\",\"type\":\"address\"},{\"type\":\"uint256\",\"name\":\"_tokens\"}],\"constant\":false,\"outputs\":[],\"payable\":false},{\"constant\":true,\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"}],\"name\":\"allowance\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"approve\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]"];
    NSLog(@"encodeABI : %@", [tokenContract encodeABI:@"balanceOf(address)" WithArgument:@[testAddress1]]);
    NSLog(@"查询testAddress1的token余额 : %@", [tokenContract call:@"balanceOf(address)" WithArgument:@[testAddress1]]);
    
    /** token转账 0.1个HT，from testAddress1 to testAddress2 **/
    CVETHTransaction *testTx1 = [[CVETHTransaction alloc] init];
    testTx1.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
    testTx1.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    testTx1.gasLimit = [web3.utils numberToHex:@"100000"];
    testTx1.to = [htTokenAddress removePrefix0x];
    testTx1.data = [tokenContract encodeABI:@"transfer(address,uint256)" WithArgument:@[testAddress2, @"100000000000000000"]];
    NSDictionary *signTx1 = [web3.eth.accounts signTransaction:testTx1 WithPrivateKey:testPrivateKey];
    //NSLog(@"广播token转账交易 : %@", [web3.eth sendSignedTransaction:[signTx1 valueForKey:@"rawTransaction"]]);
    NSLog(@"广播token转账交易 : %@", [signTx1 valueForKey:@"rawTransaction"]);

    /** token授权 1个HT，from testAddress1 to testAddress2 **/
    CVETHTransaction *testTx2 = [[CVETHTransaction alloc] init];
    testTx2.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
    testTx2.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    testTx2.gasLimit = [web3.utils numberToHex:@"80000"];
    testTx2.to = [htTokenAddress removePrefix0x];
    testTx2.data = [tokenContract encodeABI:@"approve(address,uint256)" WithArgument:@[testAddress2, @"1000000000000000000"]];
    NSDictionary *signTx2 = [web3.eth.accounts signTransaction:testTx2 WithPrivateKey:testPrivateKey];
    //NSLog(@"广播token授权交易 : %@", [web3.eth sendSignedTransaction:[signTx2 valueForKey:@"rawTransaction"]]);
    NSLog(@"广播token授权交易 : %@", [signTx2 valueForKey:@"rawTransaction"]);

    /** 查询地址的token授权额度 (testAddress1授权给testAddress2使用的额度) **/
    NSLog(@"查询testAddress2的授权额度 : %@", [tokenContract call:@"allowance(address,address)" WithArgument:@[testAddress1,testAddress2]]);

    /** 判断授权额度 < 396 * 10的26次方，则需要用户授权 **/
    // 代码略

    /** eth网络跨链转入nerve，这里有两种情况，一种是转主资产eth，另一种是转token **/
    PKWeb3EthContract *multyContract = [web3.eth.contract initWithAddress:multyAddress AbiJsonStr:@"[{\"constant\":false,\"inputs\":[{\"name\":\"to\",\"type\":\"string\"},{\"name\":\"amount\",\"type\":\"uint256\"},{\"name\":\"ERC20\",\"type\":\"address\"}],\"name\":\"crossOut\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"}]"];

    // 第一种，转主资产eth，0.01个，from testAddress1 to nerveAddress
    CVETHTransaction *testTx3 = [[CVETHTransaction alloc] init];
    NSString *value = [web3.utils toWei:@"0.01" WithUnit:@"ether"];
    testTx3.value = [web3.utils numberToHex:value];
    testTx3.gasPrice = [web3.utils numberToHex:@"1"];
    testTx3.gasLimit = [web3.utils numberToHex:@"1000000"];
    testTx3.to = multyAddress;
    testTx3.data = [multyContract encodeABI:@"crossOut(string,uint256,address)" WithArgument:@[nerveAddress,value,zeroAddress]];
    NSString *estimateGas = [web3.eth estimateGasFrom:testAddress1 TX:testTx3];
    testTx3.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
    testTx3.gasLimit = [web3.utils numberToHex:estimateGas];
    testTx3.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    NSDictionary *signTx3 = [web3.eth.accounts signTransaction:testTx3 WithPrivateKey:testPrivateKey];
//    NSLog(@"广播eth跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:[signTx3 valueForKey:@"rawTransaction"]]);
    NSLog(@"广播eth跨链转入nerve交易 : %@", [signTx3 valueForKey:@"rawTransaction"]);

    //todo PKWeb3EthContract对象中，abiDic貌似一个共享变量
    //todo 测试有问题m，暂时注释
    // 第二种，转token资产HT，2个，from testAddress1 to nerveAddress
//    CVETHTransaction *testTx4 = [[CVETHTransaction alloc] init];
//    testTx4.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
//    testTx4.gasPrice = [web3.utils numberToHex:@"1"];
//    testTx4.gasLimit = [web3.utils numberToHex:@"1000000"];
//    testTx4.to = [multyAddress removePrefix0x];
//    testTx4.data = [multyContract encodeABI:@"crossOut(string,uint256,address)" WithArgument:@[nerveAddress,@"2000000000000000000",htTokenAddress]];
//    NSLog(@"estimateGasFrom : %@", [web3.eth estimateGasFrom:testAddress1 TX:testTx4]);
//    testTx4.gasLimit = [web3.eth estimateGasFrom:testAddress1 TX:testTx4];
//    testTx4.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
//    NSDictionary *signTx4 = [web3.eth.accounts signTransaction:testTx4 WithPrivateKey:testPrivateKey];
//    //NSLog(@"广播token跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:signTx4]);
//    NSLog(@"广播token跨链转入nerve交易 : %@", [signTx4 valueForKey:@"rawTransaction"]);
    
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
