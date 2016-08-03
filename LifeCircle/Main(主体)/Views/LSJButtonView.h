//
//  LSJButtonView.h
//  LifeCircle
//
//  Created by Ning Xie on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSJButtonView ;
@protocol LSJButtonViewDelegate <NSObject>

-(void)buttomView:(LSJButtonView *)buttomView andWithSelectedIndex:(NSInteger)index;

@end

@interface LSJButtonView : UIView

@property (weak, nonatomic) id<LSJButtonViewDelegate>delegate;


-(void)addButtonWithImage:(UIImage *)image;



@end
