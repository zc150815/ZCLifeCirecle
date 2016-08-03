//
//  LSJButtonView.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//
#define ICONCOUNT 5
#import "LSJButtonView.h"
#import "LSJButton.h"
#import "LSJMoreButtonView.h"
#import "LSJGroupCircleModel.h"

@interface LSJButtonView ()
@property (nonatomic, strong) UIView *currentcoverView;

@property (nonatomic, weak) LSJMoreButtonView *moreBtnView;

//@property (nonatomic, strong) UIBarButtonItem *

@property (strong, nonatomic) NSArray *dataArr;


@end

@implementation LSJButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)removeMoreView
{
    [self.moreBtnView removeFromSuperview];
}

-(instancetype)init
{
    if (self = [super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeMoreView) name:@"removeMoreView" object:nil];
    }
    return self;
}
-(void)addButtonWithImage:(UIImage *)image
{
    LSJButton *button = [LSJButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:image forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:button];
}

-(void)layoutSubviews
{
    CGFloat buttonWidth = 30;
    CGFloat buttonHeight = 30;
    CGFloat buttonMargin = (self.bounds.size.width - ICONCOUNT * buttonWidth)/ICONCOUNT;
    CGFloat buttonY = 0;
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    moreBtn.frame = CGRectMake(self.bounds.size.width - buttonMargin - buttonWidth, buttonY, buttonWidth, buttonHeight);
    moreBtn.adjustsImageWhenHighlighted = NO;
    [moreBtn setBackgroundImage:[UIImage imageNamed:@"TabBar05"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(clickMoreBtn:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:moreBtn];
    
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat buttonX = buttonMargin/2 + idx * (buttonWidth + buttonMargin);
        
        obj.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
        
    }];
    for (NSInteger i = 0; i < ICONCOUNT; i++) {
        
        static NSString *labelstr;
        CGFloat labelCenterX = (buttonMargin + buttonWidth)/2 + i*(buttonMargin + buttonWidth);
        CGFloat labelCenterY =  buttonHeight + 10;
        CGPoint labelCenter = CGPointMake(labelCenterX, labelCenterY);
        
        UILabel *label = [[UILabel alloc]init];
        label.center = labelCenter;
        label.bounds = CGRectMake(0, 0, 40, 20);
        switch (i) {
            case 0:
                labelstr = @"首页";
                break;
            case 1:
                labelstr = @"新闻";
                break;
            case 2:
                labelstr = @"圈子";
                break;
            case 3:
                labelstr = @"我们";
                break;
            case 4:
                labelstr = @"更多";
                break;
            default:
                break;
        }
        label.text = labelstr;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"Helvetica" size:13];
        [self addSubview:label];
    }
}


-(void)clickButton:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ButtonView" object:nil];
    NSInteger index = [self.subviews indexOfObject:sender];
    
    if ([self.delegate respondsToSelector:@selector(buttomView:andWithSelectedIndex:)])
    {
        [self.delegate buttomView:self andWithSelectedIndex:index];
    }
    
}


-(void)clickMoreBtn:(UIButton *)sender
{
    if (!self.moreBtnView) {
        
        sender.selected = YES;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = 44;
        CGFloat y = [UIScreen mainScreen].bounds.size.height - self.bounds.size.height - height;
        

       LSJMoreButtonView *moreBtnView= [[LSJMoreButtonView alloc]initWithFrame:CGRectMake(0, y, width, height)];
        self.moreBtnView = moreBtnView;
        [moreBtnView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.75]];
        
        for (NSInteger i = 0; i < self.dataArr.count; i++) {
            
            LSJGroupCircleModel *model = self.dataArr[i];
            
            [_moreBtnView addButtonWithStr:model.title];
        }
        
        
        [self.superview.superview addSubview:moreBtnView];
        
        return;
        
    }
    else if (self.moreBtnView.hidden)
    {
        self.moreBtnView.hidden = NO;
    }
    else
    {
        self.moreBtnView.hidden = YES;
    }
    
}



-(NSArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [LSJGroupCircleModel GroupCircleModelWithPlistName:@"MoreButtonView.plist"];
    }
    return _dataArr;
}
    
    


@end
