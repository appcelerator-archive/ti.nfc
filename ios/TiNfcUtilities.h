//
//  TiNfcUtilities.h
//  ti.nfc
//
//  Created by Hans Knöchel on 10.10.17.
//

#import <Foundation/Foundation.h>

@interface TiNfcUtilities : NSObject

// CREDITS: https://stackoverflow.com/a/44446471/5537752

+ (NSString *)typeFromNDEFData:(NSData *)NDEFData;

+ (NSString *)NDEFContentFromData:(NSData *)data;

+ (NSString *)_dataToHexString:(NSData *)data;;

@end
