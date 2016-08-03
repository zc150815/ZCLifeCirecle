//
//  LSJNewPasswordController.m
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNewPasswordController.h"
#import "LSJLoginViewController.h"

@interface LSJNewPasswordController ()


@end

@implementation LSJNewPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"验证成功";
    [self layoutDesign];
}

- (void)layoutDesign{
    
    //    账号文本框
    UITextField *accountField = [[UITextField alloc]init];
    accountField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心_修改密码按钮icon"]];
    accountField.leftViewMode = UITextFieldViewModeAlways;
    
    accountField.backgroundColor = blueBackColor;
    
    accountField.placeholder = @"新密码";
    
    [accountField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    [accountField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    accountField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:accountField];
    
    [accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(textH);
    }];
    
    //    添加账号文本框
    
    
    //    密码文本框
    UITextField *passwordField = [[UITextField alloc]init];
    passwordField.placeholder = @"再次输入密码";
    
    [passwordField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [passwordField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    passwordField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_密码_icon"]];
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    passwordField.backgroundColor = blueBackColor;
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:passwordField];
    
    //    添加密码文本框
    
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accountField.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(accountField);
        make.height.mas_equalTo(accountField);
    }];
    
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"提交" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:23];
    
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = blueBackColor;
    
    loginBtn.layer.cornerRadius = 10;
    
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(passwordField.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(textH);
    }];
    [loginBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)submit{
    
    LSJLoginViewController *loginVC = [[LSJLoginViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
