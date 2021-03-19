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
    testTx.value = [web3.utils numberToHex:[web3.utils parseEther:@"0.01"]];
    NSDictionary *signTx = [web3.eth.accounts signTransaction:testTx WithPrivateKey:testPrivateKey];
    /** 估算gaslimit **/
    NSLog(@"estimateGasFrom : %@", [web3.eth estimateGasFrom:testAddress2 TX:testTx]);
    //NSLog(@"广播eth转账交易 : %@", [web3.eth sendSignedTransaction:[signTx valueForKey:@"rawTransaction"]]);
    NSLog(@"签名的eth转账交易 : %@", [signTx valueForKey:@"rawTransaction"]);

    /** 获取nonce **/
    NSLog(@"getTranactionCount : %@", [web3.eth getTranactionCount:testAddress2]);
    /** 获取当前网络平均价格 **/
    NSLog(@"getGasPrice : %@", [web3.eth getGasPrice]);
    /** 获取网络最新高度 **/
    NSLog(@"getBlockNumber : %@", [web3.eth getBlockNumber]);
    /** 获取地址余额 **/
    NSLog(@"getBalance : %@", [web3.utils formatEther:[web3.eth getBalance:testAddress2]]);
    
    
    
    /** 查询地址的token余额 **/
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:htTokenAddress AbiJsonStr:@"[{\"constant\":true,\"inputs\":[{\"name\":\"\",\"type\":\"address\"}],\"name\":\"balanceOf\",\"outputs\":[{\"name\":\"\",\"type\":\"uint256\"}],\"type\":\"function\"},{\"name\":\"transfer\",\"type\":\"function\",\"inputs\":[{\"name\":\"_to\",\"type\":\"address\"},{\"type\":\"uint256\",\"name\":\"_tokens\"}],\"constant\":false,\"outputs\":[],\"payable\":false},{\"constant\":true,\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"}],\"name\":\"allowance\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"approve\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]"];
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
    NSLog(@"签名的token转账交易 : %@", [signTx1 valueForKey:@"rawTransaction"]);

    /** token授权 1个HT，from testAddress1 to testAddress2 **/
    CVETHTransaction *testTx2 = [[CVETHTransaction alloc] init];
    testTx2.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
    testTx2.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    testTx2.gasLimit = [web3.utils numberToHex:@"80000"];
    testTx2.to = [htTokenAddress removePrefix0x];
    testTx2.data = [tokenContract encodeABI:@"approve(address,uint256)" WithArgument:@[testAddress2, @"1000000000000000000"]];
    NSDictionary *signTx2 = [web3.eth.accounts signTransaction:testTx2 WithPrivateKey:testPrivateKey];
    //NSLog(@"广播token授权交易 : %@", [web3.eth sendSignedTransaction:[signTx2 valueForKey:@"rawTransaction"]]);
    NSLog(@"签名的token授权交易 : %@", [signTx2 valueForKey:@"rawTransaction"]);

    /** 查询地址的token授权额度 (testAddress1授权给multyAddress使用的额度) **/
    NSString *allowance = [tokenContract call:@"allowance(address,address)" WithArgument:@[testAddress1,multyAddress]];
    NSLog(@"查询multyAddress的授权额度 : %@", allowance);

    /** eth网络跨链转入nerve，这里有两种情况，一种是转主资产eth，另一种是转token **/
    PKWeb3EthContract *multyContract = [web3.eth.contract initWithAddress:multyAddress AbiJsonStr:@"[{\"constant\":false,\"inputs\":[{\"name\":\"to\",\"type\":\"string\"},{\"name\":\"amount\",\"type\":\"uint256\"},{\"name\":\"ERC20\",\"type\":\"address\"}],\"name\":\"crossOut\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"}]"];

    // 第一种，转主资产eth，0.01个，from testAddress1 to nerveAddress
    CVETHTransaction *testTx3 = [[CVETHTransaction alloc] init];
    NSString *value = [web3.utils parseEther:@"0.01"];
    testTx3.value = [web3.utils numberToHex:value];
    testTx3.gasPrice = [web3.utils numberToHex:@"1"];
    testTx3.gasLimit = [web3.utils numberToHex:@"1000000"];
    testTx3.to = multyAddress;
    testTx3.data = [multyContract encodeABI:@"crossOut(string,uint256,address)" WithArgument:@[nerveAddress,value,zeroAddress]];
    NSString *result3 = [web3.eth validateCallFrom:testAddress1 TX:testTx3];
    if (result3 == nil) {
        NSLog(@"合约验证成功");
        NSString *estimateGas3 = [web3.eth estimateGasFrom:testAddress1 TX:testTx3];
        NSLog(@"estimateGas3: %@", estimateGas3);
        testTx3.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
        testTx3.gasLimit = [web3.utils numberToHex:estimateGas3];
        testTx3.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    } else {
        NSLog(@"合约验证错误 : %@", result3);
        return NO;
    }
    NSDictionary *signTx3 = [web3.eth.accounts signTransaction:testTx3 WithPrivateKey:testPrivateKey];
    //NSLog(@"广播eth跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:[signTx3 valueForKey:@"rawTransaction"]]);
    NSLog(@"签名的eth跨链转入nerve交易 : %@", [signTx3 valueForKey:@"rawTransaction"]);

    // 第二种，转token资产HT，2个，from testAddress1 to nerveAddress
    CVETHTransaction *testTx4 = [[CVETHTransaction alloc] init];
    NSUInteger tokenDecimals = 18;
    NSString *tokenValue = [web3.utils parseUnits:@"2" WithUnit:tokenDecimals];
    testTx4.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
    testTx4.gasPrice = [web3.utils numberToHex:@"1"];
    testTx4.gasLimit = [web3.utils numberToHex:@"1000000"];
    testTx4.to = multyAddress;
    testTx4.data = [multyContract encodeABI:@"crossOut(string,uint256,address)" WithArgument:@[nerveAddress,tokenValue,htTokenAddress]];
    // 检查授权逻辑，判断授权额度 < 396 * 10的26次方，则需要用户授权
    BigNumber *minApprove = [BigNumber bigNumberWithDecimalString:@"39600000000000000000000000000"];
    BigNumber *currentAllowance = [BigNumber bigNumberWithDecimalString:allowance];
    if ([currentAllowance lessThan:minApprove]) {
        NSLog(@"授权额度不足，请先授权，当前剩余额度: %@", [web3.utils formatUnits:allowance WithUnit:18]);
        return NO;
    }
    NSLog(@"testTx4.nonce: %@", testTx4.nonce);
    NSLog(@"testTx4.gasPrice: %@", testTx4.gasPrice);
    NSLog(@"testTx4.gasLimit: %@", testTx4.gasLimit);
    NSLog(@"testTx4.to: %@", testTx4.to);
    NSLog(@"testTx4.data: %@", testTx4.data);
    NSString *result = [web3.eth validateCallFrom:testAddress1 TX:testTx4];
    if (result == nil) {
        NSLog(@"合约验证成功");
        NSString *estimateGas4 = [web3.eth estimateGasFrom:testAddress1 TX:testTx4];
        NSLog(@"estimateGas4: %@", estimateGas4);
        testTx4.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:testAddress1]];
        testTx4.gasLimit = [web3.utils numberToHex:estimateGas4];
        testTx4.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    } else {
        NSLog(@"合约验证错误 : %@", result);
        return NO;
    }
    NSDictionary *signTx4 = [web3.eth.accounts signTransaction:testTx4 WithPrivateKey:testPrivateKey];
    //NSLog(@"广播token跨链转入nerve交易 : %@", [web3.eth sendSignedTransaction:[signTx4 valueForKey:@"rawTransaction"]]);
    NSLog(@"签名的token跨链转入nerve交易 : %@", [signTx4 valueForKey:@"rawTransaction"]);
    
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
