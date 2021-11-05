//
//  NerveTools.h
//  Web3Objc
//
//  Created by pierreluo on 2021/3/19.
//  Copyright © 2021 coin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKWeb3Objc.h"

@interface NerveTools : NSObject

+ (NSString *)sendEth: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey To: (NSString *)_to Value: (NSString *)_value;

+ (NSString *)sendERC20: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey ERC20Contract: (NSString *)_contract ERC20Decimals: (NSUInteger)_decimals To: (NSString *)_to Value: (NSString *)_value;

+ (NSString *)approveERC20: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey ERC20Contract: (NSString *)_contract ERC20Decimals: (NSUInteger)_decimals To: (NSString *)_to Value: (NSString *)_value;

+ (NSString *)getERC20Allowance: (PKWeb3Objc *) web3 Owner: (NSString *)_owner ERC20Contract: (NSString *)_contract Spender: (NSString *)_spender;

/// 查询是否授权
+ (BOOL)needERC20Allowance: (PKWeb3Objc *) web3 Owner: (NSString *)_owner ERC20Contract: (NSString *)_contract Spender: (NSString *)_spender;

+ (NSString *)getERC20Balance: (PKWeb3Objc *) web3 Owner: (NSString *)_owner ERC20Contract: (NSString *)_contract;

+ (NSString *)crossOutWithETH: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey MultyContract: (NSString *)_contract To: (NSString *)_to Value: (NSString *)_value;

+ (NSString *)crossOutWithERC20: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey MultyContract: (NSString *)_multyContract ERC20Contract: (NSString *)_erc20Contract ERC20Decimals: (NSUInteger)_erc20Decimals To: (NSString *)_to Value: (NSString *)_value;

+ (NSDictionary *)sendRawTransaction: (PKWeb3Objc *) web3 PriKey: (NSString *)_priKey nonce: (NSString *)_nonce gasPrice: (NSString *)_gasPrice gas: (NSString *)_gas To: (NSString *)_to Value: (NSString *)_value  data: (NSString *)_data;

+ (NSString *)ethSign: (NSString *)_priKey Message: (NSString *)_message;

+ (NSString *)personalSign: (NSString *)_priKey Message: (NSString *)_message;

+ (NSString *)signTypedDataV4: (NSString *)_priKey Message: (NSString *)_message;

+ (NSString *)getPrivatekeyByMnemonic: (NSString *)_mnemonic;

+(NSString *)formatUnits:(NSString *)value WithUnit:(NSUInteger)_unit;

+(NSString *)parseUnits:(NSString *)value WithUnit:(NSUInteger)_unit;

+ (NSString *)getGasLimit_sendERC20: (PKWeb3Objc *) web3 From: (NSString *)_from ERC20Contract: (NSString *)_contract ERC20Decimals: (NSUInteger)_decimals To: (NSString *)_to Value: (NSString *)_value;

/// 用于NULS DAPP
+ (NSString *)signMessage: (NSString *)_priKey Message: (NSString *)_message;

+(NSString *)formatEther:(NSString *)wei;

+(NSString *)parseEther:(NSString *)etherString;

/// token资产的简称
+ (NSString *)getERC20Symbol: (PKWeb3Objc *) web3 ERC20Contract: (NSString *)_contract;

/// token资产的名字
+ (NSString *)getERC20Name: (PKWeb3Objc *) web3 ERC20Contract: (NSString *)_contract;

/// token资产的精度
+ (NSString *)getERC20Decimals: (PKWeb3Objc *) web3 ERC20Contract: (NSString *)_contract;

@end


