//
//  LSJShopsFootView.m
//  LifeCircle
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJShopsFootView.h"
#import "LSJScoreView.h"

@implementation LSJShopsFootView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        //评价标题
        UILabel *judgeLab = [[UILabel alloc]init];
        
        judgeLab.text = @"评价";
        
        judgeLab.font = [UIFont systemFontOfSize:22];
        
        //输入文本框
        UITextView *judgeTextView = [[UITextView alloc]init];
        
        judgeTextView.layer.borderWidth = 1.0;
        
        judgeTextView.layer.cornerRadius = 8.0;
        
        //选择评分Lab
        UILabel *changeScoreLab = [[UILabel alloc]init];
        
        changeScoreLab.text = @"选择评分";
        
        [changeScoreLab setTextColor:[UIColor colorWithRed:66 / 255.0 green:66 / 255.0  blue:66 / 255.0  alpha:66 / 255.0 ]];
        
        //分数视图
        LSJScoreView *scoreView = [[LSJScoreView alloc]init];
        
        //发表评论按钮
        UIButton *publishBtn = [[UIButton alloc]init];
        
        publishBtn.layer.cornerRadius = 8.0;
        
        publishBtn.layer.masksToBounds = YES;
        
        [publishBtn setBackgroundColor:[UIColor colorWithRed:53 / 255.0 green:174 / 255.0 blue:243 / 255.0 alpha:1.0]];
        
        [publishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [publishBtn setTitle:@"发表评论" forState:UIControlStateNormal];
        
        [self addSubview:judgeLab];
        [self addSubview:judgeTextView];
        [self addSubview:changeScoreLab];
        [self addSubview:scoreView];
        [self addSubview:publishBtn];
        
        [judgeLab mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.left.equalTo(self).offset(9);
            
        }];
        
        [changeScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.left.equalTo(self).offset(9);
            
            make.bottom.equalTo(self).offset(-9);
            
        }];
        
        [judgeTextView mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.top.equalTo(judgeLab.mas_bottom).offset(9);
            
            make.left.equalTo(self).offset(9);
            
            make.bottom.equalTo(changeScoreLab.mas_top).offset(-9);
            
            make.right.equalTo(self).offset(-9);
            
        }];
        
        [scoreView mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.centerY.equalTo(changeScoreLab);
            
            make.left.equalTo(changeScoreLab.mas_right).offset(9);
            
            make.width.mas_equalTo(75);
            
            make.height.mas_equalTo(15);
            
        }];
        
        [publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.top.equalTo(judgeTextView.mas_bottom).offset(9);
            
            make.right.bottom.equalTo(self).offset(-9);
            
            make.width.mas_equalTo(80);
            
            make.height.mas_equalTo(30);
        }];
        
        
    }
    
    return self;
}

@end
