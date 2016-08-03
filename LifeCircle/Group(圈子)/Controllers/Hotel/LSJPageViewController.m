//
//  LSJPageViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJPageViewController.h"
#import "LSJMenuView.h"
#import "UIView+HMFrame.h"
#import "LSPersonageViewController.h"
@interface LSJPageViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) LSJMenuView * menuView;
@property (nonatomic,strong) UIScrollView * pageScrollView;
@end

@implementation LSJPageViewController

-(instancetype)init{

    if (self = [super init]) {
        
        //取消导航栏的半透明效果
        self.navigationController.navigationBar.translucent = NO;
        
        //滚动视图
        _pageScrollView = [[UIScrollView alloc] init];
        
        _pageScrollView.delegate = self;
        
        _pageScrollView.bounces = NO;
        
        _pageScrollView.pagingEnabled = YES;
        
        _pageScrollView.showsHorizontalScrollIndicator = NO;
        
        [self.view addSubview:_pageScrollView];
        
        //菜单
        _menuView = [[LSJMenuView alloc] init];
        
        [self.view addSubview:_menuView];
        
        //关联（点击菜单视图左右按钮执行动画）
        _menuView.scollView = _pageScrollView;

    }


    return self;
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpMainUI];
   }
//头部的按钮
- (void)setUpMainUI{
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.frame = CGRectMake(0, 0, 30, 30);
    returnButton.backgroundColor = [UIColor clearColor];
    [returnButton setBackgroundImage:[UIImage imageNamed:@"title_返回"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(handleClickReturnBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)handleClickReturnBtn:(UIButton *)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
#pragma mark - 布局子控件
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat w = self.view.frame.size.width;
    //设置宽度
    _menuView.width = w;
    
    _menuView.h = 33;
    
    CGFloat y = CGRectGetMaxY(_menuView.frame);
    
    CGFloat h = self.view.frame.size.height - y;
    
    _pageScrollView.frame = CGRectMake(0, y, w, h);
    _pageScrollView.contentSize = CGSizeMake(w * 3, h);
    
    //计算控制器的位置
    self.leftViewController.view.frame = CGRectMake(0, 0, w, h);
    self.middleViewController.view.frame = CGRectMake(w, 0, w, h);
    self.rightViewController.view.frame = CGRectMake(w * 2, 0, w, h);
}

#pragma mark - 重写set方法设置界面

- (void)setLeftMenuTitle:(NSString *)leftMenuTitle
{
    if (leftMenuTitle)
    {
        _leftMenuTitle = leftMenuTitle;
        if (_menuView)
        {
            _menuView.infoTitle = leftMenuTitle;
        }
    }
}
- (void)setMiddleMenuTitle:(NSString *)middleMenuTitle
{
    if (middleMenuTitle)
    {
        _middleMenuTitle = middleMenuTitle;
        if (_menuView)
        {
            _menuView.BusinessTitle = middleMenuTitle;
        }
    }
}
- (void)setRightMenuTitle:(NSString *)rightMenuTitle
{
    if (rightMenuTitle)
    {
        _rightMenuTitle = rightMenuTitle;
        if (_menuView)
        {
            _menuView.EvaluateTitle = rightMenuTitle;
        }
    }
}

- (void)setLeftViewController:(UIViewController *)leftViewController
{
    if (leftViewController)
    {
        _leftViewController = leftViewController;
        if (_pageScrollView)
        {
            //添加子控制器
            [self addChildViewController:leftViewController];
            [_pageScrollView addSubview:leftViewController.view];
        }
    }
}

- (void)setMiddleViewController:(UIViewController *)middleViewController
{
    if (middleViewController)
    {
        _middleViewController = middleViewController;
        if (_pageScrollView)
        {
            [self addChildViewController:middleViewController];
            [_pageScrollView addSubview:middleViewController.view];
        }
    }
}
- (void)setRightViewController:(UIViewController *)rightViewController
{
    if (rightViewController)
    {
        _rightViewController = rightViewController;
        if (_pageScrollView)
        {
            [self addChildViewController:rightViewController];
            [_pageScrollView addSubview:rightViewController.view];
        }
    }
}

#pragma mark - <UIScrollViewDelegate方法>
//开始滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
    
    CGFloat offsetX = scrollView.contentOffset.x;
    
    CGFloat progress = offsetX / scrollView.contentSize.width;
    
    [_menuView animateViewProgress:progress];
}

//开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _menuView.userInteractionEnabled = NO;
}

//结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    _menuView.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    NSLog(@"gdg");
}

@end
