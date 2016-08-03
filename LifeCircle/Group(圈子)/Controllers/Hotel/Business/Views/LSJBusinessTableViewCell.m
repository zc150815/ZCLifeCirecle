//
//  LSJBusinessTableViewCell.m
//  LifeCircle
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJBusinessTableViewCell.h"
#import <Masonry.h>

@interface LSJBusinessTableViewCell ()

//图片框
@property (weak, nonatomic) UIImageView *businessIcon;

//商家名称
@property (weak, nonatomic) UILabel *nameLabel;

//商家介绍
@property (weak, nonatomic) UILabel *introLabel;

//评分视图
@property (weak, nonatomic) UIView *scoreView;

//距离
@property (weak, nonatomic) UIButton *marginBtn;



@end

@implementation LSJBusinessTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *businessIcon = [[UIImageView alloc]init];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        
        [nameLabel setFont:[UIFont systemFontOfSize:25]];
        
        UILabel *introLabel = [[UILabel alloc]init];
        
        introLabel.numberOfLines = 0;
        
        
        NSMutableArray <UIImageView *>*a = [NSMutableArray array];
        
        UIView *scoreView = [[UIView alloc]init];
        
        for (int i = 0; i < 5; i++) {
            UIImageView *starImgView = [[UIImageView alloc]init];
            starImgView.image = [UIImage imageNamed:@"五星1"];
            [scoreView addSubview:starImgView];
            
            [a addObject:starImgView];
        }
        
        UIButton *marginBtn =[[UIButton alloc]init];
        
        
        
        [marginBtn setTitleColor:[UIColor colorWithRed:255 / 255.0 green:183 / 255.0 blue:0 alpha:1.0] forState:UIControlStateNormal];
        
        self.businessIcon = businessIcon;
        
        self.nameLabel = nameLabel;
        
        self.introLabel = introLabel;
        
        self.scoreView = scoreView;
        
        self.marginBtn = marginBtn;
        
        [self.contentView addSubview:businessIcon];
        
        [self.contentView addSubview:nameLabel];
        
        [self.contentView addSubview:introLabel];
        
        [self.contentView addSubview:scoreView];
        
        [self.contentView addSubview:marginBtn];
        
        self.nameLabel.text = @"利来酒店";
        
        self.businessIcon.image = [UIImage imageNamed:@"2"];
        
        self.introLabel.text = @"gdgdgdfgdfdgdfgdgdgggggggggggggggggggggggggggggf";
        
        [self.marginBtn setTitle:@"距离200米" forState:UIControlStateNormal];
        
        [self.marginBtn setImage:[UIImage imageNamed:@"位置小图"] forState:UIControlStateNormal];
        
        
        //设置商家图标约束
        [self.businessIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.contentView).offset(10);
            
            make.bottom.equalTo(self.contentView).offset(-10);
            
            make.left.equalTo(self.contentView).offset(10);
            
            make.width.mas_equalTo(110);
            
            
        }];
        
        //设置商家名称lab约束
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.contentView).offset(9);
            
            make.left.equalTo(self.businessIcon.mas_right).offset(15);
            
            make.right.equalTo(self.contentView).offset(0);
            
        }];
        
        //设置商家简介lab约束
        [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            
            make.left.equalTo(self.businessIcon.mas_right).offset(15);
            
            make.right.equalTo(self.contentView).offset(10);
            
            
            
            
        }];
        
        //设置评分图片约束
        [self.scoreView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.contentView).offset(-10);
            
            make.left.equalTo(self.businessIcon.mas_right).offset(15);
            
            make.width.mas_equalTo(100);
            
            make.height.mas_equalTo(20);
            
        }];
        
        
        
        //设置5个图片的位置
        
        [a[0] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self.scoreView);
        }];
        
        [a[1] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(self.scoreView);
            make.left.equalTo(a[0].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        [a[2] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(self.scoreView);
            make.left.equalTo(a[1].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        [a[3] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(self.scoreView);
            make.left.equalTo(a[2].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        [a[4] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.right.equalTo(self.scoreView);
            make.left.equalTo(a[3].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        
        
        
        //设置距离lab约束
        [self.marginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(self.contentView).offset(-5);
            
            make.bottom.equalTo(self.contentView).offset(-5);
            
            make.width.mas_equalTo(120);
            
            make.height.mas_equalTo(20);
            
        }];
        
        
        
    }
    
    return self;
    
}


@end
