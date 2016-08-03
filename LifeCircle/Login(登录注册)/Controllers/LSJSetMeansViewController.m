//
//  LSJSetMeansViewController.m
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJSetMeansViewController.h"

@interface LSJSetMeansViewController ()
@property (nonatomic, weak) UIView *nameView;

@property (nonatomic, weak) UIView *phoneView;

@property (nonatomic, weak) UIView *setUpView;

@property (nonatomic, weak) UITextField *phoneNumber;

@property (nonatomic, weak) UITextField *nameTextField;

@end

@implementation LSJSetMeansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改资料";
    self.view.backgroundColor = [UIColor grayColor];
    [self layoutDesign];
}


- (void)layoutDesign{
    
    [self addViews];
    [self addcontent];
    [self addPhoneContent];
    [self addBtn];
}
- (void)addViews{
    //    名字视图
    UIView *nameView = [[UIView alloc]init];
    nameView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nameView];
    [nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(200);
    }];
    
    self.nameView = nameView;
    //    添加联系方式视图
    UIView *phoneView = [[UIView alloc]init];
    phoneView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:phoneView];
    [phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameView.mas_bottom).offset(2);
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
- (void)addcontent{
    
    UIImageView *iconImage = [[UIImageView alloc]init];
    iconImage.image = [UIImage imageNamed:@"user_default"];
    [self.nameView addSubview:iconImage];
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.nameView).offset(12);
        make.left.equalTo(self.nameView).offset(15);
        make.width.height.mas_equalTo(120);
    }];
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"昵称:";
    nameLabel.font = [UIFont systemFontOfSize:25];
    [self.nameView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(iconImage.mas_right).offset(20);
        make.centerY.equalTo(iconImage);
        make.width.mas_equalTo(60);
        
    }];
    
    UITextField *nameTextField = [[UITextField alloc]init];
    nameTextField.backgroundColor = blueBackColor;
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.placeholder = @"请输入名称";
    [nameTextField setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.nameView addSubview:nameTextField];
    [nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(nameLabel.mas_right).offset(5);
        make.centerY.equalTo(iconImage);
        make.right.equalTo(self.nameView).offset(-10);
        make.height.mas_equalTo(40);
        
    }];
    self.nameTextField = nameTextField;
}
- (void)addPhoneContent{
    
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.text =@"绑定手机";
    phoneLabel.font = [UIFont systemFontOfSize:20];
    [self.phoneView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView).offset(0);
        make.left.equalTo(self.phoneView).offset(20);
        make.centerY.mas_equalTo(self.phoneView.center);
    }];
    UITextField *numberTF = [[UITextField alloc]init];
    numberTF.backgroundColor = [UIColor whiteColor];
    numberTF.borderStyle = UITextBorderStyleRoundedRect;
    numberTF.placeholder = @"请输入手机号码";
    [numberTF setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.phoneView addSubview:numberTF];
    [numberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLabel.mas_right).offset(10);
        make.centerY.mas_equalTo(self.phoneView.center);
        make.right.equalTo(self.phoneView).offset(-10);
        make.height.mas_equalTo(40);
        
    }];
    self.phoneNumber =numberTF;
}
- (void)addBtn{
    
    
    UIButton *confirmBtn = [[UIButton alloc]init];
    [confirmBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    confirmBtn.backgroundColor = blueBackColor;
    confirmBtn.layer.cornerRadius = 10;
    [confirmBtn addTarget:self action:@selector(clickConfirm) forControlEvents:UIControlEventTouchUpInside];
    [self.setUpView addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.setUpView).offset(32);
        make.left.equalTo(self.setUpView).offset(30);
        make.height.mas_equalTo(37);
    }];
    
    UIButton *cancelBtn = [[UIButton alloc]init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [cancelBtn addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.backgroundColor = blueBackColor;
    cancelBtn.layer.cornerRadius = 10;
    [self.setUpView addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.setUpView).offset(32);
        make.right.equalTo(self.setUpView).offset(-30);
        make.height.mas_equalTo(37);
        make.left.equalTo(confirmBtn.mas_right).offset(12);
        make.width.equalTo(confirmBtn);
    }];

    
}
- (void)clickConfirm{
    
    if (self.alterMeansBlock) {
        self.alterMeansBlock(self.phoneNumber.text,self.nameTextField.text);
    }
    
    
    [[NSUserDefaults standardUserDefaults]setObject:self.phoneNumber.text forKey:@"phoneNum"];
    
    [[NSUserDefaults standardUserDefaults]setObject:self.nameTextField.text forKey:@"myName"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)clickCancel{
    
    
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
