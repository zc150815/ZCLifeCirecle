//
//  LSJLoginViewController.m
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJLoginViewController.h"
#import "LSJIconModel.h"
#import "LSJRegisterViewController.h"
#import "LSJPhoneController.h"
#import "LSJRegisterViewController.h"
#import "LSJHomeTableViewController.h"


@interface LSJLoginViewController ()
//账号文本框
@property(nonatomic, weak) UITextField *accountField;
//密码文本框
@property(nonatomic, weak) UITextField *passwordField;
//记住密码按键
@property(nonatomic, weak) UIButton *forgetBtn;

@property(nonatomic,weak) UIButton *memorizeBtn;
//注册按钮
@property(nonatomic, weak) UIButton *registerBtn;
//第三方登录label
@property(nonatomic, weak) UILabel *otherLoginLabel;
//分割线
@property(nonatomic, weak) UIView *carveUpView;
//图标数组
@property (nonatomic, strong) NSArray *iconArray;
//用来读取偏好设置账号
@property (nonatomic, copy) NSString * account;
//用来读取偏好设置密码
@property (nonatomic, copy) NSString * password;



@end

@implementation LSJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    添加文本输入框
    [self addTextField];
    //    添加按钮
    [self addButton];
    //    添加lable
    [self addLable];
    //    添加分割线
    [self addCarveUp];
    //   添加图标
    [self addImage];
    
    

}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self layoutDesign];
}
//页面布局
- (void)layoutDesign{
    
//    读取偏好设置
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    self.account = [userDef objectForKey:@"account"];
    self.password = [userDef objectForKey:@"password"];

    
    BOOL forget = [userDef boolForKey:@"selected123"];
    
    if (forget) {
        self.accountField.text = self.account;
        self.passwordField.text = self.password;
    }
    self.memorizeBtn.selected = forget;
    
}


#pragma mark - 添加文本框
- (void)addTextField{
    
    //    账号文本框
    UITextField *accountField = [[UITextField alloc]init];
    accountField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登陆注册_用户名_icon"]];
    accountField.leftViewMode = UITextFieldViewModeAlways;
    accountField.backgroundColor = blueBackColor;
        accountField.textColor = [UIColor whiteColor];
    accountField.placeholder = @"用户名";
    
    [accountField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    [accountField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    accountField.borderStyle = UITextBorderStyleRoundedRect;
    accountField.textColor = [UIColor blackColor];
    
    [self.view addSubview:accountField];
  

    
    [accountField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view).offset(33);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(44);
    }];

    //    密码文本框
    UITextField *passwordField = [[UITextField alloc]init];
    self.passwordField = passwordField;
    passwordField.placeholder = @"6-12位 仅限数字个字母";
    
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
    
    self.accountField = accountField;
    self.passwordField = passwordField;
}
#pragma mark - 添加按钮
- (void)addButton{
//    添加记住密码安钮
    UIButton *memorizeBtn = [[UIButton alloc]init];
    [memorizeBtn setTitle:@"记住密码" forState:UIControlStateNormal];
    [memorizeBtn setTitleColor:blueBackColor forState:UIControlStateNormal];
    [memorizeBtn setImage:[UIImage imageNamed:@"002"] forState:UIControlStateNormal];
    [memorizeBtn setImage:[UIImage imageNamed:@"复选框"] forState:UIControlStateSelected];
    [memorizeBtn addTarget:self action:@selector(clickforgetBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:memorizeBtn];
    
    [memorizeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordField.mas_bottom).offset(9);
        make.left.equalTo(self.view).offset(20);
        
    }];
    self.memorizeBtn = memorizeBtn;
//    添加忘记按钮
    UIButton *forgetBtn = [[UIButton alloc]init];
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:blueBackColor forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forget) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:forgetBtn];
    
    
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordField.mas_bottom).offset(9);
        make.right.equalTo(self.view).offset(-20);
        
    }];
    self.forgetBtn = forgetBtn;
//    添加登录按钮
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:23];
    
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.backgroundColor = blueBackColor;
    
    loginBtn.layer.cornerRadius = 10;
    
    [loginBtn addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(forgetBtn.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(44);
    }];
    
//    注册按钮
    UIButton *registerBtn = [[UIButton alloc]init];
    [registerBtn setTitle:@"还没有账号？立即注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [registerBtn addTarget:self action:@selector(pulsate) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:registerBtn];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(loginBtn.mas_bottom).offset(33);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
    }];
    
    self.registerBtn = registerBtn;
}
#pragma mark - 添加lable
- (void)addLable{
    UILabel *otherLoginLabel = [[UILabel alloc]init];
    otherLoginLabel.text = @"第三方登录";
    otherLoginLabel.textColor = blueBackColor;
    [self.view addSubview:otherLoginLabel];
    
    [otherLoginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.registerBtn.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view);
    }];
    self.otherLoginLabel = otherLoginLabel;
}
#pragma mark - 添加分割线
- (void)addCarveUp{
    
    UIView *carveUpView = [[UIView alloc]init];
    carveUpView.backgroundColor = blueBackColor;
    [self.view addSubview:carveUpView];
    [carveUpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.otherLoginLabel.mas_bottom).offset(15);
        make.height.mas_equalTo(1);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
    self.carveUpView = carveUpView;
}
#pragma mark - 添加第三方图标
- (void)addImage{
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat BtnW = 40;
    CGFloat BtnH = BtnW;
    CGFloat BtnY = 400;
    CGFloat LableY = BtnY + BtnW + 25;
    CGFloat leftMargin = 50;
    CGFloat Xmargin = (viewW - 4 * BtnW - 2 *leftMargin ) / 3;
    
    for (int i = 0; i < 4; i++) {
        UIButton *iconButton = [[UIButton alloc]init];
        
        CGFloat BtnX = leftMargin + i * (BtnW+ Xmargin);
        
        iconButton.frame = CGRectMake(BtnX, BtnY, BtnW, BtnH);
        
        LSJIconModel *model = self.iconArray[i];
        
        [iconButton setImage:[UIImage imageNamed:model.iconName] forState:UIControlStateNormal];
        
        [self.view addSubview:iconButton];
        
        UILabel *otherApp = [[UILabel alloc]init];
        otherApp.text = model.title;
        CGFloat LableX = iconButton.center.x;
        otherApp.center = CGPointMake(LableX, LableY);
        otherApp.bounds = CGRectMake(0, 0, BtnW, 40);
        otherApp.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:otherApp];
    }
    
    
    
}
//忘记密码按键点击事件
- (void)forget{
    
    LSJPhoneController *pensonageVC = [[LSJPhoneController alloc]init];
    [self.navigationController pushViewController:pensonageVC animated:YES];
    
}
//记住按钮点击事件
- (void)clickforgetBtn:(UIButton*)sender{

    sender.selected = !sender.selected;
    
//    NSLog(@"%d",sender.selected);
    
    
//        存储偏好设置
    NSUserDefaults *userDef1 = [NSUserDefaults standardUserDefaults];
    
    [userDef1 setBool:sender.selected forKey:@"selected123"];
    
    [userDef1 synchronize];
}
//注册按钮点击事件
- (void)pulsate{
    LSJRegisterViewController *registerVC = [[LSJRegisterViewController alloc]init];
    [registerVC setSendUpBlock:^(NSString *account, NSString *password) {
        self.accountField.text = account;
        self.passwordField.text = password;
//        NSLog(@"%@,%@",account,password);
    }];
    [self.navigationController pushViewController:registerVC animated:YES];
}
//点击登录按钮
- (void)clickLogin{
//    判断文本框是否为空
    [self judge];
    
    //    读取偏好设置
    [self read];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.accountField.text forKey:@"phoneNum"];
//    记住密码
    
}

- (void)judge{
    
    if (self.accountField.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你的账号为空，请输入账号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (self.accountField.text != self.account || self.passwordField.text != self.password){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您输入的帐号或密码错误,请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if (self.passwordField.text.length == 0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的密码为空，请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:doneAction];
        [alert addAction:cancelAction];
        //        弹出
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
//读取偏好设置
- (void)read{
    
    if (self.accountField.text == self.account && self.passwordField.text == self.password) {
        
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        [userDef setBool:YES forKey:@"sendInSuccess"];
        [userDef synchronize];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}
#pragma mark - 懒加载
- (NSArray *)iconArray{
    
    if (_iconArray == nil) {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"LoginIcon.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            LSJIconModel *model = [LSJIconModel iconWithDict:dict];
            
            [arrayM addObject:model];
        }
        _iconArray = arrayM.copy;
    }
    return _iconArray;
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
