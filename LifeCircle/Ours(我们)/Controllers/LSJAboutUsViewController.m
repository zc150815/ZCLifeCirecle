//
//  LSJAboutUsViewController.m
//  LifeCircle
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJAboutUsViewController.h"
#import "LSPersonageViewController.h"
#import <Masonry.h>
#define PublicColor [UIColor colorWithRed:40.0/255.0 green:40.0/255.0 blue:40.0/255.0 alpha:1.0]
@interface LSJAboutUsViewController ()

@end

@implementation LSJAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self setUpUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpUI{
    
    

    //创建一个 imageview 并添加到 view 中
    UIImageView *imgView = [[UIImageView alloc]init];
    
    [self.view addSubview:imgView];
    //用 Masonry 方法进行布局
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(30);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    //设置图片
    imgView.image = [UIImage imageNamed:@"1024"];
    
    //创建一个 label 并添加到 view 中
    UILabel *nameLabel = [[UILabel alloc]init];
    [self.view addSubview:nameLabel];
    //用 Masonry 方法进行布局
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imgView.mas_bottom).offset(27);
        make.centerX.mas_equalTo(self.view);
    }];
    //设置 label 的字体 文字 字颜色等
    nameLabel.font = [UIFont systemFontOfSize:21];
    nameLabel.text = @"青岛信报";
    nameLabel.textColor = PublicColor;
    
    //创建一个 label 并添加到 view 中
    UILabel *titleLabel1 = [[UILabel alloc]init];
    [self.view addSubview:titleLabel1];
    //用 Masonry 方法进行布局
    [titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLabel.mas_bottom).offset(18);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-9);
    }];
    //设置 label 的字体 文字 字颜色等
    titleLabel1.font = [UIFont systemFontOfSize:16];
    titleLabel1.text = @"青岛信报";
    titleLabel1.textColor = PublicColor;
    
    
    //创建一个 label 并添加到 view 中
    UILabel *titleLabel2 = [[UILabel alloc]init];
    [self.view addSubview:titleLabel2];
    //用 Masonry 方法进行布局
    [titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLabel.mas_bottom).offset(18);
        make.left.mas_equalTo(self.view.mas_centerX).offset(9);
    }];
    //设置 label 的字体 文字 字颜色等
    titleLabel2.font = [UIFont systemFontOfSize:16];
    titleLabel2.text = @"掌上生活";
    titleLabel2.textColor = PublicColor;
    
    
    UILabel *webNameLabel1 = [[UILabel alloc]init];
    [self.view addSubview:webNameLabel1];
    //用 Masonry 方法进行布局
    [webNameLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel1.mas_bottom).offset(75);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-15);
    }];
    //设置 label 的字体 文字 字颜色等
    webNameLabel1.font = [UIFont systemFontOfSize:14];
    webNameLabel1.text = @"新浪微博:@青岛信报";
    webNameLabel1.textColor = PublicColor;
    
    UILabel *webNameLabel2 = [[UILabel alloc]init];
    [self.view addSubview:webNameLabel2];
    //用 Masonry 方法进行布局
    [webNameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel2.mas_bottom).offset(75);
        make.left.mas_equalTo(self.view.mas_centerX).offset(15);
    }];
    //设置 label 的字体 文字 字颜色等
    webNameLabel2.font = [UIFont systemFontOfSize:14];
    webNameLabel2.text = @"腾讯微博:******";
    webNameLabel2.textColor = PublicColor;
    
    //创建一个 label 并添加到 view 中
    UILabel *webNameLabel3 = [[UILabel alloc]init];
    [self.view addSubview:webNameLabel3];
    //用 Masonry 方法进行布局
    [webNameLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(webNameLabel1.mas_bottom).offset(37);
        make.left.mas_equalTo(webNameLabel1.mas_left);
    }];
    //设置 label 的字体 文字 字颜色等
    webNameLabel3.font = [UIFont systemFontOfSize:14];
    webNameLabel3.text = @"QQ交流群:******";
    webNameLabel3.textColor = PublicColor;
    
    //创建一个 label 并添加到 view 中
    UILabel *webNameLabel4 = [[UILabel alloc]init];
    [self.view addSubview:webNameLabel4];
    //用 Masonry 方法进行布局
    [webNameLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(webNameLabel2.mas_bottom).offset(37);
        make.left.mas_equalTo(webNameLabel2.mas_left);
    }];
    //设置 label 的字体 文字 字颜色等
    webNameLabel4.font = [UIFont systemFontOfSize:14];
    webNameLabel4.textColor = PublicColor;
    webNameLabel4.text = @"合作QQ号:******";
    
    //创建一个底部 label 并添加到 view 中
    UILabel *BottomLabel = [[UILabel alloc]init];
    [self.view addSubview:BottomLabel];
    //用 Masonry 方法进行布局
    [BottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-100);
    }];
    //设置 label 的字体 文字 字颜色等
    BottomLabel.font = [UIFont systemFontOfSize:12];
    BottomLabel.textColor = [UIColor colorWithRed:52.0/255.0 green:52.0/255.0 blue:52.0/255.0 alpha:1.0];
    BottomLabel.text = @"2016老司机出品";
   
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 25, 25);
    
    rightButton.backgroundColor = [UIColor clearColor];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"title_个人资料"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(handleClickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    

}

#pragma mark
#pragma mark - 设置左右按钮的点击事件
- (void)handleClickRightBtn:(UIButton *)sender
{
    
   // NSLog(@"点击了我一下");
    LSPersonageViewController *pvc = [[LSPersonageViewController alloc]init];
    [self.navigationController pushViewController:pvc animated:YES];
    
}


@end
