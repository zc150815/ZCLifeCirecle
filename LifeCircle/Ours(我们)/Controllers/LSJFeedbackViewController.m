//
//  LSJFeedbackViewController.m
//  LifeCircle
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJFeedbackViewController.h"
#import "LSPersonageViewController.h"
#import <Masonry.h>
@interface LSJFeedbackViewController ()
@property (copy, nonatomic) NSMutableString *textStr;
@property (weak, nonatomic) UIView *clickView;
@property (strong, nonatomic) UITextView *messageField;

@end

@implementation LSJFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
    [self setUpUI];
}

#pragma mark
#pragma mark - 设置界面显示控件
- (void)setUpUI{
   
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 25, 25);
    
    rightButton.backgroundColor = [UIColor clearColor];
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"title_个人资料"] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(handleClickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];

    //创建一个textview, 用来让用户进行输入文本的操作
    self.messageField = [[UITextView alloc]init];
    [self.view addSubview:self.messageField];
    
    [self.messageField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(10);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.height.mas_equalTo(100);
    }];
    //设置文本框的背景颜色
    self.messageField.backgroundColor = [UIColor whiteColor];
    
    self.messageField.layer.masksToBounds = YES;
    //设置文本框变边框线宽
    self.messageField.layer.borderWidth = 2.0;
    //设置边框颜色
    self.messageField.layer.borderColor = [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0].CGColor;
  

    //创建一个提交按钮,并添加到视图中,添加一个点击事件
    UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:doneButton];
    //自动布局
    [doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.messageField.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.height.mas_equalTo(38);
    }];
    
    doneButton.layer.cornerRadius = 10.0;
    //设置提交按钮的背景颜色 文字 并添加一个点击事件
    doneButton.backgroundColor = [UIColor colorWithRed:0 green:153/255.0 blue:255/255.0 alpha:1.0];
    [doneButton setTitle:[NSString stringWithFormat:@"提交"] forState: UIControlStateNormal];
    [doneButton addTarget:self action:@selector(handleClickDoneBtn:) forControlEvents:UIControlEventTouchUpInside];
  
    
    //创建一个label, 用来显示文字
    UILabel *thanksLabel = [[UILabel alloc]init];
    [self.view addSubview:thanksLabel];
    //自动布局
    [thanksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(doneButton.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view).offset(30);
        make.right.mas_equalTo(self.view).offset(-30);
    }];
    
    //设置 label 中的文字的字体以及内容,并设置自动换行
    thanksLabel.numberOfLines = 0;
    thanksLabel.font = [UIFont systemFontOfSize:14];
    thanksLabel.textColor = [UIColor colorWithRed:66.0/255.0 green:66.0/255.0 blue:66.0/255.0 alpha:1.0];
    thanksLabel.text = @"大家的意见已为软件的升级,优化起到了重要作用,再次深表感谢,对于大家普遍关心的问题,会及时给予解答欢迎审阅。希望大家继续提出宝贵意见。";

}

#pragma mark
#pragma mark - 设置提交按钮的点击事件
- (void)handleClickDoneBtn:(UIButton *)sender
{
    [self.messageField endEditing:YES];
    UIAlertController *promptAC = [UIAlertController alertControllerWithTitle:nil message: @"我们会珍惜您给我意见反馈"preferredStyle:UIAlertControllerStyleAlert];
    [promptAC addAction:[UIAlertAction actionWithTitle:@"返回首页" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        // 点击确定按钮的时候, 会调用这个block
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }]];
    
    [promptAC addAction:[UIAlertAction actionWithTitle:@"继续反馈" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
       // self.messageField.text = nil;
       [self.messageField becomeFirstResponder];
    }]];
    [self presentViewController:promptAC animated:YES completion:nil];
}
#pragma mark
#pragma mark - 设置右按钮的点击事件
- (void)handleClickRightBtn:(UIButton *)sender
{
    
    // NSLog(@"点击了我一下");
    LSPersonageViewController *pvc = [[LSPersonageViewController alloc]init];
    [self.navigationController pushViewController:pvc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
