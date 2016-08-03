/*
 
 //产品描述
 @property (copy, nonatomic) NSString *description;
 //商家图片地址
 @property (copy, nonatomic) NSString *s_image_url;
 //商家名称
 @property (copy, nonatomic) NSString *title;
 //商家网址-调转用
 @property (copy, nonatomic) NSString *deal_url;
 //产品价格
 @property (copy, nonatomic) NSString *current_price;
 
 */
//
//  LSJNearbyTableViewCell.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNearbyTableViewCell.h"

@interface LSJNearbyTableViewCell ()

@property (weak, nonatomic)UIImageView *iconImg;
@property (weak, nonatomic)UILabel *titleLab;

@property (weak, nonatomic)UILabel *textLab;

@property (weak, nonatomic)UILabel *addressLab;



@end

@implementation LSJNearbyTableViewCell

//-(instancetype)initWithFrame:(CGRect)frame
//{



-(void)setBusnessDic:(NSDictionary *)busnessDic
{
    _busnessDic = busnessDic;
    [self.iconImg sd_setImageWithURL:self.busnessDic[@"s_image_url"]];
    self.titleLab.text = self.busnessDic[@"title"];
    self.textLab.text = self.busnessDic[@"description"];
//    self.addressLab.text = self.busnessDic[@"current_price"];
    self.addressLab.text = [NSString stringWithFormat:@"¥ %@",self.busnessDic[@"current_price"]];

}
-(instancetype)init{
//    if (self = [super initWithFrame:frame]) {
    
    if (self = [super init]) {
    
    
        
        UIImageView *iconImg = [[UIImageView alloc]init];
        UILabel *titleLab = [[UILabel alloc]init];
        UILabel *textLab = [[UILabel alloc]init];
        UILabel *addressLab = [[UILabel alloc]init];
        UIButton *distanceBtn = [[UIButton alloc]init];
        UILabel *distanceLab = [[UILabel alloc]init];
        
//        iconImg.backgroundColor = [UIColor blueColor];
        
        self.iconImg = iconImg;
        self.titleLab = titleLab;
        self.textLab = textLab;
        self.addressLab = addressLab;
        self.distanceLab = distanceLab;
      
        //商家图片
        iconImg.image = [UIImage imageNamed:@"1"];
//        titleLab.text = @"我是饭店的名字";
//        textLab.text = @"我是饭店的详情介绍";
//        addressLab.text = @"我是饭店的详细地址";
        
        
        
        
        titleLab.font = [UIFont systemFontOfSize:17];
        [titleLab sizeToFit];
        textLab.font = [UIFont systemFontOfSize:14];
        textLab.numberOfLines = 0;
//        [textLab sizeToFit];
        
        addressLab.font = [UIFont systemFontOfSize:14];
        addressLab.textColor = [UIColor redColor];
    
        
        [distanceBtn setTitle:@"距离" forState:UIControlStateNormal];
        [distanceBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        distanceBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [distanceBtn setImage:[UIImage imageNamed:@"位置小图"] forState:UIControlStateNormal];
        
        distanceLab.text = @"300米";
        distanceLab.font = [UIFont systemFontOfSize:12];
        distanceLab.textColor = [UIColor orangeColor];
//        [distanceLab sizeToFit];
        
        [self addSubview:iconImg];
        [self addSubview:titleLab];
        [self addSubview:textLab];
        [self addSubview:addressLab];
        [self addSubview:distanceBtn];
        [self addSubview:distanceLab];
        
        [iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo (self).offset(10);
            make.height.width.equalTo(self.mas_height).offset(-20);
        }];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.left.equalTo(iconImg.mas_right).offset(10);
            make.right.equalTo(self).offset(-10);
            
        }];
        
        [textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLab.mas_left);
            make.top.equalTo(titleLab.mas_bottom).offset(0);
            make.right.equalTo(self).offset(-10);
            make.bottom.equalTo(iconImg.mas_bottom).offset(-20);
            
        }];
        
        [addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(textLab.mas_left);
            make.top.equalTo(textLab.mas_bottom).offset(10);
            make.right.equalTo(self).offset(-100);
        }];
        
        [distanceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-60);
            make.centerY.mas_equalTo(addressLab.mas_centerY);
            
        }];
        
        [distanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(distanceBtn.mas_right).offset(10);
            make.right.equalTo(self).offset(-10);
            make.centerY.mas_equalTo(distanceBtn.mas_centerY);
        }];
        
        
        
        
    }
    
    return self;
}

@end
