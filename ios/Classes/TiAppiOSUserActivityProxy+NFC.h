/**
 * Ti.NFC
 * Copyright (c) 2009-2018 by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import <Foundation/Foundation.h>
#import "TiAppiOSUserActivityProxy.h"

@class TiNfcNdefMessageProxy;

@interface TiAppiOSUserActivityProxy (NFC)

/**
 * The NFC NDEF message with an Universial Link object that triggers the application launch.
 * @returns TiNfcNdefMessageProxy The wrapped NDEF NFC message records.
 */
- (TiNfcNdefMessageProxy *)defMessagePayload;

@end
