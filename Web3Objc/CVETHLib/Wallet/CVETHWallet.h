//
//  CVETHWallet.h
//  CVETHWallet
//
//  Created by coin on 03/09/2019.
//  Copyright © 2019 coin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CVETHWallet : NSObject
+(NSString *)getRandomKeyByLength:(NSInteger)_length;
+(NSString *)getRandomKeyByBytes:(NSInteger)_bytes;
+(NSString *)getWalletAddressFromPrivateKey:(NSString *)_privKey;
+(NSString *)getWalletAddressFromPublicKey:(NSData *)_pubKey;
+(NSString *)getCheckSumAddress:(NSString *)_address;
+(BOOL)checkAddressCheckSum:(NSString *)_address;
+ (NSData *) _publicKeyFromPrivateKey:(NSData *)privateKey;
+ (NSData *) uncompressPublicKey:(NSData *)compressPublicKey;
+(NSDictionary *)encryptMessage:(NSData *)_message WithPubKey:(NSData *)_pubkey;
+(NSDictionary *)encryptMessage:(NSData *)_message WithPubKey:(NSData *)_pubkey WithIV:(nullable NSData *)_iv;
+(NSDictionary *)encryptMessage:(NSData *)_message WithPubKey:(NSData *)_pubkey WithSigner:(NSData *)_m_privkey WithIV:(nullable NSData *)_iv;
+(NSData *)decryptMessage:(NSDictionary *)_encMessage WithPrivKey:(NSData *)_privkey;
+(NSString *)sha512:(NSData *)_message;
@end

NS_ASSUME_NONNULL_END
