//
//  LSJSetPasswordViewController.m
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJSetPasswordViewController.h"

#define textH 50

@interface LSJSetPasswordViewController ()
@property (weak, nonatomic) UITextField *usedPosswordTF;
@property (weak, nonatomic) UITextField *newsPosswordTF;
@property (weak, nonatomic) UITextField *newsPosswordTF2;
@property (nonatomic, copy) NSString *possword;
@property (weak, nonatomic) UIButton *ChangeBtn;

@end

@implementation LSJSetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"修改密码";
    [self layoutDesign];
}

- (void)layoutDesign{
    
    //    账号文本框
    UITextField *accountField = [[UITextField alloc]init];
    accountField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心_修改密码按钮icon"]];
    accountField.leftViewMode = UITextFieldViewModeAlways;
    
    accountField.backgroundColor = blueBackColor;
   
    accountField.placeholder = @"旧密码";
    
    [accountField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    [accountField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    accountField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:accountField];
    
    self.usedPosswordTF = accountField;
    
    [accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(textH);
    }];
    
    //    添加账号文本框
    
    
    //    密码文本框
    UITextField *passwordField = [[UITextField alloc]init];
    passwordField.placeholder = @"新密码，6-12位 仅限数字和字母";
    passwordField.secureTextEntry = YES;
    [passwordField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [passwordField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    passwordField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心_修改密码按钮icon"]];
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    passwordField.backgroundColor = blueBackColor;
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:passwordField];
    
    self.newsPosswordTF = passwordField;
    //    添加密码文本框
    
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accountField.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(accountField);
        make.height.mas_equalTo(accountField);
    }];
    
    UITextField *passwordField2 = [[UITextField alloc]init];
    passwordField2.placeholder = @"确认密码";
    
    [passwordField2 setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [passwordField2 setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    passwordField2.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_密码_icon"]];
    passwordField2.secureTextEntry = YES;
    passwordField2.leftViewMode = UITextFieldViewModeAlways;
    passwordField2.backgroundColor = blueBackColor;
    passwordField2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:passwordField2];
    
    self.newsPosswordTF2 = passwordField2;
    //    添加密码文本框
    
    [passwordField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordField.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(accountField);
        make.height.mas_equalTo(accountField);
    }];
    
    UIButton *ChangeBtn = [[UIButton alloc]init];
    [ChangeBtn setTitle:@"确定修改" forState:UIControlStateNormal];
    ChangeBtn.titleLabel.font = [UIFont systemFontOfSize:23];
    ChangeBtn.enabled = YES;
    [ChangeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ChangeBtn.backgroundColor = blueBackColor;
    
    ChangeBtn.layer.cornerRadius = 10;
    
    [ChangeBtn addTarget:self action:@selector(clickSureToChange) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:ChangeBtn];
    [ChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(passwordField2.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(44);
    }];
    self.ChangeBtn = ChangeBtn;
       
}

- (void)clickSureToChange{
    
    
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    
    self.possword = [userDef objectForKey:@"password"];
    
    if (self.possword != self.usedPosswordTF.text) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您输入的旧密码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (self.newsPosswordTF.text != self.newsPosswordTF2.text){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您输入的旧密码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];

        
    }else if (self.newsPosswordTF.text.length == 0 || self.newsPosswordTF2.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的密码为空，请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];

    }else if (self.newsPosswordTF.text.length < 6){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的密码少于六位，请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        
        [userDef setObject:self.newsPosswordTF.text forKey:@"password"];
        
        [userDef synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
        
        self.ChangeBtn.enabled = NO;
        
    }
    
}

@end
