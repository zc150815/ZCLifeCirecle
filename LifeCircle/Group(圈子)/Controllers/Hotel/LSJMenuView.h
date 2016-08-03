//
//  LSJMenuView.h
//  LifeCircle
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSJMenuView : UIView

//菜单view宽度
@property (assign, nonatomic) CGFloat width;
//菜单标题
@property (copy, nonatomic) NSString * infoTitle;
@property (copy, nonatomic) NSString * BusinessTitle;
@property (copy, nonatomic) NSString * EvaluateTitle;

//定义scrollView属性（点击菜单按钮时会滚动到相应位置）
@property (weak, nonatomic) UIScrollView *scollView;

//定义方法(progress = scrollView.contentOffset.x / scrollView.contentSize.width)
- (void)animateViewProgress:(CGFloat)progress;
@end
