//
//  LSJTwoCollectionViewCell.m
//  LifeCircle
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJTwoCollectionViewCell.h"
#import "LSJHomeModel.h"
#import <Masonry.h>

@interface LSJTwoCollectionViewCell ()

//图片框
@property (weak, nonatomic) UIImageView *businessIcon;

//商家名称
@property (weak, nonatomic) UILabel *nameLabel;

//商家介绍
@property (weak, nonatomic) UILabel *introLabel;

//评分视图小星星
@property (weak, nonatomic) UIView *scoreView;

//距离
@property (weak, nonatomic) UIButton *marginBtn;



@end
@implementation LSJTwoCollectionViewCell



//重写init方法 布局
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *businessIcon = [[UIImageView alloc]init];
        UILabel *nameLabel = [[UILabel alloc]init];
        UILabel *introLabel = [[UILabel alloc]init];
        UIButton *marginBtn =[[UIButton alloc]init];
        UIView *startView = [[UIView alloc]init];
        
        self.businessIcon = businessIcon;
        self.nameLabel = nameLabel;
        self.introLabel = introLabel;
        self.marginBtn = marginBtn;
        
        nameLabel.text = @"利来酒店";
        [nameLabel setFont:[UIFont systemFontOfSize:14]];
        
        [marginBtn setTitleColor:[UIColor colorWithRed:255 / 255.0 green:183 / 255.0 blue:0 alpha:1.0] forState:UIControlStateNormal];
        [marginBtn setTitle:@"距离200米" forState:UIControlStateNormal];
        marginBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [marginBtn setImage:[UIImage imageNamed:@"位置小图"] forState:UIControlStateNormal];
        
        businessIcon.image = [UIImage imageNamed:@"1"];
        
        introLabel.text = @"我是酒店的详情介绍,别理我,烦着呢";
        introLabel.numberOfLines = 0;
        introLabel.font = [UIFont systemFontOfSize:10];
        [introLabel sizeToFit];
        
        
        
        NSMutableArray <UIImageView *>*a = [NSMutableArray array];
        for (int i = 0; i < 5; i++) {
            UIImageView *starImgView = [[UIImageView alloc]init];
            starImgView.image = [UIImage imageNamed:@"五星1"];

            
            [startView addSubview:starImgView];
            [a addObject:starImgView];
            
        }
        
        [self.contentView addSubview:businessIcon];
        [self.contentView addSubview:nameLabel];
        [self.contentView addSubview:introLabel];
        [self.contentView addSubview:startView];
        [self.contentView addSubview:marginBtn];
        
        
        //设置商家图标约束
        [businessIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-5);
            make.width.equalTo(self).multipliedBy(0.4);
            make.height.mas_equalTo(businessIcon.mas_width);
        }];
//
        //设置距离图标约束
        [marginBtn  mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(businessIcon.mas_bottom).offset(5);
            make.centerX.mas_equalTo(businessIcon.mas_centerX);
            make.width.mas_equalTo(businessIcon.mas_width);
        }];
//
        //设置商家名称的约束
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(businessIcon.mas_left).offset(-10);
        }];
        
        //设置评分约束
        [startView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(nameLabel.mas_bottom).offset(0);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(businessIcon.mas_left).offset(-10);
            make.height.mas_equalTo(12);
            
        }];
        
        //设置描述label的约束
        [introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(startView.mas_bottom).offset(5);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(businessIcon.mas_left).offset(-10);
            
        }];
        
        
        //设置5个图片的位置
        [a[0] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(startView);
            make.height.mas_equalTo(startView.mas_height);
            make.width.mas_equalTo(startView.mas_height);
            
        }];
        
        [a[1] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(startView);
            make.left.equalTo(a[0].mas_right);
            make.width.equalTo(a[0]);
    
        }];
        [a[2] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(startView);
            make.left.equalTo(a[1].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        [a[3] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(startView);
            make.left.equalTo(a[2].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        [a[4] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(startView);
            make.left.equalTo(a[3].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        
        
        
    }
    return self;
}

-(void)setModel:(LSJHomeModel *)model{
    
    _model = model;
    
    self.businessIcon.image = [UIImage imageNamed:model.image];
    
    self.nameLabel.text = model.name;
    self.introLabel.text = model.describe;
    [self.marginBtn setTitle:model.btnText forState:UIControlStateNormal];
}
@end
