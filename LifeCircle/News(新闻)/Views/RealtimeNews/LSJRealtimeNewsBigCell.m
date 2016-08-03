//
//  LSJRealtimeNewsBigCell.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJRealtimeNewsBigCell.h"
#import "LSJNetNewsModel.h"

@interface LSJRealtimeNewsBigCell ()

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIImageView *imgView;


@end


@implementation LSJRealtimeNewsBigCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *imgView = [[UIImageView alloc]init];
        UILabel *label = [[UILabel alloc]init];
        UIView *labelview = [[UIView alloc]init];
        
        self.imgView = imgView;
        self.label = label;
        
        
//        imgView.image = [UIImage imageNamed:@"Big蛋糕店"];
//        imgView.backgroundColor = [UIColor yellowColor];
        
        labelview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
        
//        label.text = @"我就是一个label";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
    
        [self addSubview:imgView];
        [self addSubview:labelview];
        [labelview addSubview:label];
        
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self).offset(10);
//            make.bottom.equalTo(self.mas_bottom);
//            make.left.equalTo(self).offset(10);
//            make.right.equalTo(self).offset(-10);
            make.top.bottom.left.right.mas_equalTo(self);

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

-(void)setModel:(LSJNetNewsModel *)model
{
    _model = model;
    
    self.label.text = model.title;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
}

@end
