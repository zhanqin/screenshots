//
//  MMImageCaptureViewController.m
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "MMImageCaptureViewController.h"


@interface MMImageCaptureViewController ()

@property(nonatomic,strong) UIImageView * imageView;

@end

@implementation MMImageCaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    self.title = @"图片截屏";
}

-(void)dealloc{
    NSLog(@"MMImageCaptureViewController dealloc");
}

-(void)setupView{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3.0)];
    _imageView.image = [UIImage imageNamed:@"imag_screenshots.jpg"];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.clipsToBounds = YES;
    [self.view addSubview:_imageView];
    
}

-(void)screenshotsClick{
    self.screenshotsImageView.image = [[[MMScreenshotsManager alloc] init] screenshotsWithView:_imageView];
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
