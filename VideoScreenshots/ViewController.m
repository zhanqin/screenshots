//
//  ViewController.m
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "ViewController.h"
#import "MMImageCaptureViewController.h"
#import "MMVideoMP4CaptureViewController.h"
#import "MMVideom3u8CaptureViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"截屏";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

-(void)setupView{
    NSArray * titleArray = @[@"图片截屏",@"MP4视频截屏",@"m3u8视频截屏"];
    CGFloat navigationBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height;
    float allButtonsHeight = 50*titleArray.count + 30*(titleArray.count - 1);
    for (int i = 0; i < titleArray.count; i ++) {
        UIButton * buttons = [UIButton buttonWithType:UIButtonTypeCustom];
        buttons.frame = CGRectMake(30, self.view.frame.size.height/2.0 - allButtonsHeight/2.0 - navigationBarHeight + i*80, self.view.frame.size.width - 60, 50);
        buttons.tag = 300 + i;
        [buttons setTitle:titleArray[i] forState:UIControlStateNormal];
        buttons.layer.cornerRadius = 6;
        buttons.layer.masksToBounds = YES;
        buttons.backgroundColor = [UIColor orangeColor];
        [buttons addTarget:self action:@selector(screenshotsClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:buttons];
    }
}

-(void)screenshotsClick:(UIButton *)button{
    int tag = (int)button.tag;
    if (tag == 300) {
        //图片截屏
        MMImageCaptureViewController * vc = [[MMImageCaptureViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (tag == 301){
        //MP4视频截图
        MMVideoMP4CaptureViewController * vc = [[MMVideoMP4CaptureViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (tag == 302){
        //m3u8视频截图
        MMVideom3u8CaptureViewController * vc = [[MMVideom3u8CaptureViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
