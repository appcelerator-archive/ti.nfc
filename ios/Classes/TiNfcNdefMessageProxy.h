/**
 * Ti.NFC
 * Copyright (c) 2009-2018 by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiNfcNdefRecordProxy.h"
#import "TiProxy.h"
#import <CoreNFC/CoreNFC.h>

@interface TiNfcNdefMessageProxy : TiProxy {
  NSArray<NFCNDEFPayload *> *_records;
}

#pragma mark Public API's

- (id)_initWithPageContext:(id<TiEvaluator>)context andRecords:(NSArray<NFCNDEFPayload *> *)records;

- (NSArray<TiNfcNdefRecordProxy *> *)records;

@end
