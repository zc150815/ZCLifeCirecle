//
//  LSJPhoneController.m
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJPhoneController.h"
#import "LSJNewPasswordController.h"
#import "LSJSendMessageTool.h"


#define textH 50

@interface LSJPhoneController ()

@property (weak, nonatomic) UITextField *accountField;

@property (nonatomic, copy) NSString *phoneNumber;

@property (nonatomic, weak) UITextField *VerificationTF;

@property (weak, nonatomic) UITextField *phoneNumberTF;

@end

@implementation LSJPhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"手机验证";
    
    [self layoutDesign];
}



- (void)layoutDesign{
    
    //    账号文本框
    UITextField *accountField = [[UITextField alloc]init];
    accountField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_手机号_icon"]];
    accountField.leftViewMode = UITextFieldViewModeAlways;
    
    accountField.backgroundColor = blueBackColor;
    
    accountField.placeholder = @"手机号";
    
    [accountField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    [accountField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    accountField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:accountField];
    
    self.accountField = accountField;
    
    [accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(textH);
    }];
    
    //    添加账号文本框
    
    
    UITextField *Verification = [[UITextField alloc]init];
    Verification.placeholder = @"输入验证码";
    
    [Verification setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [Verification setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    Verification.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_手机验证码_icon"]];
    Verification.leftViewMode = UITextFieldViewModeAlways;
    Verification.backgroundColor = blueBackColor;
    Verification.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:Verification];
    
    self.VerificationTF = Verification;
    //    添加密码文本框
    
    [Verification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accountField.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.height.mas_equalTo(accountField);
    }];
    
    UIButton *verificationBtn = [[UIButton alloc]init];
    
    [verificationBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    [verificationBtn setTitleColor:blueBackColor forState:UIControlStateNormal];
    verificationBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:verificationBtn];
    
    [verificationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(Verification);
        make.left.equalTo(Verification.mas_right).offset(20);
        make.right.equalTo(self.view).offset(-10);
        
    }];
    
    [verificationBtn addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];

    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"提交" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:23];
    
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = blueBackColor;
    
    loginBtn.layer.cornerRadius = 10;
    
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(Verification.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(textH);
    }];
    [loginBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    
}
//确认按钮
- (void)submit{
  
    self.phoneNumber = @"1234";
    if (![self.phoneNumber isEqualToString:self.VerificationTF.text]) {
//          NSLog(@"%@",self.VerificationTF.text);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        
        LSJNewPasswordController *newPCV = [[LSJNewPasswordController alloc]init];
        [self.navigationController pushViewController:newPCV animated:YES];
    }
    
}
//短信按钮
-(void)sendMessage{
    if (self.accountField.text.length == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号为空，请输入手机号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (self.accountField.text.length != 11){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号错误，请输入正确手机号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
    }else{
//        NSLog(@"我点击了一下");
//        [[LSJSendMessageTool sharedLSJSendMessage]sendMessageWithPhoneNumber:self.accountField.text     andsucceedBlock:^(NSString *verification) {
//            
//            self.phoneNumber = verification;
//            
//        } andfailureBlock:^(NSError *error) {
//        }];
        
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
