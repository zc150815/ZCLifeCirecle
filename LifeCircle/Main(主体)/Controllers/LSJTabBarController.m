//
//  LSJTabBarController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJTabBarController.h"
#import "LSJButtonView.h"
#import "LSJNavigationViewController.h"

#import "LSJHomeTableViewController.h"
#import "LSJNewsTableViewController.h"
#import "LSJGroupCollectionViewController.h"
#import "LSJOursTableViewController.h"
#import "LSJServicesCollectionViewController.h"
#import "LSJLifeToolsCollectionViewController.h"
#import "LSJNearbyTableViewController.h"


@interface LSJTabBarController ()<LSJButtonViewDelegate>


@property (strong, nonatomic) LSJButtonView *buttomView;

@property (nonatomic, strong)UIViewController *vc;


@end


@implementation LSJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self setupChildControllers];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupButtomView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushController:) name:@"MoreButtonView" object:nil];
}


-(void)pushController:(NSNotification*)dic
{
    NSString *str = dic.userInfo[@"button"];
    
    if ([str isEqualToString:@"0"]) {
        
       
        LSJNavigationViewController *nav = self.selectedViewController;
        
        LSJServicesCollectionViewController *vc = [[LSJServicesCollectionViewController alloc]init];
//        vc.view.backgroundColor = [UIColor yellowColor];
        
        [nav pushViewController:vc animated:YES];

    }
    else if ([str isEqualToString:@"1"])
    {
        LSJNavigationViewController *nav = self.selectedViewController;
        
        LSJLifeToolsCollectionViewController *vc = [[LSJLifeToolsCollectionViewController alloc]init];
//        vc.view.backgroundColor = [UIColor yellowColor];
        
        [nav pushViewController:vc animated:YES];
    }
    else if ([str isEqualToString:@"2"])
    {
        LSJNavigationViewController *nav = self.selectedViewController;
        
        LSJNearbyTableViewController *vc = [[LSJNearbyTableViewController alloc]init];
//        vc.view.backgroundColor = [UIColor yellowColor];
        
        [nav pushViewController:vc animated:YES];
    }
}
//添加子控制器
- (void)setupChildControllers
{
    [self addChildViewControllersWith:[[LSJHomeTableViewController alloc]init]];
    [self addChildViewControllersWith:[[LSJNewsTableViewController alloc]init]];
    [self addChildViewControllersWith:[[LSJGroupCollectionViewController alloc]init]];
    [self addChildViewControllersWith:[[LSJOursTableViewController alloc]init]];
}

-(void)addChildViewControllersWith:(UIViewController *)controller
{
    LSJNavigationViewController *nav = [[LSJNavigationViewController alloc]initWithRootViewController:controller];
    
    

    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [nav.navigationBar setTintColor:[UIColor whiteColor]];

    [self addChildViewController:nav];
}

//添加自定义底部工具条
-(void)setupButtomView
{
    LSJButtonView *buttomView = [[LSJButtonView alloc]initWithFrame:self.tabBar.bounds];
    
    self.buttomView = buttomView;
    
    buttomView.delegate = self;
    
    buttomView.backgroundColor = [UIColor blackColor];
    
    [self.tabBar addSubview:buttomView];

    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UINavigationController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *imageName = [NSString stringWithFormat:@"TabBar0%zd",idx+1];
        
        UIImage *image = [UIImage imageNamed:imageName];
        
        [buttomView addButtonWithImage:image];
    }];
}

-(void)buttomView:(LSJButtonView *)buttomView andWithSelectedIndex:(NSInteger)index
{
 
    
    self.selectedIndex = index;

}

-(void)goback
{
    [self.navigationController popViewControllerAnimated:YES];
}






@end
