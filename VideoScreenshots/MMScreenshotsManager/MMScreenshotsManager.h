//
//  MMScreenshotsManager.h
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MMScreenshotsManager : NSObject

-(UIImage *)screenshotsWithView:(UIView *)view;

-(UIImage *)screenshotsm3u8WithCurrentTime:(CMTime)currentTime playerItemVideoOutput:(AVPlayerItemVideoOutput *)output;

-(UIImage *)screenshotsMP4WithCurrentTime:(CMTime)currentTime videoUrl:(NSString *)url;

@end
