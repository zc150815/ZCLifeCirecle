//
//  LSPersonageViewController.m
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSPersonageViewController.h"
#import "LSJSetMeansViewController.h"
#import "LSJSetPasswordViewController.h"
#import "LSJLoginViewController.h"


@interface LSPersonageViewController ()

@property (nonatomic, weak) UIView *nameView;

@property (nonatomic, weak) UIView *meansiView;

@property (nonatomic, weak) UIView *phoneView;

@property (nonatomic, weak) UIView *setUpView;

@property (nonatomic, weak) UILabel *numberLabel;

@property (nonatomic, weak) UILabel *nameLab;
@end

@implementation LSPersonageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = [UIColor grayColor];
    
    [self layoutDesign];
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]initWithTitle:@"首页" style: UIBarButtonItemStyleDone target:self action:@selector(popHome)];
    
    self.navigationItem.leftBarButtonItem = btnItem;
    
    NSString *phone = [[NSUserDefaults standardUserDefaults]objectForKey:@"phoneNum"];
    
    NSString *myName = [[NSUserDefaults standardUserDefaults]objectForKey:@"myName"];
    
    self.numberLabel.text = phone;
    
    self.nameLab.text = myName;
    
    
}

-(void)popHome{

    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)layoutDesign{
    //添加视图
    [self addViews];
    //添加内容
    [self addcontent];
    //添加底部内容
    [self addbottomContent];
//    添加手机号
    [self addPhoneContent];
//    添加设置按钮
    [self addSetUpBtn];
    
}
//添加视图
- (void)addViews{
//    名字视图
    UIView *nameView = [[UIView alloc]init];
    nameView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(132);
    }];
    
    self.nameView = nameView;
//    资料视图
    UIView *meansiView = [[UIView alloc]init];
    meansiView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:meansiView];
    [meansiView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(nameView.mas_bottom).offset(6);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(42);
    }];
    self.meansiView = meansiView;
//    添加联系方式视图
    UIView *phoneView = [[UIView alloc]init];
    phoneView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(meansiView.mas_bottom).offset(2);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(42);
    }];
    self.phoneView = phoneView;
//    添加设置视图
    UIView *setUpView = [[UIView alloc]init];
    setUpView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:setUpView];
    [setUpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneView.mas_bottom).offset(2);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    self.setUpView = setUpView;
}
//     添加内容
- (void)addcontent{
    
    UIImageView *iconImage = [[UIImageView alloc]init];
    iconImage.image = [UIImage imageNamed:@"user_default"];
//    设置圆角
    [iconImage.layer setMasksToBounds:YES];
    [iconImage.layer setCornerRadius:100];
    
    [self.nameView addSubview:iconImage];
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.nameView).offset(12);
        make.left.equalTo(self.nameView).offset(15);
        make.bottom.equalTo(self.nameView).offset(-12);
        make.width.mas_equalTo(100);
    }];
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"小明";
    nameLabel.font = [UIFont systemFontOfSize:25];
    [self.nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameView).offset(24);
        make.left.equalTo(iconImage.mas_right).offset(25);
    }];
    
    self.nameLab = nameLabel;
    
    UIButton *myOrderBtn = [[UIButton alloc]init];
    [myOrderBtn setTitle:@"我的订单" forState:UIControlStateNormal];
    myOrderBtn.titleLabel.font = [UIFont systemFontOfSize:24];
    myOrderBtn.backgroundColor = blueBackColor;
    myOrderBtn.layer.cornerRadius = 10;
    [self.nameView addSubview:myOrderBtn];
    
    [myOrderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(nameLabel.mas_bottom).offset(18);
        make.left.equalTo(iconImage.mas_right).offset(25);
        make.width.mas_equalTo(150);
    }];
    
}
//添加底部内容
- (void)addbottomContent{
    UILabel *sexLabel = [[UILabel alloc]init];
    sexLabel.text =@"性别";
    sexLabel.font = [UIFont systemFontOfSize:20];
    [self.meansiView addSubview:sexLabel];
    [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.meansiView).offset(0);
        make.left.equalTo(self.meansiView).offset(20);
        make.centerY.mas_equalTo(self.meansiView.center);
    }];
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"男";
    nameLabel.font = [UIFont systemFontOfSize:20];
    [self.meansiView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.meansiView).offset(0);
        make.right.equalTo(self.phoneView).offset(-20);
        make.centerY.mas_equalTo(self.meansiView.bounds.size.width/2);
    }];
    
}
- (void)addPhoneContent{
    
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.text =@"手机";
    phoneLabel.font = [UIFont systemFontOfSize:20];
    [self.phoneView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView).offset(0);
        make.left.equalTo(self.phoneView).offset(20);
        make.centerY.mas_equalTo(self.phoneView.center);
    }];
    UILabel *numberLabel = [[UILabel alloc]init];
//    numberLabel.text = @"13888888888";
    
    self.numberLabel = numberLabel;
    
    numberLabel.font = [UIFont systemFontOfSize:20];
    [self.phoneView addSubview:numberLabel];
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView).offset(0);
       make.right.equalTo(self.phoneView).offset(-20);
        make.centerY.mas_equalTo(self.phoneView.bounds.size.width/2);
    }];

    
}
- (void)addSetUpBtn{
    
    UIButton *setMeansBtn = [[UIButton alloc]init];
    [setMeansBtn setTitle:@"修改资料" forState:UIControlStateNormal];
    setMeansBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [setMeansBtn setImage:[UIImage imageNamed:@"个人中心_修改资料按钮icon"] forState:UIControlStateNormal];
    setMeansBtn.backgroundColor = blueBackColor;
    setMeansBtn.layer.cornerRadius = 10;
    [setMeansBtn addTarget:self action:@selector(setMeansi) forControlEvents:UIControlEventTouchUpInside];
    [self.setUpView addSubview:setMeansBtn];
    [setMeansBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.setUpView).offset(32);
        make.left.equalTo(self.setUpView).offset(30);
        make.height.mas_equalTo(37);
    }];
    
    UIButton *SecretCode = [[UIButton alloc]init];
    [SecretCode setTitle:@"修改密码" forState:UIControlStateNormal];
    SecretCode.titleLabel.font = [UIFont systemFontOfSize:20];
    [SecretCode setImage:[UIImage imageNamed:@"个人中心_修改密码按钮icon"] forState:UIControlStateNormal];
    [SecretCode addTarget:self action:@selector(setSecretCode) forControlEvents:UIControlEventTouchUpInside];
    SecretCode.backgroundColor = blueBackColor;
    SecretCode.layer.cornerRadius = 10;
    [self.setUpView addSubview:SecretCode];
    [SecretCode mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.setUpView).offset(32);
        make.right.equalTo(self.setUpView).offset(-30);
        make.height.mas_equalTo(37);
        make.left.equalTo(setMeansBtn.mas_right).offset(12);
        make.width.equalTo(setMeansBtn);
    }];
    
    UIButton *leaveBtn = [[UIButton alloc]init];
    [leaveBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    leaveBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        leaveBtn.backgroundColor = blueBackColor;
    leaveBtn.layer.cornerRadius = 10;
    [self.setUpView addSubview:leaveBtn];
    [leaveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(SecretCode.mas_bottom).offset(50);
        make.left.equalTo(self.setUpView).offset(30);
        make.right.equalTo(self.setUpView).offset(-30);
        make.height.mas_equalTo(37);
        
    }];
    
    [leaveBtn addTarget:self action:@selector(leaveOut) forControlEvents:UIControlEventTouchDown];

}
- (void)setMeansi{
    LSJSetMeansViewController *setMVc = [[LSJSetMeansViewController alloc]init];
    
    [setMVc setAlterMeansBlock:^(NSString *phoneNum, NSString *name) {
        
        self.numberLabel.text = phoneNum;
        
        self.nameLab.text = name;
        
    }];
    
    [self.navigationController pushViewController:setMVc animated:YES];
    
}
- (void)setSecretCode{
    LSJSetPasswordViewController *setPCV = [[LSJSetPasswordViewController    alloc]init];
    [self.navigationController pushViewController:setPCV animated:YES];
    
}
- (void)leaveOut{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你确认退出吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
        
        [userDef setBool:NO forKey:@"sendInSuccess"];
        
        [userDef synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:doneAction];
    [alert addAction:cancelAction];
    //        弹出
    [self presentViewController:alert animated:YES completion:nil];
    
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
