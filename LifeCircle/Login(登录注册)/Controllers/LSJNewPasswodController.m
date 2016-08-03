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
@property (nonatomic, weak) UITextField *passwordTF;

@property (nonatomic, weak) UITextField *passwordTF2;

@property (nonatomic, weak) UIButton *loginBtn;
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
    accountField.secureTextEntry = YES;
    accountField.backgroundColor = blueBackColor;
    
    accountField.placeholder = @"新密码，至少输入六位数字或字母";
    
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
    
    self.passwordTF = accountField;
    //    添加账号文本框
    
    
    //    密码文本框
    UITextField *passwordField = [[UITextField alloc]init];
    passwordField.placeholder = @"再次输入密码";
    passwordField.secureTextEntry = YES;
    [passwordField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [passwordField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    passwordField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_密码_icon"]];
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    passwordField.backgroundColor = blueBackColor;
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:passwordField];
    
    self.passwordTF2 = passwordField;
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
    
    loginBtn.enabled = YES;
    
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(passwordField.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(textH);
    }];
    [loginBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginBtn = loginBtn;
    
}
- (void)submit{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    
    if (self.passwordTF.text != self.passwordTF2.text){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您输入的密码格式错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }else if (self.passwordTF.text.length == 0 || self.passwordTF2.text.length == 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的密码为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];

        
    }else if (self.passwordTF.text.length < 6){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的密码小于6位数，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        
        
        [self presentViewController:alert animated:YES completion:nil];
        

        
    }else{
        self.loginBtn.enabled = NO;
        
        [userDef setObject:self.passwordTF.text forKey:@"password"];
        
        [userDef synchronize];
        LSJLoginViewController *loginVC = [[LSJLoginViewController alloc]init];
        
        [self.navigationController pushViewController:loginVC animated:YES];
        
    }

    
    
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
