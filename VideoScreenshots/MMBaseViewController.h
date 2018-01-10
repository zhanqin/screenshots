//
//  MMBaseViewController.h
//  VideoScreenshots
//
//  Created by zhanqin on 2018/1/4.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define PADDING_X (SCREEN_WIDTH - SCREEN_HEIGHT/3.0)/2.0

#import <UIKit/UIKit.h>
#import "MMScreenshotsManager.h"
#import "MMVideoPlayer.h"

@interface MMBaseViewController : UIViewController

@property(nonatomic,strong) UIImageView * screenshotsImageView;
@property(nonatomic,strong) UIButton * screenshotsButton;
@property(nonatomic,strong) MMVideoPlayer * playerView;
@property(nonatomic,strong) UIButton * operationButton;

-(void)screenshotsClick;
-(void)setupVideoButton;

@end
