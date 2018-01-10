//
//  MMVideoPlayer.m
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "MMVideoPlayer.h"

@interface MMVideoPlayer ()

@property(nonatomic,strong) AVPlayerLayer * videoPlayerLayer;
@property(nonatomic,strong) UIActivityIndicatorView * activityIndicatorView;

@end

@implementation MMVideoPlayer

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self setupView];
    }
    return self;
}

-(void)dealloc{
    [self.videoPlayerItem removeObserver:self forKeyPath:@"status"];
    [self.videoPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    NSLog(@"MMVideoPlayer dealloc");
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.videoPlayerLayer.frame = self.bounds;
}

-(void)setupView{
    self.videPlayer = [[AVPlayer alloc] init];
    self.videoPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.videPlayer];
    [self.layer addSublayer:self.videoPlayerLayer];
}

-(void)setVideoUrl:(NSString *)videoUrl{
    _videoUrl = videoUrl;
    self.videoPlayerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:videoUrl]];
    self.playerOutput = [[AVPlayerItemVideoOutput alloc] init];
    [self.videoPlayerItem addOutput:self.playerOutput];
    [self setupObserver];
    [self addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
}

-(void)setupObserver{
    [self.videoPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.videoPlayerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    AVPlayerItem *playerItem=object;
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status= [[change objectForKey:@"new"] intValue];
        if(status==AVPlayerStatusReadyToPlay){
            [self.activityIndicatorView stopAnimating];
            NSLog(@"正在播放...，视频总长度:%.2f",CMTimeGetSeconds(playerItem.duration));
        }else if (status == AVPlayerStatusFailed){
            NSLog(@"播放失败");
        }else if (status == AVPlayerStatusUnknown){
            NSLog(@"未知错误");
        }
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSArray *array=playerItem.loadedTimeRanges;
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];//本次缓冲时间范围
        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds + durationSeconds;//缓冲总长度
        NSLog(@"共缓冲：%.2f",totalBuffer);
    }
}

#pragma mark - click
-(void)playVideo{
    self.isPlayerPlaying = YES;
    [self.videPlayer replaceCurrentItemWithPlayerItem:self.videoPlayerItem];
    [self.videPlayer play];
}

-(void)pauseVideo{
    self.isPlayerPlaying = NO;
    [self.videPlayer pause];
}

#pragma mark - lazy
-(UIActivityIndicatorView *)activityIndicatorView{
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicatorView.frame = CGRectMake(0, 0, 50, 50);
        _activityIndicatorView.center = self.center;
    }
    return _activityIndicatorView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
