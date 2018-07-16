//
//  RCTStream.h
//  RCTLFLiveKit
//
//  Created by 권오빈 on 2016. 8. 10..
//  Copyright © 2016년 권오빈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>

@class RCTStreamManager;

@interface RCTStream : UIView

@property (nonatomic, copy) RCTBubblingEventBlock onReady;
@property (nonatomic, copy) RCTBubblingEventBlock onStart;
@property (nonatomic, copy) RCTBubblingEventBlock onFail;
@property (nonatomic, copy) RCTBubblingEventBlock onStop;
@property (nonatomic, copy) RCTBubblingEventBlock onPending;
@property (nonatomic, copy) RCTBubblingEventBlock onBitRateChange;

- (id) initWithManager: (RCTStreamManager*) manager bridge:(RCTBridge *) bridge;
- (void) focusPoint: (CGPoint) point;
- (void) captureImageWithCompletionHandler:(void (^)(NSString *filePath, NSString *base64, NSError * err))completionBlock;

@end
