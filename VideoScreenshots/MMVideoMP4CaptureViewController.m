//
//  MMVideoMP4CaptureViewController.m
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "MMVideoMP4CaptureViewController.h"

@interface MMVideoMP4CaptureViewController ()

@end

@implementation MMVideoMP4CaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MP4截屏";
    [self.view addSubview:self.playerView];
    self.playerView.videoUrl = @"http://120.25.226.186:32812/resources/videos/minion_02.mp4";
    [self.playerView playVideo];
    [self setupVideoButton];
}

-(void)dealloc{
    NSLog(@"MMVideoMP4CaptureViewController dealloc");
}

-(void)screenshotsClick{
    self.screenshotsImageView.image = [[[MMScreenshotsManager alloc] init] screenshotsMP4WithCurrentTime:self.playerView.videPlayer.currentTime videoUrl:self.playerView.videoUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
