//
//  RCTStreamManager.m
//  RCTLFLiveKit
//
//  Created by 권오빈 on 2016. 8. 9..
//  Copyright © 2016년 권오빈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>
#import "RCTStreamManager.h"
//#import "LFLivePreview.h"
#import "RCTStream.h"

@implementation RCTStreamManager{
    RCTStream *stream;
}

RCT_EXPORT_MODULE();

- (UIView *) view
{
    NSLog(@"\n\n\n\n\nSTARTING RCTStream Module\n\n\n\n\n");
    
    stream = [[RCTStream alloc] initWithManager:self bridge:self.bridge];

    return stream;
}

RCT_EXPORT_METHOD(focusOnPoint:(float)x y:(float)y){
    CGPoint point = CGPointMake(x, y);
    [stream focusPoint:point];
}

- (NSArray *) customDirectEventTypes
{
    return @[
             @"onReady",
             @"onPending",
             @"onStart",
             @"onError",
             @"onStop"
            ];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_VIEW_PROPERTY(started, BOOL);
RCT_EXPORT_VIEW_PROPERTY(cameraFronted, BOOL);
RCT_EXPORT_VIEW_PROPERTY(url, NSString);
RCT_EXPORT_VIEW_PROPERTY(landscape, BOOL);
RCT_EXPORT_VIEW_PROPERTY(zoom, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(brightness, CGFloat);



@end
