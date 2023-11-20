//
//  NSData+SECP256K1.m
//  CVETHWallet
//
//  Created by coin on 29/08/2019.
//  Copyright © 2019 coin. All rights reserved.
//
#import "secp256k1_ios/secp256k1.h"
#import "secp256k1_ios/secp256k1_recovery.h"
#import "NSData+SECP256K1.h"

@implementation NSData (SECP256K1)

- (NSData *) signWithPrivateKeyData:(NSData *)privateKeyData {
    secp256k1_context *context = secp256k1_context_create(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY);
    
    const unsigned char *prvKey = (const unsigned char *)privateKeyData.bytes;
    const unsigned char *msg = (const unsigned char *)self.bytes;
    
    unsigned char *siga = malloc(65);
    secp256k1_ecdsa_recoverable_signature sig;
    int result = secp256k1_ecdsa_sign_recoverable(context, &sig, msg, prvKey, NULL, NULL);
    if (result != 1) {
        free(siga);
        return nil;
    }
    
    int recId = 0;
    result = secp256k1_ecdsa_recoverable_signature_serialize_compact(context, siga, &recId, &sig);
    
    if (result != 1) {
        free(siga);
        return nil;
    }
    
    secp256k1_context_destroy(context);
    siga[64] = recId + 27;
    
    NSMutableData *data = [[NSMutableData alloc] init];
    
//    [data appendBytes:&siga[64] length:sizeof(unsigned char)];
    [data appendBytes:siga length:sizeof(unsigned char) * 65];
    
    free(siga);
//    unsigned char v = 0;
//    if (recId == 0) {
//        [data appendBytes:&v length:sizeof(unsigned char)];
//    } else if (recId == 1) {
//        v = 1;
//        [data appendBytes:&v length:sizeof(unsigned char)];
//    } else {
//        return nil;
//    }
    
    return data;
}

- (NSData *)signDataEncodeToDER:(NSData *)privateKeyData
{
    secp256k1_context *context = secp256k1_context_create(SECP256K1_CONTEXT_SIGN);
    
    const unsigned char *prvKey = (const unsigned char *)privateKeyData.bytes;
    const unsigned char *msg = (const unsigned char *)self.bytes;
    
    unsigned char *siga = malloc(64);
    secp256k1_ecdsa_signature sig;
    int result = secp256k1_ecdsa_sign(context, &sig, msg, prvKey, NULL, NULL);
    
    result = secp256k1_ecdsa_signature_serialize_compact(context, siga, &sig);
    
    if (result != 1) {
        return nil;
    }
    
    size_t i = 72;
    unsigned char *output = malloc(i);
    secp256k1_ecdsa_signature_serialize_der(context, output, &i, &sig);
    
    secp256k1_context_destroy(context);
    
    NSMutableData *data = [NSMutableData dataWithBytes:output length:i];
    free(output);
    free(siga);
    return data;
}

- (NSData *) getPubKeyDataFromMessageWithSig:(NSData *)_sig;
{
    secp256k1_context *context = secp256k1_context_create(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY);
    
    NSMutableData *inputSig = [[NSMutableData alloc] init];
    [inputSig appendBytes:&_sig.bytes[0] length:sizeof(unsigned char) * 64];
    NSData *tmpv = [NSData dataWithBytes:&_sig.bytes[64] length:1];
    int recid = *(int*)([tmpv bytes]);
    
    
    const unsigned char *msg = (const unsigned char *)self.bytes;
    secp256k1_pubkey pubKey;
    secp256k1_ecdsa_recoverable_signature sig;
    secp256k1_ecdsa_recoverable_signature_parse_compact(context, &sig, (const unsigned char *)inputSig.bytes, recid);
    
    int result = secp256k1_ecdsa_recover(context, &pubKey, &sig, msg);
    if (result != 1) {
        return nil;
    }
    unsigned char *pubKeyData = malloc(65);
    size_t pubkeylen = 65;
    int resultpk = secp256k1_ec_pubkey_serialize(context, pubKeyData, &pubkeylen, &pubKey, SECP256K1_EC_UNCOMPRESSED);
    if (resultpk != 1) {
        return nil;
    }
    secp256k1_context_destroy(context);
    NSMutableData *resultPubKey = [[NSMutableData alloc] init];
    [resultPubKey appendBytes:pubKeyData length:sizeof(unsigned char) * 65];
    
    return resultPubKey;
}

//- (NSData *) deriveSharedSecret:(NSData *)privateKeyData OtherPubkey: (NSData *)otherPubKeyData;
//{
//    secp256k1_context *context = secp256k1_context_create(SECP256K1_CONTEXT_VERIFY | SECP256K1_CONTEXT_SIGN);
//    
//    const unsigned char *privBytes = (const unsigned char *)privateKeyData.bytes;
//    const unsigned char *pubKey = (const unsigned char *)otherPubKeyData.bytes;
//    secp256k1_pubkey pKey;
//    int pubResult = secp256k1_ec_pubkey_parse(context, &pKey, pubKey, otherPubKeyData.length);
//    if (pubResult != 1) return nil;
//    unsigned char *result = malloc(32);
//    int resultpk = secp256k1_ecdh(context, result, &pKey, privBytes);
//    if (resultpk != 1) return nil;
//    secp256k1_context_destroy(context);
//    NSMutableData *resultData = [[NSMutableData alloc] init];
//    [resultData appendBytes:result length:sizeof(unsigned char) * 32];
//    free(result);
//    return resultData;
//}

//- (int)verifySigningWithPublicKeyData:(NSData *)publicKeyData
//{
//    secp256k1_context *context = secp256k1_context_create(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY);
//    unsigned char *pubKey = malloc(64);
//    const unsigned char *pubKey = (const unsigned char *)publicKeyData.bytes;
//    const unsigned char *siga = (const unsigned char *)self.bytes;
//
//    int secp256k1_ecdsa_verify(const secp256k1_context* ctx, const secp256k1_ecdsa_signature *sig, const unsigned char *msg32, const secp256k1_pubkey *pubkey)
//}


//- (NSData *)unmarshalSignatureV
//{
//    if (self.length != 65) {
//        return nil;
//    }
//    return self.bytes[64];
//}
@end
