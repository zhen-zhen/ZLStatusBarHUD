//
//  ViewController.m
//  ZLStatusHUDExample
//
//  Created by 甄丽 on 2018/9/19.
//  Copyright © 2018年 甄丽. All rights reserved.
//

#import "ViewController.h"
#import "ZLStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)success:(id)sender {
    
    [ZLStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error:(id)sender {
    [ZLStatusBarHUD showError:@"加载失败"];
    
}
- (IBAction)loading:(id)sender {
    [ZLStatusBarHUD showLoading:@"正在加载中"];
    
}
- (IBAction)hide:(id)sender {
    
    [ZLStatusBarHUD hide];
}
- (IBAction)showMessage:(id)sender {
    [ZLStatusBarHUD showMessage:@"没什么事" image:[UIImage imageNamed:@"error"]];
}

@end
