//
//  LSJRealtimeNewsTableViewCell.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJRealtimeNewsTableViewCell.h"
#import "LSJNetNewsModel.h"
#import "UIImageView+WebCache.h"

@interface LSJRealtimeNewsTableViewCell ()

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIImageView *imgView;

@end

@implementation LSJRealtimeNewsTableViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *label = [[UILabel alloc]init];
        UIImageView *imgView = [[UIImageView alloc]init];
        
        self.label = label;
        self.imgView = imgView;
        
        self.imgView.image = [UIImage imageNamed:@"user_default"];
        
//        label.text = @"[航空咨询]青岛机场2014年旅客吞吐量或超乌鲁木齐机场";
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:16];
        
//        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        [paragraphStyle setLineSpacing:10];
//        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
//        label.attributedText = attributedString;
        
        
//        imgView.image = [UIImage imageNamed:@"2"];
        
        
        [self addSubview:label];
        [self addSubview:imgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(5);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(self.mas_height).offset(-10);
            make.width.equalTo(imgView.mas_height);
            
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(5);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(imgView.mas_left).offset(-30);

            make.bottom.equalTo(self).offset(-5);
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
