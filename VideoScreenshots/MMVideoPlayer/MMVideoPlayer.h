//
//  MMVideoPlayer.h
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MMVideoPlayer : UIView

@property(nonatomic,strong) AVPlayer * videPlayer;
@property(nonatomic,strong) AVPlayerItem * videoPlayerItem;
@property(nonatomic,strong) AVPlayerItemVideoOutput * playerOutput;
@property(nonatomic,strong) NSString * videoUrl;
@property(nonatomic,assign) BOOL isPlayerPlaying;

-(void)playVideo;
-(void)pauseVideo;

@end
