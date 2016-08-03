//
//  LSJVideoNewsCollectionViewCell.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJVideoNewsCollectionViewCell.h"

@implementation LSJVideoNewsCollectionViewCell


-(void)clickPlayBtn:(UIButton *)sender
{
    if (sender.selected) {
        sender.selected = NO;
    }
    else
    {
        sender.selected = YES;
    }
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imgView = [[UIImageView alloc]init];
        UIView *view = [[UIView alloc]init];
        UILabel *titleLab = [[UILabel alloc]init];
        UILabel *textLab = [[UILabel alloc]init];
        
        UIButton *playBtn = [[UIButton alloc]init];
        [playBtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [playBtn setBackgroundImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
        [playBtn addTarget:self action:@selector(clickPlayBtn:) forControlEvents:UIControlEventTouchDown];
        
        
        imgView.image = [UIImage imageNamed:@"1"];
        imgView.userInteractionEnabled = YES;
        view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        titleLab.text = @"我是一个标题";
        titleLab.font = [UIFont systemFontOfSize:15];
        textLab.text = @"我是文本内容";
        textLab.font = [UIFont systemFontOfSize:13];
        textLab.numberOfLines = 0;
        [textLab sizeToFit];
        
        [self addSubview:imgView];
        [imgView addSubview:view];
        [self addSubview:titleLab];
        [self addSubview:textLab];
        [view addSubview:playBtn];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self).offset(10);
            make.width.equalTo(self).offset(-20);
            make.height.mas_equalTo(imgView.mas_width).multipliedBy(0.8);
        }];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.mas_equalTo(imgView);
        }];
        
        [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view.mas_centerX);
            make.centerY.mas_equalTo(view.mas_centerY);
            make.width.height.equalTo(view.mas_height).multipliedBy(0.5);
            
        }];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.mas_left).offset(0);
            make.top.equalTo(imgView.mas_bottom).offset(10);
            make.width.mas_equalTo(imgView.mas_width);
            make.height.mas_equalTo(20);
        }];
        
        [textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.mas_left).offset(0);
            make.top.equalTo(titleLab.mas_bottom).offset(5);
            make.width.mas_equalTo(titleLab.mas_width);
            //            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        
    }
    return self;
}

@end
