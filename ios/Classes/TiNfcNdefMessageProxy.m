/**
 * Ti.NFC
 * Copyright (c) 2009-2018 by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiNfcNdefMessageProxy.h"
#import "TiNfcNdefRecordProxy.h"

@implementation TiNfcNdefMessageProxy

#pragma mark Internal

- (id)_initWithPageContext:(id<TiEvaluator>)context andRecords:(NSArray<NFCNDEFPayload *> *)records
{
  if (self = [super _initWithPageContext:context]) {
    _records = [NSArray arrayWithArray:records];
  }

  return self;
}

#pragma mark Public API's

- (NSArray<TiNfcNdefRecordProxy *> *)records
{
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:_records.count];

  for (NFCNDEFPayload *record in _records) {
    [result addObject:[[TiNfcNdefRecordProxy alloc] _initWithPageContext:[self pageContext] andRecord:record]];
  }

  return result;
}

@end
