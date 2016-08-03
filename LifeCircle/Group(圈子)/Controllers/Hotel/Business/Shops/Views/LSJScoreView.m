//
//  LSJScoreView.m
//  LifeCircle
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJScoreView.h"

@implementation LSJScoreView

-(instancetype)init{

    if (self = [super init]) {
        
        NSMutableArray <UIImageView *>*a = [NSMutableArray array];
        
        for (int i = 0; i < 5; i++) {
            UIImageView *starImgView = [[UIImageView alloc]init];
            starImgView.image = [UIImage imageNamed:@"五星1"];
            [self addSubview:starImgView];
            
            [a addObject:starImgView];
        }
        
        [a[0] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
        }];
        
        [a[1] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(self);
            make.left.equalTo(a[0].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        [a[2] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(self);
            make.left.equalTo(a[1].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        [a[3] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.equalTo(self);
            make.left.equalTo(a[2].mas_right);
            make.width.equalTo(a[0]);
            
        }];
        [a[4] mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.bottom.right.equalTo(self);
            make.left.equalTo(a[3].mas_right);
            make.width.equalTo(a[0]);
            
        }];


    }
    return self;
}

@end
