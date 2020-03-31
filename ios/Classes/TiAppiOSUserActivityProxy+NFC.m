/**
 * Ti.NFC
 * Copyright (c) 2009-2018 by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiAppiOSUserActivityProxy+NFC.h"
#import "TiBase.h"
#import "TiNfcNdefMessageProxy.h"
#import "TiUtils.h"

@implementation TiAppiOSUserActivityProxy (NFC)

- (TiNfcNdefMessageProxy *)defMessagePayload
{
  if (![TiUtils isIOSVersionOrGreater:@"11.0"]) return nil;

#if IS_IOS_12
  return [[TiNfcNdefMessageProxy alloc] _initWithPageContext:self.pageContext andRecords:self.userActivity.ndefMessagePayload.records];
#else
  NSLog(@"[ERROR] Attempting to use iOS 12+ API in older iOS versions!");
  return nil;
#endif
}

@end
