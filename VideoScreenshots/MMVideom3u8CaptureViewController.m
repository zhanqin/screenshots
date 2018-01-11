//
//  MMVideom3u8CaptureViewController.m
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "MMVideom3u8CaptureViewController.h"
#import "MMPushViewController.h"

@interface MMVideom3u8CaptureViewController ()

@end

@implementation MMVideom3u8CaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"m3u8截屏";
    [self.view addSubview:self.playerView];
    self.playerView.videoUrl = @"http://www.streambox.fr/playlists/test_001/stream.m3u8";
    [self.playerView playVideo];
    [self setupVideoButton];
}

-(void)dealloc{
    NSLog(@"MMVideom3u8CaptureViewController dealloc");
}

-(void)screenshotsClick{
    self.screenshotsImageView.image = [[[MMScreenshotsManager alloc] init] screenshotsm3u8WithCurrentTime:self.playerView.videPlayer.currentTime playerItemVideoOutput:self.playerView.playerOutput];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    MMPushViewController * vc = [[MMPushViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
