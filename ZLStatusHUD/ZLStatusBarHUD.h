//
//  ZLStatusBarHUD.h
//  01-状态栏指示器
//
//  Created by 甄丽 on 2018/9/19.
//  Copyright © 2018年 甄丽. All rights reserved.
//大版本号.功能更新版本号.BUG修复版本号  1.2.6
//0.0.0

#import <UIKit/UIKit.h>

@interface ZLStatusBarHUD : NSObject
/**
 *显示成功信息
 */
+(void)showSuccess:(NSString *)msg;
/**
 *显示失败信息
 */
+(void)showError:(NSString *)msg;
/**
 *显示正在处理信息
 */
+(void)showLoading:(NSString *)msg;
/**
 *隐藏
 */
+(void)hide;

/**
 *显示普通信息
 *@param msg 文字
 *@param image 图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 *显示普通信息
 */
+(void)showMessage:(NSString *)msg;
@end
