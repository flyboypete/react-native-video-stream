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

RCT_EXPORT_METHOD(captureImage:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    [stream captureImageWithCompletionHandler:^(NSString *filePath, NSString *base64, NSError *err) {
        resolve(@{
                  @"path": filePath,
                  @"data": base64
                  });
    }];
}

- (NSArray *) customDirectEventTypes
{
    return @[
             @"onReady",
             @"onPending",
             @"onStart",
             @"onFail",
             @"onStop",
             @"onBitRateChange"
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
RCT_EXPORT_VIEW_PROPERTY(onStart, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onStop, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onFail, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onPending, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onReady, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBitRateChange, RCTBubblingEventBlock)

@end
