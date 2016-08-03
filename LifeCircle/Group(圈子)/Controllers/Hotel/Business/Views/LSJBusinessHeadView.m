//
//  LSJBusinessHeadView.m
//  LifeCircle
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJBusinessHeadView.h"
#import <Masonry.h>
#import "LSJBusinessRegionButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation LSJBusinessHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //区域按钮
        LSJBusinessRegionButton *btn = [[LSJBusinessRegionButton alloc]init];
        
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [btn setTitle:@"区 域" forState:UIControlStateNormal];
        
        [btn setFont:[UIFont systemFontOfSize:25]];
        
        [btn setImage:[UIImage imageNamed:@"搜索框左边的箭头"] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [self addSubview:btn];
        
        
        //设置区域按钮约束
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.mas_equalTo(100);
            
        }];
        
        //创建搜索文本框
        UITextField *searchField = [[UITextField alloc]init];
        
        //创建文本框左视图
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        
        view.image = [UIImage imageNamed:@"搜索框中的搜索icon"];
        
//        UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"搜索框中的搜索icon"]];
        
        searchField.leftView = view;
        
        //设置文本框边框样式
        [searchField setBorderStyle:UITextBorderStyleLine];
        
        //切圆角
        searchField.layer.cornerRadius = 8.0;
        
        searchField.layer.masksToBounds = YES;
        
        //设置文本框变边框线宽
        searchField.layer.borderWidth = 2.0;
        
        //设置边框颜色
        searchField.layer.borderColor = [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0].CGColor;
        
        
        [searchField setLeftViewMode:UITextFieldViewModeAlways];
        
        [self addSubview:searchField];
        
        self.searchField = searchField;
        
        
        //设置文本框约束
        [searchField mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.top.equalTo(self).offset(10);
            make.left.equalTo(btn.mas_right).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.mas_equalTo(200);
            
        }];
        
        UIButton *searchBtn = [[UIButton alloc]init];
        
        [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        
        [searchBtn setBackgroundColor:[UIColor colorWithRed:53/255.0 green:174/255.0 blue:243/255.0 alpha:1.0]];
        
        searchBtn.layer.cornerRadius = 10;
        
        searchBtn.layer.masksToBounds = YES;
        
        [self addSubview:searchBtn];
        
        
        [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.bottom.equalTo(self).offset(-10);
            make.width.mas_equalTo(60);
            
        }];
        
    }
    
    return self;
}



@end
