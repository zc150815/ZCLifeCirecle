//
//  LSJPhoneBindingViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJPhoneBindingViewController.h"
#import "LSPersonageViewController.h"
#import "LSJSendMessageTool.h"
@interface LSJPhoneBindingViewController ()
@property (nonatomic, copy) NSString *Phone;
@property (nonatomic, copy) NSString *mess;

//电话文本框
@property (nonatomic, weak) UITextField *PhoneNumText;

@property (nonatomic, weak) UITextField *test;

//验证按钮
@property (nonatomic, weak) UIButton *testBtn;

//验证码
@property (nonatomic, weak) NSString *verification;
@end

@implementation LSJPhoneBindingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.verification = @"1111";
    
    self.title = @"手机绑定";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpUIandphone:@"输入原手机号" andmess:@"验证"];
    
}
- (void)setUpUIandphone:(NSString *)phone andmess:(NSString *)mess{
    
    UITextField *PhoneNumText = [[UITextField alloc]init];
    
    self.PhoneNumText = PhoneNumText;
    
    [self.view addSubview:PhoneNumText ];
    
    [PhoneNumText  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(100);
        make.left.mas_equalTo(self.view).offset(10);
    }];

    PhoneNumText.placeholder = phone;
    
    UIView *lineView1 = [[UIView alloc]init];
    
    [self.view addSubview:lineView1];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(PhoneNumText.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.height.mas_equalTo(1);
    }];
    lineView1.backgroundColor = [UIColor blackColor];
    
    UITextField *test = [[UITextField alloc]init];
    
    self.test = test;
    
    [self.view addSubview:test];
    
    [test  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
    }];

    test.placeholder = @"再次输入手机号";
    
    UIButton *testBtn = [[UIButton alloc]init];
    
    testBtn.hidden = YES;
    
    [self.view addSubview:testBtn];
    
    [testBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView1.mas_bottom).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    [testBtn setBackgroundColor:[UIColor colorWithRed:53 / 255.0 green:174 / 255.0 blue:243 / 255.0 alpha:1.0]];
    
    [testBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    [testBtn addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
    
    self.testBtn = testBtn;
    
    UIView *lineView2 = [[UIView alloc]init];
    
    [self.view addSubview:lineView2];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(test.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.height.mas_equalTo(1);
    }];
    lineView2.backgroundColor = [UIColor blackColor];
    
    UIButton *BingBtn = [[UIButton alloc]init];
    
    [BingBtn setBackgroundColor:[UIColor colorWithRed:53 / 255.0 green:174 / 255.0 blue:243 / 255.0 alpha:1.0]];
    
    [self.view addSubview:BingBtn];
    
    [BingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView2).offset(40);
        make.right.mas_equalTo(self.view).offset(-10);
        make.left.mas_equalTo(self.view).offset(10);
        make.height.mas_equalTo(30);
    }];
    
    [BingBtn setTitle:mess forState:UIControlStateNormal];

    [BingBtn addTarget:self action:@selector(clickBingBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 验证按钮点击
- (void)clickBingBtn:(UIButton *)btn{
    
    if ([btn.titleLabel.text isEqualToString:@"验证"]) {
        
        if ([self.PhoneNumText.text isEqualToString:self.phoneNum] && [self.test.text isEqualToString:self.phoneNum]) {
            
            self.PhoneNumText.text = nil;
            self.test.text = nil;
            
            [btn setTitle:@"绑定" forState:UIControlStateNormal];
            
            self.PhoneNumText.placeholder = @"请输入新手机号";
            
            self.test.placeholder = @"请输入验证码";
            
            self.testBtn.hidden = NO;
        }
        else{
            
            [self alertController:@"手机号错误或两次输入不一致"];
            
        }
    }
    else{
        
        if (self.PhoneNumText.text.length != 11 && self.test.text.length != 4) {
            
            [self alertController:@"请输入正确的手机号或验证码"];
        }
        
        else{
            
            if ([self.test.text isEqualToString:self.verification ]) {
                
                [[NSNotificationCenter defaultCenter]postNotificationName:@"changePhoneNum" object:self.PhoneNumText.text];
                
                //存储电话号码到偏好设置
                [[NSUserDefaults standardUserDefaults]setObject:self.PhoneNumText.text forKey:@"phoneNum"];
                
                [self.navigationController popViewControllerAnimated:YES];
                
            }
            else{
                
                [self alertController:@"请输入正确的手机号或验证码"];
            }
        }
    }

    
    
}

#pragma mark - 获取验证码按钮点击发送短信
-(void)sendMessage{
    
    [[LSJSendMessageTool sharedLSJSendMessage]sendMessageWithPhoneNumber:self.PhoneNumText.text andsucceedBlock:^(NSString *verification) {
        
        self.verification = verification;
        
        
    } andfailureBlock:^(NSError *error) {
        
        if (error) {
            [self alertController:@"请输入正确的手机号"];
        }
        
    }];
    
}
-(void)alertController:(NSString *)message{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
