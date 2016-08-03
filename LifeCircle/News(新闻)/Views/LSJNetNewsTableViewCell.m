//
//  LSJNetNewsTableViewCell.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNetNewsTableViewCell.h"
#import "LSJNetNewsModel.h"
#import <UIImageView+WebCache.h>

@interface LSJNetNewsTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImage;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *textLab;


@end

@implementation LSJNetNewsTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.iconImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.iconImage];

        self.titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.titleLabel];
        
        
        self.textLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.textLab];
    }
    return self;
}

-(void)setModel:(LSJNetNewsModel *)model
{
    _model = model;
    
    CGFloat topMargin = 10;
    CGFloat xMargin = topMargin;
    CGFloat imageWidth = 100;
    CGFloat imageHeight = imageWidth;
    
    CGFloat labelX = xMargin + imageWidth + xMargin;
    CGFloat labelWidth = self.bounds.size.width - labelX - xMargin;
    CGFloat labelHeight = 40;
    
    self.iconImage.image = [UIImage imageNamed:@"user_default"];
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.iconImage.frame = CGRectMake(xMargin, topMargin, imageWidth, imageHeight);
    
    
    self.titleLabel.text = model.title;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.frame = CGRectMake(labelX, topMargin, labelWidth, labelHeight);
    
    
    self.textLab.text = model.digest;
    self.textLab.numberOfLines = 0;
    self.textLab.font = [UIFont systemFontOfSize:10];
    self.textLab.frame = CGRectMake(labelX, topMargin + labelHeight, labelWidth, 1.5*labelHeight);
    
}

@end
