//
//  LSJOneCollectionViewCell.m
//  LifeCircle
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJOneCollectionViewCell.h"
#import "LSJGroupCircleModel.h"
#import <Masonry.h>

@interface LSJOneCollectionViewCell ()

@property (weak, nonatomic) UIImageView *circleIconView;

@property (weak, nonatomic) UILabel *circleNameLab;

@end
@implementation LSJOneCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
       
        
//        UIImageView *circleIconView = [[UIImageView alloc]initWithFrame:CGRectMake(6, 8, frame.size.width- 10, frame.size.width - 20)];
        UIImageView *circleIconView = [[UIImageView alloc]init];
        
        self.circleIconView = circleIconView;
        
        [self.contentView addSubview:circleIconView];
        
//        UILabel *circleNameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.width + 10, frame.size.width, frame.size.height - frame.size.width -10)];
        UILabel *circleNameLab = [[UILabel alloc]init];
        circleNameLab.textAlignment = NSTextAlignmentCenter;
        
        self.circleNameLab = circleNameLab;
        
        [self.contentView addSubview:circleNameLab];
        //设置约束
         CGFloat imgWidth = ((108.0 / 640) * ([UIScreen mainScreen].bounds.size.width));
        [self.circleIconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            //x / [UIScreen main].bounds.size.width = 108 / 640
            make.width.equalTo(@(imgWidth));
            
            make.height.equalTo(@(imgWidth));
            
        }];
        [self.circleNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.circleIconView.mas_bottom).offset(5);
            make.centerX.equalTo(self);
            
        }];

        
    }
    return self;
}

-(void)setModel:(LSJGroupCircleModel *)model{
    
    _model = model;
    
    
    self.circleIconView.image = [UIImage imageNamed:model.cover];
    
    self.circleNameLab.text = model.title;
    
    
}



@end
