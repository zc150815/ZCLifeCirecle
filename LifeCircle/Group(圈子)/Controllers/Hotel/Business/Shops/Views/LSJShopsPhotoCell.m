//
//  LSJShopsPhotoCell.m
//  LifeCircle
//
//  Created by ios on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJShopsPhotoCell.h"

@implementation LSJShopsPhotoCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *circleIconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        
        circleIconView.image = [UIImage imageNamed:@"蛋糕店"];
//        self.circleIconView = circleIconView;
        
        [self.contentView addSubview:circleIconView];
        
        UILabel *circleNameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.width + 10, frame.size.width, frame.size.height - frame.size.width -10)];
        
        circleNameLab.textAlignment = NSTextAlignmentCenter;
        
        circleNameLab.text = @"蛋糕店";
        
//        self.circleNameLab = circleNameLab;
        
        [self.contentView addSubview:circleNameLab];
        
    }
    return self;
}
@end
