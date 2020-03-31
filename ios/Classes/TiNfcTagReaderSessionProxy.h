/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiProxy.h"
#import <CoreNFC/CoreNFC.h>

@interface TiNfcTagReaderSessionProxy : TiProxy<NFCTagReaderSessionDelegate> {
@private
  NFCTagReaderSession *_session;
}

- (void)begin:(id)unused;

- (void)invalidate:(id)unused;

- (void)restartPolling:(id)unused;

- (NSNumber *)isEnabled:(id)unused;

@end
