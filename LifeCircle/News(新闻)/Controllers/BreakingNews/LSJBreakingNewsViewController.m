//
//  LSJBreakingNewsViewController.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJBreakingNewsViewController.h"

@interface LSJBreakingNewsViewController ()

//@property (nonatomic, weak)UITextField *titleField;
@end

@implementation LSJBreakingNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = greyBackColor;
    [self setupUI];
    
}

//-(void)clickbtn
//{
//    self.titleField.text = @"哈哈";
//}

-(void)setupUI
{
    UILabel *titleLab = [[UILabel alloc]init];
    UITextField *titleField = [[UITextField alloc]init];
    UIButton *chooseTitleBtn = [[UIButton alloc]init];
    UIImageView *titleImg = [[UIImageView alloc]init];
    UILabel *label = [[UILabel alloc]init];
    UITextField *textField = [[UITextField alloc]init];
    UIView *textView = [[UIView alloc]init];
    UIButton *chooseFaceBtn = [[UIButton alloc]init];
    UIButton *chooseTPicBtn = [[UIButton alloc]init];
    UIImageView *textImg = [[UIImageView alloc]init];
    UIButton *submitBtn = [[UIButton alloc]init];

    
//    titleField.placeholder = @"我是占位符";
//    self.titleField = titleField;
//    [submitBtn addTarget:self action:@selector(clickbtn) forControlEvents:UIControlEventTouchDown];
//    
    
    titleLab.text = @"快来爆料你身边的事情吧!";
    titleField.backgroundColor = [UIColor whiteColor];
    titleField.borderStyle = UITextBorderStyleRoundedRect;
    
    [chooseTitleBtn setTitle:@"选择标题图片" forState:UIControlStateNormal];
    chooseTitleBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    chooseTitleBtn.titleLabel.textColor = [UIColor whiteColor];
    chooseTitleBtn.backgroundColor = blueBackColor;
    chooseTitleBtn.layer.cornerRadius = 5;
    
    titleImg.image = [UIImage imageNamed:@"加载图片"];
    textImg.image = [UIImage imageNamed:@"加载图片"];
    label.text = @"正文";
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textView.backgroundColor = [UIColor whiteColor];
    textView.layer.cornerRadius = 5;
    
    chooseFaceBtn.backgroundColor = blueBackColor;
    [chooseFaceBtn setTitle:@"添加表情" forState:UIControlStateNormal];
    chooseFaceBtn.titleLabel.textColor = [UIColor whiteColor];
    chooseFaceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    chooseFaceBtn.layer.cornerRadius = 5;
    [chooseFaceBtn setImage:[UIImage imageNamed:@"我要爆料_添加表情_icon"] forState:UIControlStateNormal];
    chooseFaceBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    chooseFaceBtn.adjustsImageWhenHighlighted = NO;
    
    chooseTPicBtn.backgroundColor = blueBackColor;
    [chooseTPicBtn setTitle:@"添加图片" forState:UIControlStateNormal];
    chooseTPicBtn.titleLabel.textColor = [UIColor whiteColor];
    chooseTPicBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    chooseTPicBtn.layer.cornerRadius = 5;
    [chooseTPicBtn setImage:[UIImage imageNamed:@"我要爆料_添加图片_icon"] forState:UIControlStateNormal];
    chooseTPicBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    chooseTPicBtn.adjustsImageWhenHighlighted = NO;

    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    submitBtn.titleLabel.textColor = [UIColor whiteColor];
    submitBtn.backgroundColor = blueBackColor;
    submitBtn.layer.cornerRadius = 5;
    
    [self.view addSubview:titleLab];
    [self.view addSubview:titleField];
    [self.view addSubview:chooseTitleBtn];
    [self.view addSubview:titleImg];
    [self.view addSubview:label];
    [self.view addSubview:textField];
    [self.view addSubview:textView];
    [textView addSubview:chooseFaceBtn];
    [textView addSubview:chooseTPicBtn];
    [self.view addSubview:textImg];
    [self.view addSubview:submitBtn];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(15);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];

    [titleField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [chooseTitleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleField.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(chooseTitleBtn.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
        make.width.height.mas_equalTo(50);

    }];

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleImg.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(100);
    }];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(0);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(60);
    }];

    [chooseFaceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textView).offset(10);
        make.left.equalTo(textView).offset(5);
        make.width.mas_equalTo(110);
        make.bottom.equalTo(textView).offset(-10);
    }];

    [chooseTPicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textView).offset(10);
        make.right.equalTo(textView).offset(-5);
        make.width.mas_equalTo(110);
        make.bottom.equalTo(textView).offset(-10);
    }];

    [textImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textView.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
        make.width.height.mas_equalTo(50);
    }];

    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textImg.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];




}
























@end
