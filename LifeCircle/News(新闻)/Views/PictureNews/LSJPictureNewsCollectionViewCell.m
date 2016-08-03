//
//  LSJPictureNewsCollectionViewCell.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJPictureNewsCollectionViewCell.h"

#import "LSJNetNewsModel.h"


@interface LSJPictureNewsCollectionViewCell ()

@property (nonatomic, weak) UIImageView *imgView;
@property (nonatomic, weak) UILabel *titleLab;
@property (nonatomic, weak) UILabel *textLab;

@end

@implementation LSJPictureNewsCollectionViewCell



-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imgView = [[UIImageView alloc]init];
        UIView *view = [[UIView alloc]init];
        UILabel *titleLab = [[UILabel alloc]init];
        UILabel *textLab = [[UILabel alloc]init];
        
        self.imgView = imgView;
        self.titleLab = titleLab;
        self.textLab = textLab;
        
        imgView.image = [UIImage imageNamed:@"user_default"];
        view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
//        titleLab.text = @"我是一个标题";
        titleLab.font = [UIFont systemFontOfSize:13];
        titleLab.numberOfLines = 0;
        [titleLab sizeToFit];
        
//        textLab.text = @"我是文本内容";
        textLab.font = [UIFont systemFontOfSize:10];
        textLab.numberOfLines = 0;
//        [textLab sizeToFit];
        
        [self addSubview:imgView];
        [imgView addSubview:view];
        [self addSubview:titleLab];
        [self addSubview:textLab];
        
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self).offset(10);
            make.width.equalTo(self).offset(-20);
            make.height.mas_equalTo(imgView.mas_width).multipliedBy(0.8);
        }];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(imgView).offset(0);
            make.centerX.mas_equalTo(imgView.mas_centerX);
            make.bottom.equalTo(imgView).offset(0);
            make.height.mas_equalTo(20);
        }];
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.mas_left).offset(0);
            make.top.equalTo(imgView.mas_bottom).offset(0);
            make.width.mas_equalTo(imgView.mas_width);
            make.height.mas_equalTo(40);
        
        }];
        
        [textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.mas_left).offset(0);
            make.top.equalTo(titleLab.mas_bottom).offset(0);
            make.width.mas_equalTo(titleLab.mas_width);
//            make.bottom.equalTo(self).offset(-5);
            make.height.mas_equalTo(40);
        }];
        
    }
    return self;
}

-(void)setModel:(LSJNetNewsModel *)model
{
    _model = model;
    
    self.textLab.text = model.title;
    self.titleLab.text = model.title;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
}
@end
