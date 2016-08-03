//
//  LSJLifeToolsCollectionViewCell.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJLifeToolsCollectionViewCell.h"
#import "LSJGroupCircleModel.h"

@interface LSJLifeToolsCollectionViewCell ()
@property (weak, nonatomic) UIImageView *circleIconView;

@property (weak, nonatomic) UILabel *circleNameLab;

@end

@implementation LSJLifeToolsCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *circleIconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        
        self.circleIconView = circleIconView;
        
        [self.contentView addSubview:circleIconView];
        
        UILabel *circleNameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.width + 10, frame.size.width, frame.size.height - frame.size.width -10)];
        
        circleNameLab.textAlignment = NSTextAlignmentCenter;
        
        self.circleNameLab = circleNameLab;
        
        [self.contentView addSubview:circleNameLab];
        
    }
    return self;
}

-(void)setModel:(LSJGroupCircleModel *)model{
    
    _model = model;
    
    self.circleIconView.image = [UIImage imageNamed:model.cover];
    
    self.circleNameLab.text = model.title;
    
    
}

@end
