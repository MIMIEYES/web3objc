//
//  NerveTools.m
//  Web3Objc
//
//  Created by pierreluo on 2021/3/19.
//  Copyright © 2021 coin. All rights reserved.
//

#import "NerveTools.h"
#import "PKWeb3Objc.h"
#import "BTCKey.h"
#import "Web3Objc-Swift.h"

@implementation NerveTools

static NSString *tokenContractAbi = nil;
static NSString *multyContractAbi = nil;
static NSString *zeroAddress = nil;
static BigNumber *minApprove = nil;
static SwiftClass *sc = nil;
static PKWeb3EthAccounts *accounts = nil;
static PKWeb3Utils *utils = nil;
static NSUInteger etherDecimals = 18;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tokenContractAbi = @"[{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"}],\"name\":\"allowance\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"approve\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"balanceOf\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"decimals\",\"outputs\":[{\"internalType\":\"uint8\",\"name\":\"\",\"type\":\"uint8\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"name\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"symbol\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"totalSupply\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"recipient\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"transfer\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"sender\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"recipient\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"transferFrom\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]";
        multyContractAbi = @"[{\"constant\":false,\"inputs\":[{\"name\":\"to\",\"type\":\"string\"},{\"name\":\"amount\",\"type\":\"uint256\"},{\"name\":\"ERC20\",\"type\":\"address\"}],\"name\":\"crossOut\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"}]";
        zeroAddress = @"0x0000000000000000000000000000000000000000";
        minApprove = [BigNumber bigNumberWithDecimalString:@"39600000000000000000000000000"];
        sc = [[SwiftClass alloc] init];
        accounts = [[PKWeb3EthAccounts alloc] init];
        utils = [[PKWeb3Utils alloc] init];
    });
}

+ (NSString *)sendEth: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey To: (NSString *)_to Value: (NSString *)_value
{
    NSString *from = [web3.eth.accounts privateKeyToAccount:_priKey];
    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
    tx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:from]];
    tx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    tx.gasLimit = [web3.utils numberToHex:@"21000"];
    tx.to = [_to removePrefix0x];
    tx.value = [web3.utils numberToHex:[web3.utils parseEther:_value]];
    NSDictionary *signTx = [web3.eth.accounts signTransaction:tx WithPrivateKey:_priKey];
    return [signTx valueForKey:@"rawTransaction"];
}

+ (NSString *)sendERC20: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey ERC20Contract: (NSString *)_contract ERC20Decimals: (NSUInteger)_decimals To: (NSString *)_to Value: (NSString *)_value
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:tokenContractAbi];
    
    NSString *from = [web3.eth.accounts privateKeyToAccount:_priKey];
    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
    tx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:from]];
    tx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    tx.gasLimit = [web3.utils numberToHex:@"100000"];
    tx.to = [_contract removePrefix0x];
    tx.data = [tokenContract encodeABI:@"transfer(address,uint256)" WithArgument:@[_to, [web3.utils parseUnits:_value WithUnit:_decimals]]];
    NSDictionary *signTx = [web3.eth.accounts signTransaction:tx WithPrivateKey:_priKey];
    return [signTx valueForKey:@"rawTransaction"];
}

+ (NSString *)approveERC20: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey ERC20Contract: (NSString *)_contract ERC20Decimals: (NSUInteger)_decimals To: (NSString *)_to Value: (NSString *)_value
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:tokenContractAbi];
    
    NSString *from = [web3.eth.accounts privateKeyToAccount:_priKey];
    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
    tx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:from]];
    tx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    tx.gasLimit = [web3.utils numberToHex:@"80000"];
    tx.to = [_contract removePrefix0x];
    tx.data = [tokenContract encodeABI:@"approve(address,uint256)" WithArgument:@[_to, [web3.utils parseUnits:_value WithUnit:_decimals]]];
    NSDictionary *signTx = [web3.eth.accounts signTransaction:tx WithPrivateKey:_priKey];
    return [signTx valueForKey:@"rawTransaction"];
}

+ (NSString *)getERC20Allowance: (PKWeb3Objc *) web3 Owner: (NSString *)_owner ERC20Contract: (NSString *)_contract Spender: (NSString *)_spender
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:tokenContractAbi];
    return [tokenContract call:@"allowance(address,address)" WithArgument:@[_owner,_spender]];
}


+ (BOOL)needERC20Allowance: (PKWeb3Objc *) web3 Owner: (NSString *)_owner ERC20Contract: (NSString *)_contract Spender: (NSString *)_spender{
//    NSLog(@"decimalString = %@",[NerveTools getERC20Allowance:web3 Owner:_owner ERC20Contract:_contract Spender:_spender]);
    BigNumber *currentAllowance = [BigNumber bigNumberWithDecimalString:[NerveTools getERC20Allowance:web3 Owner:_owner ERC20Contract:_contract Spender:_spender]];
    if ([currentAllowance lessThan:minApprove]) {
        NSLog(@"授权额度不足，请先授权，当前剩余额度");
        //@TODO throw error
        return YES;
    }
    return NO;
}

+ (NSString *)getERC20Balance: (PKWeb3Objc *) web3 Owner: (NSString *)_owner ERC20Contract: (NSString *)_contract
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:tokenContractAbi];
    return [tokenContract call:@"balanceOf(address)" WithArgument:@[_owner]];
}

+ (NSString *)crossOutWithETH: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey MultyContract: (NSString *)_contract To: (NSString *)_to Value: (NSString *)_value
{
    PKWeb3EthContract *multyContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:multyContractAbi];
    
    NSString *from = [web3.eth.accounts privateKeyToAccount:_priKey];
    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
    NSString *value = [web3.utils parseEther:_value];
    tx.value = [web3.utils numberToHex:value];
    tx.gasPrice = [web3.utils numberToHex:@"1"];
    tx.gasLimit = [web3.utils numberToHex:@"1000000"];
    tx.to = _contract;
    tx.data = [multyContract encodeABI:@"crossOut(string,uint256,address)" WithArgument:@[_to,value,zeroAddress]];
    NSString *result = [web3.eth validateCallFrom:from TX:tx];
    if (result == nil) {
        NSString *estimateGas = [web3.eth estimateGasFrom:from TX:tx];
        if(!estimateGas) {
            NSLog(@"估算gas异常");
            //@TODO throw error
            return @"";
        }
        tx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:from]];
        tx.gasLimit = [web3.utils numberToHex:estimateGas];
        tx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    } else {
        NSLog(@"合约验证错误 : %@", result);
        //@TODO throw error
        return @"";
    }
    NSDictionary *signTx = [web3.eth.accounts signTransaction:tx WithPrivateKey:_priKey];
    return [signTx valueForKey:@"rawTransaction"];
}

+ (NSString *)crossOutWithERC20: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey MultyContract: (NSString *)_multyContract ERC20Contract: (NSString *)_erc20Contract ERC20Decimals: (NSUInteger)_erc20Decimals To: (NSString *)_to Value: (NSString *)_value
{
    PKWeb3EthContract *multyContract = [web3.eth.contract initWithAddress:_multyContract AbiJsonStr:multyContractAbi];
    
    NSString *from = [web3.eth.accounts privateKeyToAccount:_priKey];
    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
    NSString *tokenValue = [web3.utils parseUnits:_value WithUnit:_erc20Decimals];
    tx.gasPrice = [web3.utils numberToHex:@"1"];
    tx.gasLimit = [web3.utils numberToHex:@"1000000"];
    tx.to = _multyContract;
    tx.data = [multyContract encodeABI:@"crossOut(string,uint256,address)" WithArgument:@[_to,tokenValue,_erc20Contract]];
    
    BigNumber *currentAllowance = [BigNumber bigNumberWithDecimalString:[NerveTools getERC20Allowance:web3 Owner:from ERC20Contract:_erc20Contract Spender:_multyContract]];
    if ([currentAllowance lessThan:minApprove]) {
        NSLog(@"授权额度不足，请先授权，当前剩余额度: %@", [web3.utils formatUnits:currentAllowance.decimalString WithUnit:_erc20Decimals]);
        //@TODO throw error
        return @"";
    }
    NSString *result = [web3.eth validateCallFrom:from TX:tx];
    if (result == nil) {
        NSString *estimateGas = [web3.eth estimateGasFrom:from TX:tx];
        if(!estimateGas) {
            NSLog(@"估算gas异常");
            //@TODO throw error
            return @"";
        }
        tx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:from]];
        tx.gasLimit = [web3.utils numberToHex:estimateGas];
        tx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    } else {
        NSLog(@"合约验证错误 : %@", result);
        //@TODO throw error
        return @"";
    }
    NSDictionary *signTx = [web3.eth.accounts signTransaction:tx WithPrivateKey:_priKey];
    return [signTx valueForKey:@"rawTransaction"];
}

+ (NSDictionary *)sendRawTransaction: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey nonce: (NSString *)_nonce gasPrice: (NSString *)_gasPrice gas: (NSString *)_gas To: (NSString *)_to Value: (NSString *)_value  data: (NSString *)_data
{
    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
    if (_nonce == nil || [_nonce isEqualToString:@""]) {
        NSString *from = [web3.eth.accounts privateKeyToAccount:_priKey];
        tx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:from]];
    } else {
        tx.nonce = [web3.utils numberToHex:_nonce];
    }
    if (_gasPrice == nil || [_gasPrice isEqualToString:@""]) {
        tx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    } else {
        tx.gasPrice = [web3.utils numberToHex:_gasPrice];
    }
    tx.gasLimit = [web3.utils numberToHex:_gas];
    tx.to = [_to removePrefix0x];
    if (_value == nil || [_value isEqualToString:@""]) {
        _value = @"0";
    }
    tx.value = [web3.utils numberToHex:_value];
    tx.data = _data;
    NSDictionary *signTx = [web3.eth.accounts signTransaction:tx WithPrivateKey:_priKey];
    return signTx;
//    return [web3.eth sendSignedRawTransaction:[signTx valueForKey:@"rawTransaction"]];
}

+ (NSString *)ethSign: (NSString *)_priKey Message: (NSString *)_message
{
    if (![_message isHex]) {
        return nil;
    }
    NSData *signature;
    signature = [[_message parseHexData] signWithPrivateKeyData:[_priKey parseHexData]];
    NSString *result = [NSString stringWithFormat:@"0x%@", [signature dataDirectString]];
    return result;
}

+ (NSString *)personalSign: (NSString *)_priKey Message: (NSString *)_message
{
    NSDictionary *result = [accounts sign:_message WithPrivateKey:_priKey];
    return [result valueForKey:@"signature"];
}

+ (NSString *)signTypedDataV4: (NSString *)_priKey Message: (NSString *)_message
{
    NSString *str2 = [sc signTypedDataV4WithMessage:_message];
    NSData *signature = [[str2 parseHexData] signWithPrivateKeyData:[_priKey parseHexData]];
    return [NSString stringWithFormat:@"0x%@", [signature dataDirectString]];
}

+ (NSString *)getPrivatekeyByMnemonic: (NSString *)_mnemonic
{
    NSString *prikey = [sc getPrivatekeyByMnemonicWithMnemonic:_mnemonic];
    return prikey;
}

+(NSString *)formatUnits:(NSString *)value WithUnit:(NSUInteger)_unit
{
    return [utils formatUnits:value WithUnit:_unit];
}

+(NSString *)parseUnits:(NSString *)value WithUnit:(NSUInteger)_unit
{
    return [utils parseUnits:value WithUnit:_unit];
}

+ (NSString *)getGasLimit_sendERC20: (PKWeb3Objc *) web3 From: (NSString *)_from ERC20Contract: (NSString *)_contract ERC20Decimals: (NSUInteger)_decimals To: (NSString *)_to Value: (NSString *)_value
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:tokenContractAbi];
    
    NSString *from = _from;
    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
//    tx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:from]];
//    tx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
//    tx.gasLimit = [web3.utils numberToHex:@"150000"];
    tx.to = [_contract removePrefix0x];
    tx.data = [tokenContract encodeABI:@"transfer(address,uint256)" WithArgument:@[_to, [web3.utils parseUnits:_value WithUnit:_decimals]]];
    NSString *estimateGas = [web3.eth estimateGasFrom:from TX:tx];
    if(!estimateGas) {
        NSLog(@"估算gas异常");
        return @"";
    }
    return estimateGas;
}

/// 用于NULS DAPP
+ (NSString *)signMessage: (NSString *)_priKey Message: (NSString *)_message {
    NSData *encodeMsg;
    if (![_message isHex]) {
        encodeMsg = [_message dataUsingEncoding:NSUTF8StringEncoding];
    } else {
        encodeMsg = [_message parseHexData];
    }
    return [[encodeMsg signDataEncodeToDER:[_priKey parseHexData]] dataDirectString];
}

+(NSString *)formatEther:(NSString *)wei
{
    return [utils formatUnits:wei WithUnit:etherDecimals];
}
+(NSString *)parseEther:(NSString *)etherString
{
    return [utils parseUnits:etherString WithUnit:etherDecimals];
}

+ (NSString *)getERC20Symbol: (PKWeb3Objc *) web3 ERC20Contract: (NSString *)_contract
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:tokenContractAbi];
    NSString *result = [tokenContract call:@"symbol()" WithArgument:@[]];
    return result;
}

+ (NSString *)getERC20Name: (PKWeb3Objc *) web3 ERC20Contract: (NSString *)_contract
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:tokenContractAbi];
    NSString *result = [tokenContract call:@"name()" WithArgument:@[]];
    return result;
}

+ (NSString *)getERC20Decimals: (PKWeb3Objc *) web3 ERC20Contract: (NSString *)_contract
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:tokenContractAbi];
    NSString *result = [tokenContract call:@"decimals()" WithArgument:@[]];
    return result;
}

@end
