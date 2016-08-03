//
//  LSJAllClassButton.m
//  LifeCircle
//
//  Created by Ning Xie on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJAllClassButton.h"
#import "UIView+MDRExtension.h"

@implementation LSJAllClassButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 互换位置
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + 5; // 间距为5
    self.imageView.bounds = CGRectMake(0, 0, 10, 10);
}



@end
