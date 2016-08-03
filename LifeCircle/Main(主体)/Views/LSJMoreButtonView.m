//
//  LSJMoreButtonView.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//
#define BTNCOUNT 4

#import "LSJMoreButtonView.h"
#import "LSJButton.h"



@interface LSJMoreButtonView ()

@property (nonatomic, assign) CGFloat widthAgo;

@property (strong, nonatomic) NSMutableArray *buttonArr;
@end
@implementation LSJMoreButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSMutableArray *)buttonArr
{
    if (_buttonArr == nil) {
        _buttonArr = [NSMutableArray array];
    }
    return _buttonArr;
}
-(void)addButtonWithStr:(NSString *)str
{
    LSJButton *button = [LSJButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:str forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:button];
    
   
}
-(void)hiddenView
{
    self.hidden = YES;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hiddenView) name:@"ButtonView" object:nil];
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat width = self.bounds.size.width / self.subviews.count;
        CGFloat height = self.bounds.size.height;
        
        CGFloat x = idx * width;
        
        obj.frame = CGRectMake(x, 0, width, height);
        obj.tag = idx;
    }];
}
-(void)clickButton:(UIButton *)sender
{
    self.hidden = YES;
    
    NSNotification *notice = [NSNotification notificationWithName:@"MoreButtonView" object:nil userInfo:@{
                                                                                                          @"button":[NSString stringWithFormat:@"%zd",sender.tag],
                                                                                                          
                                                                                                          }];
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
