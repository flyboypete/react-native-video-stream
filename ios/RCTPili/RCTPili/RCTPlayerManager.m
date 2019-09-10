//
//  RCTPlayerManger.m
//  RCTPili
//
//  Created by buhe on 16/5/12.
//  Copyright © 2016年 pili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>
#import "RCTPlayerManager.h"
#import "RCTPlayer.h"

@implementation RCTPlayerManager {
    RCTPlayer *player;
}
RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (UIView *)view
{
    player = [[RCTPlayer alloc] initWithManager:self bridge:self.bridge];
    
    return player;
}

- (NSArray *)customDirectEventTypes
{
    return @[
             @"onLoading",
             @"onPaused",
             @"onShutdown",
             @"onError",
             @"onPlaying"
             ];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_VIEW_PROPERTY(source, NSDictionary);
RCT_EXPORT_VIEW_PROPERTY(started, BOOL);
RCT_EXPORT_VIEW_PROPERTY(muted, BOOL);

RCT_EXPORT_VIEW_PROPERTY(onLoading, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onPlaying, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onPaused, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onShutdown, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onError2, RCTBubblingEventBlock);


@end
