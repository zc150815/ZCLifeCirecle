//
//  LSJRegisterViewController.m
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJRegisterViewController.h"
#import "LSJLoginViewController.h"
#import "LSJSendMessageTool.h"


@interface LSJRegisterViewController ()

@property (nonatomic, weak) UITextField *accountField;

@property (nonatomic, weak) UITextField *passwordField;

@property (nonatomic, weak) UITextField *passwordField2;

@property (nonatomic, weak) UITextField *phoneNumberField;

@property (nonatomic, weak) UITextField *VerificationField;

@property (nonatomic, weak) UIButton *loginBtn;

@property (nonatomic, weak) UIButton *memorizeBtn;

@property (nonatomic, weak) UIButton *verificationBtn;

@property (nonatomic, copy) NSString *verification;

@end

@implementation LSJRegisterViewController

#define textH 50

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutDesign];

    
}


- (void)layoutDesign{
    
    //    账号文本框
    UITextField *accountField = [[UITextField alloc]init];
    accountField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_用户名_icon"]];
    accountField.leftViewMode = UITextFieldViewModeAlways;
    
    accountField.backgroundColor = blueBackColor;
    //    accountField.textColor = [UIColor whiteColor];
    accountField.placeholder = @"用户名";
    
    [accountField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    [accountField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    accountField.borderStyle = UITextBorderStyleRoundedRect;
    
    //    添加账号文本框
    [self.view addSubview:accountField];
    
    [accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(textH);
    }];
//    赋值
    self.accountField = accountField;
    
    
    //    密码文本框
    UITextField *passwordField = [[UITextField alloc]init];
    passwordField.placeholder = @"输入密码";
    passwordField.secureTextEntry = YES;
    [passwordField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [passwordField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    passwordField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_密码_icon"]];
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    passwordField.backgroundColor = blueBackColor;
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:passwordField];
    
    //    添加密码文本框
    
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accountField.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(accountField);
        make.height.mas_equalTo(accountField);
    }];
    self.passwordField = passwordField;
    
    UITextField *passwordField2 = [[UITextField alloc]init];
    passwordField2.placeholder = @"确认密码";
    passwordField2.secureTextEntry = YES;
    [passwordField2 setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [passwordField2 setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    passwordField2.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"个人中心_修改密码按钮icon"]];
    passwordField2.leftViewMode = UITextFieldViewModeAlways;
    passwordField2.backgroundColor = blueBackColor;
    passwordField2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:passwordField2];
    
    //    添加密码文本框
    
    [passwordField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordField.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(accountField);
        make.height.mas_equalTo(accountField);
    }];
    self.passwordField2 = passwordField2;
    
    
//    手机号码
    UITextField *phoneNumber = [[UITextField alloc]init];
    phoneNumber.placeholder = @"手机号";
    
    [phoneNumber setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [phoneNumber setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    phoneNumber.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_手机号_icon"]];
    phoneNumber.leftViewMode = UITextFieldViewModeAlways;
    phoneNumber.backgroundColor = blueBackColor;
    phoneNumber.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:phoneNumber];
    [phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordField2.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(accountField);
        make.height.mas_equalTo(accountField);
    }];
    self.phoneNumberField = phoneNumber;
    
    
//    验证码
    UITextField *Verification = [[UITextField alloc]init];
    Verification.placeholder = @"输入验证码";
    
    [Verification setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [Verification setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    Verification.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_手机验证码_icon"]];
    Verification.leftViewMode = UITextFieldViewModeAlways;
    Verification.backgroundColor = blueBackColor;
    Verification.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:Verification];
    [Verification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneNumber.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.height.mas_equalTo(accountField);
    }];
    
    self.VerificationField = Verification;
    
    UIButton *verificationBtn = [[UIButton alloc]init];
    
    [verificationBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    [verificationBtn setTitleColor:blueBackColor forState:UIControlStateNormal];
//    [verificationBtn addTarget:self action:@selector(phoneNumber) forControlEvents:UIControlEventTouchUpInside];
    
    verificationBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:verificationBtn];
    
    [verificationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(Verification);
        make.left.equalTo(Verification.mas_right).offset(20);
        make.right.equalTo(self.view).offset(-10);

    }];
    self.verificationBtn = verificationBtn;
    
//    添加注册成功按钮
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"注册成功" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:23];
    
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = blueBackColor;
    loginBtn.layer.cornerRadius = 5;
    
    [loginBtn addTarget:self action:@selector(clickConfirm) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(Verification.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(textH);
    }];
    
    self.loginBtn = loginBtn;
    
//    添加同意button;
    UIButton *memorizeBtn = [[UIButton alloc]init];
    [memorizeBtn setTitle:@"同意《用户使用条例》内容" forState:UIControlStateNormal];
    memorizeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [memorizeBtn setTitleColor:blueBackColor forState:UIControlStateNormal];
    [memorizeBtn setImage:[UIImage imageNamed:@"002"] forState:UIControlStateNormal];
    [memorizeBtn setImage:[UIImage imageNamed:@"复选框"] forState:UIControlStateSelected];

    [memorizeBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:memorizeBtn];

    [memorizeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).offset(12);
        make.centerX.equalTo(self.view);
        
    }];

    self.memorizeBtn = memorizeBtn;
}
- (void)clickBtn:(UIButton*)sender{

    if (sender.selected) {
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
}
//点击注册成功按钮
- (void)clickConfirm{
//    判断错误
    [self judge];
    

    
    if (self.sendUpBlock !=nil) {
        self.sendUpBlock(self.accountField.text,self.passwordField.text);
    }

    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"phoneNumber" object:self.phoneNumberField.text];
}
//发送验证码
- (void)phoneNumber{
    
        if (self.phoneNumberField.text.length == 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你的手机号为空，请输入您的手机号码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
        }else if (self.phoneNumberField.text.length != 11 ){
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您输入的手机号错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addAction:doneAction];
            [alert addAction:cancelAction];
            //        弹出
            [self presentViewController:alert animated:YES completion:nil];
            
        }else{
    
            //创建正则表达式对象
            NSString *pattetn = @"^[1][3,5,7,8][0-9]{9}$";
            NSRegularExpression *reg = [[NSRegularExpression alloc]initWithPattern:pattetn options:0 error:NULL];
            
            NSArray *a =  [reg matchesInString:self.phoneNumberField.text options:NSMatchingReportCompletion range:NSMakeRange(0, self.phoneNumberField.text.length)];
            
            if (a.count == 0) {
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您输入的手机号错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                
                [alert addAction:doneAction];
                [alert addAction:cancelAction];
                //        弹出
                [self presentViewController:alert animated:YES completion:nil];

               
            }else{
                
                [[LSJSendMessageTool sharedLSJSendMessage]sendMessageWithPhoneNumber:self.phoneNumberField.text andsucceedBlock:^(NSString *verification) {
                    
                    self.verification = verification;
                    
                } andfailureBlock:^(NSError *error) {
                    
                }];
            }
        }

    



    {
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:self.phoneNumberField.text];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:self.phoneNumberField.text];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:self.phoneNumberField.text];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            
            //如何设置验证码按钮不可以被点击
            
        if (self.phoneNumberField.text.length == 0) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示:" message:@"手机号不能为空!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
            
        }else if(self.phoneNumberField.text.length != 11)
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示:" message:@"您输入的手机号不正确!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            __block int timeout=60; //倒计时时间
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout<0){ //倒计时结束，关闭
                    dispatch_source_cancel(_timer);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                    });
            }else{
                    int seconds = timeout % 60;
                    NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //设置界面的按钮显示 根据自己需求设置
                        //NSLog(@"____%@",strTime);
                        [UIView beginAnimations:nil context:nil];
                        [UIView setAnimationDuration:1];
                        [self.verificationBtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                        [UIView commitAnimations];
                        self.verificationBtn.userInteractionEnabled = NO;
                        if(seconds == 00)
                        {
                            self.verificationBtn.userInteractionEnabled = YES;
                            [self.verificationBtn setTitle:@"获取短信验证码" forState:UIControlStateNormal];
                            
                        }
                    });
                    timeout--;
                    
                }
            });
            dispatch_resume(_timer);
        }
            
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示:" message:@"手机号错误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    
    
    
    
}
//判断是否错误
- (void)judge{
    
    
    
    if (self.accountField.text.length == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你的用户名为空，请输入用户名" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (self.passwordField.text.length == 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你的密码为空，请输入用户名" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (self.passwordField2.text.length == 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你的密码为空，请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (self.passwordField.text != self.passwordField2.text){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你的密码错误，请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (self.VerificationField.text.length == 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你的验证为空，请输入您的验证" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (!self.memorizeBtn.selected){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请查看《用户使用条例》" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }else if (self.passwordField.text.length < 6){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的密码少于六位，请重新设置" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
        
        
    }
//    else if (![self.verification isEqualToString: self.VerificationField.text]){
//        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        
//        [alert addAction:doneAction];
//        [alert addAction:cancelAction];
//        //        弹出
//        [self presentViewController:alert animated:YES completion:nil];
//
//        
//    }
    else{
        
        [self.navigationController popViewControllerAnimated:YES];
        //    获取偏好设置
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        
        [userDef setObject:self.accountField.text forKey:@"account"];
        [userDef setObject:self.passwordField.text forKey:@"password"];
        
        //    立即存储
        [userDef synchronize];
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
