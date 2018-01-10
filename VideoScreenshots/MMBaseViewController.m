//
//  MMBaseViewController.m
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "MMBaseViewController.h"

@interface MMBaseViewController ()
@property(nonatomic,assign) CGFloat navigationBarHeight;

@end

@implementation MMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _navigationBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavigationItem];
    [self setupScreenshotsButton];
    [self.view addSubview:self.screenshotsImageView];
}

#pragma mark - UI
-(void)setupNavigationItem{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.9];
    
    UIButton *backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 50, 30);
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"icon_nav_back_black"] forState:UIControlStateNormal];
    [backBtn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [backBtn sizeThatFits:CGSizeMake(60, 30)];
    [backBtn addTarget:self action:@selector(navLeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

-(void)setupScreenshotsButton{
    [self.view addSubview:self.screenshotsButton];
}

-(void)setupVideoButton{
    self.screenshotsButton.frame = CGRectMake(PADDING_X - 40, self.screenshotsButton.frame.origin.y, self.screenshotsButton.frame.size.width, 50);
    [self.view addSubview:self.operationButton];
}

#pragma mark - click
- (void)navLeftButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)screenshotsClick{
    
}

-(void)operationClick{
    if (self.playerView.isPlayerPlaying) {
        //暂停
        [self.playerView pauseVideo];
        [self.operationButton setImage:[UIImage imageNamed:@"button_player_play"] forState:UIControlStateNormal];
    }else{
        //播放
        [self.playerView playVideo];
        [self.operationButton setImage:[UIImage imageNamed:@"button_player_pause"] forState:UIControlStateNormal];
    }
}

#pragma mark - lazy
-(UIImageView *)screenshotsImageView{
    if (!_screenshotsImageView) {
        _screenshotsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - SCREEN_HEIGHT/3.0 - _navigationBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT/3.0)];
        _screenshotsImageView.contentMode = UIViewContentModeScaleAspectFit;
        _screenshotsImageView.clipsToBounds = YES;
    }
    return _screenshotsImageView;
}

-(UIButton *)screenshotsButton{
    if (!_screenshotsButton) {
        _screenshotsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _screenshotsButton.frame = CGRectMake(PADDING_X, SCREEN_HEIGHT/3.0 + (SCREEN_HEIGHT/3.0 - 50 - _navigationBarHeight)/2.0, SCREEN_HEIGHT/3.0, 50);
        _screenshotsButton.backgroundColor = [UIColor orangeColor];
        _screenshotsButton.layer.cornerRadius = 6;
        _screenshotsButton.layer.masksToBounds = YES;
        [_screenshotsButton setTitle:@"点我截屏" forState:UIControlStateNormal];
        [_screenshotsButton addTarget:self action:@selector(screenshotsClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _screenshotsButton;
}

-(MMVideoPlayer *)playerView{
    if (!_playerView) {
        _playerView = [[MMVideoPlayer alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3.0)];
    }
    return _playerView;
}

-(UIButton *)operationButton{
    if (!_operationButton) {
        _operationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _operationButton.frame = CGRectMake(_screenshotsButton.frame.origin.x + _screenshotsButton.frame.size.width + 30, _screenshotsButton.frame.origin.y, 50, 50);
        [_operationButton addTarget:self action:@selector(operationClick) forControlEvents:UIControlEventTouchUpInside];
        [_operationButton setImage:[UIImage imageNamed:@"button_player_pause"] forState:UIControlStateNormal];
    }
    return _operationButton;
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
