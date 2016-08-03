//
//  LSJOrderViewController.m
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJOrderViewController.h"
#import "LSJPhoneBindingViewController.h"
#import "LSJPayTableViewController.h"
@interface LSJOrderViewController ()


//电话号码
@property (nonatomic, weak) UILabel *phoneNum;

//单价
@property (nonatomic, weak) UILabel *PriceNumLab;

//数量
@property (nonatomic, weak) UILabel *showNumLab;

//总价
@property (nonatomic, weak) UILabel *sumNumLab;

@end

@implementation LSJOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交订单";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setuUpUI];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changePhoneNum:) name:@"changePhoneNum" object:nil];
    
    self.phoneNum.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"phoneNum"];
    
    
}

-(void)changePhoneNum:(NSNotification *)notify{

    NSString *phoneNum = notify.object;
    
    self.phoneNum.text = phoneNum;

}

- (void)setuUpUI{
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
    }];
    titleLabel.text = self.model.title;
    titleLabel.textColor = [UIColor greenColor];
    titleLabel.font = [UIFont systemFontOfSize:21];
    
    UIView *lineView = [[UIView alloc]init];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(10);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
    }];
    lineView.backgroundColor = [UIColor blackColor];
    
    UILabel *singlePrice = [[UILabel alloc]init];
    [self.view addSubview:singlePrice];
    [singlePrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
    }];
    singlePrice.text = @"单价";
    
    UILabel *PriceNumLab = [[UILabel alloc]init];
    
    [self.view addSubview:PriceNumLab];
    
    [PriceNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).offset(20);
        make.right.mas_equalTo(self.view).offset(-10);
    }];
    
    PriceNumLab.text = [NSString stringWithFormat:@"%@元",self.model.price];
    
    self.PriceNumLab = PriceNumLab;
    
    UIView *lineView2 = [[UIView alloc]init];
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(singlePrice.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.height.mas_equalTo(1);
    }];
    lineView2 .backgroundColor = [UIColor blackColor];
    
    
    UILabel *Num = [[UILabel alloc]init];
    
    [self.view addSubview:Num];
    
    [Num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView2.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
    }];
    
    Num.text = @"数量";
    
    UIButton *addBtn = [[UIButton alloc]init];
    
    [self.view addSubview:addBtn];
    
    [addBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView2.mas_bottom).offset(20);
        make.right.mas_equalTo(self.view).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    addBtn.backgroundColor = [UIColor grayColor];
    
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    
    [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *showNumLab = [[UILabel alloc]init];
    
    [self.view addSubview:showNumLab];
    
    [showNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView2.mas_bottom).offset(20);
        make.right.mas_equalTo(addBtn.mas_left).offset(-10);
    }];
    
    showNumLab.text = @"2";
    
    self.showNumLab = showNumLab;
   
    UIButton *subBtn = [[UIButton alloc]init];
    
    [subBtn addTarget:self action:@selector(subBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:subBtn];
    
    [subBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView2.mas_bottom).offset(20);
        make.right.mas_equalTo(showNumLab.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [subBtn setTitle:@"-" forState:UIControlStateNormal];
    
    subBtn.backgroundColor = [UIColor grayColor];
    
  
    UIView *lineView3 = [[UIView alloc]init];
    [self.view addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Num.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.height.mas_equalTo(1);
    }];
    lineView3 .backgroundColor = [UIColor blackColor];
    
    UILabel *sumPrice = [[UILabel alloc]init];
    [self.view addSubview:sumPrice];
    [sumPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView3.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
    }];
    sumPrice.text = @"总价";
    
    UILabel *sumNumLab = [[UILabel alloc]init];
    
    [self.view addSubview:sumNumLab];
    
    [sumNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView3.mas_bottom).offset(20);
        make.right.mas_equalTo(self.view).offset(-10);
    }];
    
    sumNumLab.text = @"24";
    
    self.sumNumLab = sumNumLab;
    
    UILabel *phone = [[UILabel alloc]init];
    [self.view addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sumPrice.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
    }];
    phone.text = @"你的手机号";
    
    
    UIButton *modifyBtn = [[UIButton alloc]init];
    [self.view addSubview:modifyBtn];
    [modifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sumNumLab).offset(80);
        make.right.mas_equalTo(self.view).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    [modifyBtn setTitle:@"修改绑定" forState:UIControlStateNormal];
     modifyBtn.backgroundColor = [UIColor grayColor];
    [modifyBtn addTarget:self action:@selector(clickmodifyBtn) forControlEvents:UIControlEventTouchUpInside];

    UILabel *phoneNum = [[UILabel alloc]init];
    
    [self.view addSubview:phoneNum];
    [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phone.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
    }];
    phoneNum.text = @"111";
    
    phoneNum.font = [UIFont systemFontOfSize:21];
    
    self.phoneNum = phoneNum;
    
    UIButton *orderBtn = [[UIButton alloc]init];
    [self.view addSubview:orderBtn];
    [orderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phoneNum).offset(40);
        make.right.mas_equalTo(self.view).offset(-10);
        make.left.mas_equalTo(self.view).offset(10);
        make.height.mas_equalTo(30);
    }];
    orderBtn.backgroundColor = [UIColor colorWithRed:253.0/255 green:132.0/255 blue:36.0/255 alpha:1.0];
    [orderBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [orderBtn addTarget:self action:@selector(clickorderBtn) forControlEvents:UIControlEventTouchUpInside];
}
//修改绑定
- (void)clickmodifyBtn{
    LSJPhoneBindingViewController *BindingVC = [[LSJPhoneBindingViewController alloc]init];
    
    BindingVC.phoneNum = self.phoneNum.text;
    [self.navigationController pushViewController:BindingVC animated:YES];
}
//提交订单
- (void)clickorderBtn{
    LSJPayTableViewController *pay = [[LSJPayTableViewController alloc]init];
    
    pay.model = self.model;
    
    pay.showNum = self.showNumLab.text;
    
    pay.sumNum = self.sumNumLab.text;
    
    [self.navigationController pushViewController:pay animated:YES];
}

//加号按钮的点击
-(void)addBtnClick:(UIButton *)sender{
    
    NSString *PriceStr = self.PriceNumLab.text;
    
    int priceNumber = [PriceStr intValue];

    NSString *showStr = self.showNumLab.text;
    
    int showNumber = [showStr intValue];
    
    showNumber += 1;
    
    int sumNumber = showNumber * priceNumber;
    
    showStr = [NSString stringWithFormat:@"%d",showNumber];
    
    self.showNumLab.text = showStr;
    
    self.sumNumLab.text = [NSString stringWithFormat:@"%d",sumNumber];
    
}
//减号按钮的点击

-(void)subBtnClick:(UIButton *)sender{
    
    NSString *showStr = self.showNumLab.text;
    
    int showNumber = [showStr intValue];
    
    if (showNumber <= 1) {
        
        return;
    }
    
    showNumber -= 1;

    NSString *PriceStr = self.PriceNumLab.text;
    
    int priceNumber = [PriceStr intValue];

    int sumNumber = showNumber * priceNumber;
    
    showStr = [NSString stringWithFormat:@"%d",showNumber];
    
    self.showNumLab.text = showStr;
    
    self.sumNumLab.text = [NSString stringWithFormat:@"%d",sumNumber];

}




@end
