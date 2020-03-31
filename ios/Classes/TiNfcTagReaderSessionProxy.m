/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiNfcTagReaderSessionProxy.h"
#import "TiBlob.h"
#import "TiUtils.h"
#import "TiNfcUtilities.h"

@implementation TiNfcTagReaderSessionProxy

- (NFCTagReaderSession *)session
{
  if (_session == nil) {
    _session = [[NFCTagReaderSession alloc] initWithPollingOption:NFCPollingISO14443 delegate:self queue:nil];
  }
  
  return _session;
}

#pragma mark Public API's

- (void)begin:(id)unused
{
  [[self session] beginSession];
}

- (void)invalidate:(id)unused
{
  [[self session] invalidateSession];
  _session = nil;
}

- (void)restartPolling:(id)unused
{
  [[self session] restartPolling];
}

- (NSNumber *)isEnabled:(id)unused
{
  if (![TiUtils isIOSVersionOrGreater:@"13.0"]) {
    return @(NO);
  }

  return @([NFCTagReaderSession readingAvailable]);
}

#pragma mark NFCReaderSessionDelegate

- (void)tagReaderSession:(NFCTagReaderSession *)session didInvalidateWithError:(NSError *)error
{
  [self fireEvent:@"error" withObject:@{ @"error": error.localizedDescription, @"cancelled": @(error.code == 200) }];
}

- (void)tagReaderSessionDidBecomeActive:(NFCTagReaderSession *)session
{
  [self fireEvent:@"active"];
}

- (void)tagReaderSession:(NFCTagReaderSession *)session didDetectTags:(NSArray<__kindof id<NFCTag>> *)tags
{
  if (tags.count == 0) {
    [self fireEvent:@"error" withObject:@{ @"error": @"No tags found" }];
    return; // No tags found
  }

  id<NFCMiFareTag> tag = tags[0].asNFCMiFareTag;

  if (tag == nil) {
    [self fireEvent:@"error" withObject:@{ @"error": @"The found tag is not a MiFareTag tag" }];
    return;
  }
  
  NSString *stringIdentifier = [TiNfcUtilities _dataToHexString:[tag identifier]];
  TiBlob *identifier = [[TiBlob alloc] initWithData:tag.identifier mimetype:@"text/plain"];

  [self fireEvent:@"detect" withObject:@{
    @"stringIdentifier": NULL_IF_NIL(stringIdentifier),
    @"identifier": identifier
  }];
}

@end
