//
//  LSJNavigationViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNavigationViewController.h"
#import "LSPersonageViewController.h"
#import "LSJLoginViewController.h"

@interface LSJNavigationViewController ()

@property (nonatomic,weak) UIBarButtonItem *rightBtn;
@property (nonatomic,weak) UIBarButtonItem *leftBtn;

@end

@implementation LSJNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self clickRightBtn];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0){
        
        viewController.hidesBottomBarWhenPushed = YES;
        
//        UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        returnButton.frame = CGRectMake(0, 0, 30, 30);
//        returnButton.backgroundColor = [UIColor clearColor];
//        [returnButton setBackgroundImage:[UIImage imageNamed:@"title_返回"] forState:UIControlStateNormal];
//        
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:returnButton];

        
    }
    [super pushViewController:viewController animated:animated];
}

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {

//        NSString *iconName;
//        NSUserDefaults *sendInSuccess = [NSUserDefaults standardUserDefaults];
//        BOOL success = [sendInSuccess boolForKey:@"sendInSuccess"];
//        
//        if (success) {
//            
//            iconName = @"iconname";
//        }
//        else{
//            iconName = @"title_个人资料";
//        }
        
        UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_个人资料"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBtn)];
        self.rightBtn = rightBtn;
        
        UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_返回"] style:UIBarButtonItemStylePlain target:self action:nil];
        self.leftBtn = leftBtn;
        
        rootViewController.navigationItem.rightBarButtonItem = rightBtn;
        rootViewController.navigationItem.leftBarButtonItem = leftBtn;
        
        
    }
    return self;
}
-(void)clickRightBtn
{
    NSUserDefaults *sendInSuccess = [NSUserDefaults standardUserDefaults];
    BOOL success = [sendInSuccess boolForKey:@"sendInSuccess"];
    
    if (success) {
        LSPersonageViewController *personPageVC = [[LSPersonageViewController alloc]init];
        [self pushViewController:personPageVC animated:YES];
    }
    else
    {
        LSJLoginViewController *loginVC = [[LSJLoginViewController alloc]init];
        [self pushViewController:loginVC animated:YES];
    }
        
}
@end
