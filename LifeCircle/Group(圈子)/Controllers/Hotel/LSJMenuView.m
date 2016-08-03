//
//  LSJMenuView.m
//  LifeCircle
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJMenuView.h"
#import "LSJPageViewController.h"
#import "UIView+HMFrame.h"
@interface LSJMenuView()

@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (weak, nonatomic) IBOutlet UIButton *Business;
@property (weak, nonatomic) IBOutlet UIButton *EvaluateButton;
@property (weak, nonatomic) IBOutlet UIView *animateView;

@end
@implementation LSJMenuView

-(instancetype)init{

    if (self = [super init]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"LSJMenuView" owner:nil options:nil] lastObject];
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    //默认选中左边按钮
    self.infoButton.selected = YES;
}
- (IBAction)infoButton:(id)sender {
    
    [self.superview endEditing:YES];
    if (_scollView) [_scollView setContentOffset:CGPointZero animated:YES];
    
}
- (IBAction)business:(id)sender {
    
    [self.superview endEditing:YES];
  if (_scollView) [_scollView setContentOffset:CGPointMake(_scollView.contentSize.width/3.f, 0) animated:YES];
    
}
- (IBAction)Evaluate:(id)sender {
    [self.superview endEditing:YES];
    if (_scollView) [_scollView setContentOffset:CGPointMake(_scollView.contentSize.width/3.f * 2, 0) animated:YES];
 
}

- (void)setWidth:(CGFloat)width
{
    _width = width;
    self.w = width;
    
}
- (void)animateViewProgress:(CGFloat)progress
{
    //让下面那根线动起来
    if (progress>0 && progress<1) {
        self.animateView.x = progress * self.w;
    }
    //根据偏移 选择按钮
    if (progress > 1/6.f && progress <= 0.5)
    {
        [self selectBusinessButton];
    }
    else if(progress > 0.5)
    {
        [self selectEvaluateButton];
    }
    else
    {
        [self selectInfoButton];
    }
    
}
#pragma mark 切换选中按钮
- (void)selectBusinessButton
{
    if (!self.Business.selected)
    {
        self.Business.selected = YES;
        self.infoButton.selected = NO;
        self.EvaluateButton.selected = NO;
    }
}

- (void)selectEvaluateButton
{
    if (!self.EvaluateButton.selected)
    {
        self.Business.selected = NO;
        self.infoButton.selected = NO;
        self.EvaluateButton.selected = YES;
    }
}

- (void)selectInfoButton
{
    if (!self.infoButton.selected)
    {
        self.Business.selected = NO;
        self.infoButton.selected = YES;
        self.EvaluateButton.selected = NO;
    }
}

#pragma mark 设置按钮标题
- (void)setInfoTitle:(NSString *)infoTitle
{
    _infoTitle = infoTitle;
    if (self.infoButton) {
        [self.infoButton setTitle:infoTitle forState:UIControlStateNormal];
        [self.infoButton setTitle:infoTitle forState:UIControlStateHighlighted];
        [self.infoButton setTitle:infoTitle forState:UIControlStateSelected];
    }
}
- (void)setBusinessTitle:(NSString *)BusinessTitle
{
    _BusinessTitle = BusinessTitle;
    if (self.Business) {
        [self.Business setTitle:BusinessTitle forState:UIControlStateNormal];
        [self.Business setTitle:BusinessTitle forState:UIControlStateHighlighted];
        [self.Business setTitle:BusinessTitle forState:UIControlStateSelected];
    }
}
- (void)setEvaluateTitle:(NSString *)EvaluateTitle
{
    _EvaluateTitle = EvaluateTitle;
    if (self.EvaluateButton) {
        [self.EvaluateButton setTitle:EvaluateTitle forState:UIControlStateNormal];
        [self.EvaluateButton setTitle:EvaluateTitle forState:UIControlStateHighlighted];
        [self.EvaluateButton setTitle:EvaluateTitle forState:UIControlStateSelected];
    }
}
@end
