//
//  RCTPlayer.h
//  RCTPili
//
//  Created by buhe on 16/5/12.
//  Copyright © 2016年 pili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>
#import <React/RCTBridge.h>

@class RCTPlayerManager;

@interface RCTPlayer : UIView

@property (nonatomic, assign) int reconnectCount;

@property (nonatomic, copy) RCTBubblingEventBlock onLoading;
@property (nonatomic, copy) RCTBubblingEventBlock onPlaying;
@property (nonatomic, copy) RCTBubblingEventBlock onPaused;
@property (nonatomic, copy) RCTBubblingEventBlock onShutdown;
@property (nonatomic, copy) RCTBubblingEventBlock onError2;


- (id) initWithManager: (RCTPlayerManager*) manager bridge:(RCTBridge *) bridge;


@end
