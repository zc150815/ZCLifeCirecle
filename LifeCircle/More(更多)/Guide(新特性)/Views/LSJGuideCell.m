//
//  LSJGuideCell.m
//  LifeCircle
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//
#import "LSJGuideCell.h"
#import "LSJTabBarController.h"
@implementation LSJGuideCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //创建按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_centerX);
            make.bottom.mas_equalTo(self.contentView).offset(-50);
            make.width.mas_equalTo(100);
        }];
        self.button = button;
        button.layer.cornerRadius = 10;
        button.layer.masksToBounds = YES;
        [button setTitle:@"马上体验吧" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorWithRed:34.0/255 green:150.0/255 blue:222.0/255 alpha:1.0];
        //添加监听事件
        [button addTarget:self action:@selector(buttonStartClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)buttonStartClick{
    // 切换应用程序主窗口的根控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = [[LSJTabBarController alloc]init];
}

@end
