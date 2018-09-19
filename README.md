# ZLStatusBarHUD
一个非常简单实用的状态栏指示器小框架

## 显示成功信息
---objc
  [ZLStatusBarHUD showSuccess:@"加载成功"];
  
  ## 显示失败信息
  ---objc
[ZLStatusBarHUD showError:@"加载失败"];
  
  ## 显示加载信息
  ---objc
 [ZLStatusBarHUD showLoading:@"正在加载中"];
  
  ## 显示文字信息
  ---objc
 [ZLStatusBarHUD showMessage:@"没什么事" image:[UIImage imageNamed:@"error"]];
  
  ## 隐藏
  ---objc
[ZLStatusBarHUD hide];

