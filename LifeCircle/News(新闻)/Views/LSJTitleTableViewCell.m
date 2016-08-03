//
//  LSJTitleTableViewCell.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJTitleTableViewCell.h"
#import "LSJNewsModel.h"
#import "LSJNewsTableViewController.h"

#import "LSJRealtimeTableViewController.h"


@interface LSJTitleTableViewCell ()

@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation LSJTitleTableViewCell

-(NSArray *)titleArr
{
    if (_titleArr == nil) {
        _titleArr = [LSJNewsModel setupNewsModelWithPlistName:@"NewsTitle.plist"];
    }
    return _titleArr;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        CGFloat leftMargin = 15;
        CGFloat topMargin = 12;
        
        CGFloat btnWidth = 54;
        CGFloat btnHeight = btnWidth;
        CGFloat btnY = topMargin;
        
        
        CGFloat xMargin = ([UIScreen mainScreen].bounds.size.width - 2*leftMargin - 4*btnWidth)/3;
        
        for (NSInteger i = 0 ; i < 4; i++)
        {
            LSJNewsModel *model = self.titleArr[i];
            
            CGFloat btnX = leftMargin + (btnWidth + xMargin)*i;
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            UILabel *label = [[UILabel alloc]init];
            
            button.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
            label.frame = CGRectMake(btnX, btnY + btnWidth + 10, btnWidth, 9);
            
            [button setBackgroundImage:[UIImage imageNamed:model.cover] forState:UIControlStateNormal];
            button.tag = i;
            
            label.text = model.title;
            label.font = [UIFont systemFontOfSize:13];
            
            [self.contentView addSubview:button];
            [self.contentView addSubview:label];
            
            [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
            
        }
    }
    return self;
}

-(void)clickBtn:(UIButton *)sender
{
    if (sender.tag == 0 ) {
        self.callBack(RealtimeNews);
    }
    else if (sender.tag == 1){
        self.callBack(PictureNews);
    }
    else if (sender.tag == 2){
        self.callBack(VideoNews);
    }
    else{
        self.callBack(BreakingNews);
    }
}







@end
