//
//  LSJBiginfoCell.m
//  LifeCircle
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJBiginfoCell.h"
@interface LSJBiginfoCell()
@property (nonatomic, weak) UIImageView *imgView;
@property (nonatomic, weak) UILabel *label;
@end
@implementation LSJBiginfoCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imgView = [[UIImageView alloc]init];
        UILabel *label = [[UILabel alloc]init];
        UIView *labelview = [[UIView alloc]init];
        
        self.imgView = imgView;
        self.label = label;
        
        imgView.image = [UIImage imageNamed:@"Big蛋糕店"];
        label.text = @"独具匠心";
        label.textColor = [UIColor redColor];
        labelview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
        label.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:imgView];
        [self addSubview:labelview];
        [labelview addSubview:label];
        
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(self).offset(0);
            
        }];
        
        [labelview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.right.equalTo(self).offset(0);
            make.bottom.equalTo(self).offset(0);
            make.height.mas_equalTo(20);
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(labelview.mas_top).offset(0);
            make.bottom.equalTo(labelview.mas_bottom).offset(0);
            make.left.equalTo(labelview.mas_left).offset(20);
            make.right.equalTo(labelview.mas_right).offset(0);
            
            
        }];
        
    }
    return self;
}
@end
