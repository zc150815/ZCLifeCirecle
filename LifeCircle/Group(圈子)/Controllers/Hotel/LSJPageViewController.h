//
//  LSJPageViewController.h
//  LifeCircle
//
//  Created by ios on 16/7/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSJPageViewController : UIViewController

//菜单主题
@property (strong, nonatomic) NSString *leftMenuTitle;

@property (nonatomic,copy) NSString * middleMenuTitle;

@property (strong, nonatomic) NSString *rightMenuTitle;

//子控制器(左)
@property (strong, nonatomic) UIViewController *leftViewController;
//子控制器(右)
@property (strong, nonatomic) UIViewController *rightViewController;

//中间控制器
@property (strong, nonatomic) UIViewController *middleViewController;

@end
