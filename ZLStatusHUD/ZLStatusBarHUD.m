//
//  ZLStatusBarHUD.m
//  01-状态栏指示器
//
//  Created by 甄丽 on 2018/9/19.
//  Copyright © 2018年 甄丽. All rights reserved.
//

#import "ZLStatusBarHUD.h"

#define ZLMessageFont [UIFont systemFontOfSize:12]
/**消息停留时间 */
static CGFloat const ZLMessageDuration = 2.0;

/**显示\隐藏的动画时间 */
static CGFloat const ZLAnimationDuration = 0.25;
@implementation ZLStatusBarHUD
/**全局窗口 */
static UIWindow *window_;
/**定时器 */
static NSTimer *timer_;


/**
 *初始化窗口
 */
+(void)setupWindow
{
    //frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, windowH);
    //显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.hidden = NO;
    window_.backgroundColor =[UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:ZLAnimationDuration animations:^{
        window_.frame = frame;
    }];
  
}
/**
 *显示成功信息
 */
+(void)showSuccess:(NSString *)msg
{
    
    [self showMessage:msg image:[UIImage imageNamed:@"ZLStatusHUD.bundle/check"]];
}

/**
 *显示普通信息
 *@param msg 文字
 *@param image 图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];

    
    [self setupWindow];
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = ZLMessageFont;
    if (image) {//如果有图片
        [button setImage:image forState:UIControlStateNormal];
         button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
   
    button.frame = window_.bounds;
    [window_ addSubview:button];
    //定时消失
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self hide];
//    });
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZLMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *显示普通信息
 */
+(void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}
/**
 *显示失败信息
 */
+(void)showError:(NSString *)msg
{
  [self showMessage:msg image:[UIImage imageNamed:@"ZLStatusHUD.bundle/error"]];
}
/**
 *显示正在处理信息
 */
+(void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    [self setupWindow];
    //添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = ZLMessageFont;
    label.textColor = [UIColor whiteColor];
    label.frame = window_.bounds;
    label.text = msg;
    label.textAlignment = NSTextAlignmentCenter;
    
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:ZLMessageFont}].width;
    CGFloat centerX = window_.frame.size.width/2 - msgW * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}
/**
 *隐藏
 */
+(void)hide
{
    [UIView animateWithDuration:ZLAnimationDuration animations:^{
      CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
         window_ = nil;
        timer_ = nil;
    }];
   
}

@end
