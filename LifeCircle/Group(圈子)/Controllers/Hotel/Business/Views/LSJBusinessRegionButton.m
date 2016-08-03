//
//  LSJBusinessRegionButton.m
//  LifeCircle
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJBusinessRegionButton.h"
#import "UIView+HMFrame.h"

@implementation LSJBusinessRegionButton

-(void)layoutSubviews{
    
    [super layoutSubviews];
    //改变按钮里面控件的位置
    self.titleLabel.x = 0;
    
    
    
    self.imageView.x = self.titleLabel.w + 5;
    
    
    
}

@end
