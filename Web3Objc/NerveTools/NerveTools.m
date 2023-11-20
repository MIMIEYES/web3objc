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
#import "CVETHWallet.h"
#import <openssl/ec.h>
#import <openssl/bn.h>
#import <openssl/evp.h>
#import <openssl/asn1t.h>
#import <openssl/crypto.h>
#import <openssl/ecdh.h>

@implementation NerveTools

static NSString *tokenContractAbi = nil;
static NSString *nftTokenContractAbi = nil;
static NSString *multyContractAbi = nil;
static NSString *zeroAddress = nil;
static BigNumber *minApprove = nil;
static SwiftClass *sc = nil;
static PKWeb3EthAccounts *accounts = nil;
static PKWeb3Utils *utils = nil;
static NSUInteger etherDecimals = 18;
static NSData *defaultIvData = nil;

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tokenContractAbi = @"[{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"}],\"name\":\"allowance\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"spender\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"approve\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"balanceOf\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"decimals\",\"outputs\":[{\"internalType\":\"uint8\",\"name\":\"\",\"type\":\"uint8\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"name\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"symbol\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"totalSupply\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"recipient\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"transfer\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"sender\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"recipient\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amount\",\"type\":\"uint256\"}],\"name\":\"transferFrom\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]";
        nftTokenContractAbi = @"[{\"inputs\":[{\"internalType\":\"string\",\"name\":\"name\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"symbol\",\"type\":\"string\"},{\"internalType\":\"string\",\"name\":\"baseTokenURI\",\"type\":\"string\"}],\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"approved\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"Approval\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"operator\",\"type\":\"address\"},{\"indexed\":false,\"internalType\":\"bool\",\"name\":\"approved\",\"type\":\"bool\"}],\"name\":\"ApprovalForAll\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":false,\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"Paused\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"previousAdminRole\",\"type\":\"bytes32\"},{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"newAdminRole\",\"type\":\"bytes32\"}],\"name\":\"RoleAdminChanged\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"sender\",\"type\":\"address\"}],\"name\":\"RoleGranted\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"sender\",\"type\":\"address\"}],\"name\":\"RoleRevoked\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":true,\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"indexed\":true,\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"Transfer\",\"type\":\"event\"},{\"anonymous\":false,\"inputs\":[{\"indexed\":false,\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"Unpaused\",\"type\":\"event\"},{\"inputs\":[],\"name\":\"DEFAULT_ADMIN_ROLE\",\"outputs\":[{\"internalType\":\"bytes32\",\"name\":\"\",\"type\":\"bytes32\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"MINTER_ROLE\",\"outputs\":[{\"internalType\":\"bytes32\",\"name\":\"\",\"type\":\"bytes32\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"PAUSER_ROLE\",\"outputs\":[{\"internalType\":\"bytes32\",\"name\":\"\",\"type\":\"bytes32\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"approve\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"}],\"name\":\"balanceOf\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"burn\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"getApproved\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"}],\"name\":\"getRoleAdmin\",\"outputs\":[{\"internalType\":\"bytes32\",\"name\":\"\",\"type\":\"bytes32\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"uint256\",\"name\":\"index\",\"type\":\"uint256\"}],\"name\":\"getRoleMember\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"}],\"name\":\"getRoleMemberCount\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"grantRole\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"hasRole\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"operator\",\"type\":\"address\"}],\"name\":\"isApprovedForAll\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"}],\"name\":\"mint\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"name\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"ownerOf\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"pause\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"paused\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"renounceRole\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes32\",\"name\":\"role\",\"type\":\"bytes32\"},{\"internalType\":\"address\",\"name\":\"account\",\"type\":\"address\"}],\"name\":\"revokeRole\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"safeTransferFrom\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"},{\"internalType\":\"bytes\",\"name\":\"_data\",\"type\":\"bytes\"}],\"name\":\"safeTransferFrom\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"operator\",\"type\":\"address\"},{\"internalType\":\"bool\",\"name\":\"approved\",\"type\":\"bool\"}],\"name\":\"setApprovalForAll\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"bytes4\",\"name\":\"interfaceId\",\"type\":\"bytes4\"}],\"name\":\"supportsInterface\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"symbol\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"index\",\"type\":\"uint256\"}],\"name\":\"tokenByIndex\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"index\",\"type\":\"uint256\"}],\"name\":\"tokenOfOwnerByIndex\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"tokenURI\",\"outputs\":[{\"internalType\":\"string\",\"name\":\"\",\"type\":\"string\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"totalSupply\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"from\",\"type\":\"address\"},{\"internalType\":\"address\",\"name\":\"to\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"tokenId\",\"type\":\"uint256\"}],\"name\":\"transferFrom\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[],\"name\":\"unpause\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]";
        multyContractAbi = @"[{\"constant\":false,\"inputs\":[{\"name\":\"to\",\"type\":\"string\"},{\"name\":\"amount\",\"type\":\"uint256\"},{\"name\":\"ERC20\",\"type\":\"address\"}],\"name\":\"crossOut\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"}]";
        zeroAddress = @"0x0000000000000000000000000000000000000000";
        minApprove = [BigNumber bigNumberWithDecimalString:@"39600000000000000000000000000"];
        sc = [[SwiftClass alloc] init];
        accounts = [[PKWeb3EthAccounts alloc] init];
        utils = [[PKWeb3Utils alloc] init];
        defaultIvData = [@"00000000000000000000000000000000" parseHexData];
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

+ (NSString *)sendERC721: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey ERC721Contract: (NSString *)_contract To: (NSString *)_to TokenId: (NSString *)_tokenId HexData: (NSString *)_hexData
{
    PKWeb3EthContract *tokenContract = [web3.eth.contract initWithAddress:_contract AbiJsonStr:nftTokenContractAbi];
    
    NSString *from = [web3.eth.accounts privateKeyToAccount:_priKey];
    CVETHTransaction *tx = [[CVETHTransaction alloc] init];
    tx.nonce = [web3.utils numberToHex:[web3.eth getTranactionCount:from]];
    tx.gasPrice = [web3.utils numberToHex:[web3.eth getGasPrice]];
    tx.gasLimit = [web3.utils numberToHex:@"1000000"];
    tx.to = [_contract removePrefix0x];
    if (_hexData != nil) {
        _hexData = [_hexData addPrefix0x];
    }
    tx.data = [tokenContract encodeABI:@"safeTransferFrom(address,address,uint256,bytes)" WithArgument:@[from, _to, _tokenId, _hexData]];
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

+ (NSString *)computeECDH:(NSString *)publicKey privateKey:(NSString *)otherPrivateKey{
    if (!publicKey || publicKey.length == 0 || !otherPrivateKey || otherPrivateKey.length == 0) {
        return nil;
    }
    
    const char *public_key = publicKey.UTF8String;
    const char *other_private_key = otherPrivateKey.UTF8String; // 私钥
    EC_GROUP *group = EC_GROUP_new_by_curve_name(NID_secp256k1); // 椭圆曲线
    
    EC_POINT *pub_point = NULL;  // 公钥
    BIGNUM *pri_big_num = NULL; // 私钥
    EC_KEY *key = NULL;  // 密钥结构体
    NSString *ecdhStr = nil; // 协商出的密钥字符

    do {
        // 公钥转换为 EC_POINT
        pub_point = EC_POINT_new(group);
        EC_POINT_hex2point(group, public_key, pub_point, NULL);
        // 私钥转换为 BIGNUM 并存储在 EC_KEY 中
        if (!BN_hex2bn(&pri_big_num, other_private_key)) {
            break;
        }
        key = EC_KEY_new();
        if (!EC_KEY_set_group(key, group)) {
            break;
        }
        if (!EC_KEY_set_private_key(key, pri_big_num)) {
            break;
        }
        
        size_t outlen = 32;
        uint8_t *ecdh_text = (uint8_t *)OPENSSL_malloc(outlen + 1);
        int ret = ECDH_compute_key(ecdh_text, outlen, pub_point, key, 0);
        if (ret <= 0) {
            break;
        }
        NSData *ecdhData = [NSData dataWithBytes:ecdh_text length:outlen];
        ecdhStr = [ecdhData dataDirectString];
        
        OPENSSL_free(ecdh_text);
    } while (NO);
    
    if (group != NULL) EC_GROUP_free(group);
    EC_POINT_free(pub_point);
    BN_free(pri_big_num);
    EC_KEY_free(key);
    
    return ecdhStr;
}

+(NSString *)encryptMessage:(NSString *)_message WithPubKey:(NSString *)_pubkey
{
    
    NSData *messageData = [_message dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [CVETHWallet encryptMessage:messageData WithPubKey:[_pubkey parseHexData] WithIV:defaultIvData];
    if (dic == nil) {
        return nil;
    }
    NSData *ephemPublicKeyData = [dic valueForKey:@"ephemPublicKey"];
    NSData *ivData = [dic valueForKey:@"iv"];
    NSData *cipherData = [dic valueForKey:@"cipher"];
    NSData *macData = [dic valueForKey:@"mac"];
    NSMutableData *dataToMac = [[NSMutableData alloc] init];
    [dataToMac appendData:ephemPublicKeyData];
    [dataToMac appendData:ivData];
    [dataToMac appendData:cipherData];
    [dataToMac appendData:macData];
    return [dataToMac dataDirectString];
}

+(NSString *)decryptMessage:(NSString *)_encMessage WithPrivKey:(NSString *)_privkey
{
    NSData *dataBytes = [_encMessage parseHexData];
    unsigned long length = dataBytes.length;
    unsigned long encryptSize = length - 65 - 16 - 32;
    NSData *ephemPublicKey = [NSData dataWithBytesNoCopy:(char *)dataBytes.bytes + 0 length:65 freeWhenDone:false];
    NSData *iv = [NSData dataWithBytesNoCopy:(char *)dataBytes.bytes + 65 length:16 freeWhenDone:false];
    NSData *cipher = [NSData dataWithBytesNoCopy:(char *)dataBytes.bytes + 65 + 16 length:encryptSize freeWhenDone:false];
    NSData *mac = [NSData dataWithBytesNoCopy:(char *)dataBytes.bytes + length - 32 length:32 freeWhenDone:false];
    NSDictionary *_encData = @{@"ephemPublicKey":ephemPublicKey, @"iv":iv, @"mac":mac, @"cipher":cipher};
    NSData *decryptMessage = [CVETHWallet decryptMessage:_encData WithPrivKey:[_privkey parseHexData]];
    NSString *decryptMessageString = [[NSString alloc] initWithData:decryptMessage encoding:NSUTF8StringEncoding];
    return decryptMessageString;
}

///MARK: - 使用evm系私钥计算btc私钥
/// @param evmPrikey 以太系私钥
/// @param mainnet 是否主网
+(NSString *)calcBtcPriByEvmPri:(NSString *)evmPrikey WithMainnet:(BOOL)mainnet
{
    NSString *prefix = @"ef";
    if (mainnet) {
        prefix = @"80";
    }
    NSString *cleanHexPrefix = [[evmPrikey removePrefix0x] hexUp];
    if (cleanHexPrefix.length != 64) {
        NSLog(@"Invalid Key");
        return nil;
    }
    NSString *extendedKey = [[prefix stringByAppendingString:cleanHexPrefix] stringByAppendingString:@"01"];
    NSData *hashTwice = [[[extendedKey parseHexData] sha256] sha256];
    NSString *hashTwiceHex = [hashTwice dataDirectString];
    NSString *checksum = [hashTwiceHex substringWithRange:NSMakeRange(0, 8)];
    extendedKey = [extendedKey stringByAppendingString:checksum];
    NSString *btcKey = [[extendedKey parseHexData] base58];
    return btcKey;
}

///MARK: - 使用btc私钥计算evm系私钥
/// @param btcKey btc网络私钥
/// @param mainnet 是否主网
+(NSString *)calcEvmPriByBtcPri:(NSString *)btcKey WithMainnet:(BOOL)mainnet
{
    NSData *btcData = [btcKey base58ToData];
    if (btcData == NULL) {
        NSLog(@"Error BTC Private Key");
        return nil;
    }
    NSString *btcHex = [btcData dataDirectString];
    NSString *prefixBtc = [btcHex substringWithRange:NSMakeRange(0, 2)];
    if (mainnet) {
        if (![prefixBtc isEqualToString:@"80"]) {
            NSLog(@"Error BTC Private Key");
            return nil;
        }
    } else {
        if (![[prefixBtc lowercaseString] isEqualToString:@"ef"]) {
            NSLog(@"Error BTC Private Key");
            return nil;
        }
    }
    NSString *btcChecksum = [btcHex substringWithRange:NSMakeRange(btcHex.length - 8, 8)];
    NSString *btcExtendedKey = [btcHex substringWithRange:NSMakeRange(0, btcHex.length - 8)];
    NSData *btcHashTwice = [[[btcExtendedKey parseHexData] sha256] sha256];
    NSString *btcHashTwiceHex = [btcHashTwice dataDirectString];
    NSString *calcBtcChecksum = [btcHashTwiceHex substringWithRange:NSMakeRange(0, 8)];
    if (![[btcChecksum lowercaseString] isEqualToString:[calcBtcChecksum lowercaseString]]) {
        NSLog(@"Error BTC checksum");
        return nil;
    }
    NSString *calcEvmPrikey = [btcExtendedKey substringWithRange:NSMakeRange(2, 64)];
    return calcEvmPrikey;
}

@end
