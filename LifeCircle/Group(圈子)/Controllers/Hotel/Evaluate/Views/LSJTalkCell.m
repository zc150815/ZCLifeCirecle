//
//  LSJTalkCell.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJTalkCell.h"
#import <Masonry.h>
@interface LSJTalkCell()<UITextViewDelegate>
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UILabel *lookNum;
@property (nonatomic, weak) UILabel *commentNum;
@property (nonatomic, weak) UILabel *content;
@property (nonatomic, weak) UILabel *comment;
@property (nonatomic, weak) UITextField *contentField;
@end
@implementation LSJTalkCell
//创建子控件，并添加到试图上
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc]init];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];
         titleLabel.font = [UIFont systemFontOfSize:21];
        titleLabel.textColor = [UIColor redColor];
        
        UILabel *timeLabel = [[UILabel alloc]init];
        self.timeLabel = timeLabel;
        [self.contentView addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:12];
        
        UILabel *lookNum = [[UILabel alloc]init];
        self.lookNum = lookNum;
        [self.contentView addSubview:lookNum];
        lookNum.font = [UIFont systemFontOfSize:12];
        
        UILabel *commentNum = [[UILabel alloc]init];
        self.commentNum = commentNum;
        [self.contentView addSubview:commentNum];
        commentNum.font = [UIFont systemFontOfSize:12];
        
        UILabel *content = [[UILabel alloc]init];
        self.content = content;
        [self.contentView addSubview:content];
        content.font = [UIFont systemFontOfSize:12];
        
        UILabel *comment = [[UILabel alloc]init];
        self.comment = comment;
        [self.contentView addSubview:comment];
        
        UIButton *shareButton = [[UIButton alloc]init];
        self.shareButton = shareButton;
        [self.contentView addSubview:shareButton];
        shareButton.backgroundColor = [UIColor colorWithRed:0 green:153.0/255 blue:255.0/255 alpha:1.0];
//        [shareButton addTarget:self action:@selector(clickshareButton) forControlEvents:UIControlEventTouchUpInside];
        
        UITextField *contentField = [[UITextField alloc]init];
        self.contentField = contentField;
        [self.contentView addSubview:contentField];
        [self.contentField addTarget:self action:@selector(textFieldDidChage) forControlEvents:UIControlEventEditingChanged];
        contentField.tintColor = [UIColor redColor];
        [contentField setTintColor:[UIColor redColor]];
        //切圆角
        contentField.layer.cornerRadius = 8.0;
        contentField.layer.masksToBounds = YES;
        //设置文本框变边框线宽
        contentField.layer.borderWidth = 2.0;
        //设置边框颜色
        contentField.layer.borderColor = [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0].CGColor;
        //切圆角
       contentField.layer.cornerRadius = 8.0;
        contentField.layer.masksToBounds = YES;
        //设置文本框变边框线宽
        contentField.layer.borderWidth = 2.0;
        //设置边框颜色
       contentField.layer.borderColor = [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1.0].CGColor;
        
        


        UIButton *sendButton = [[UIButton alloc]init];
        self.sendButton = sendButton;
        [self.contentView addSubview:sendButton];
        sendButton.backgroundColor = [UIColor colorWithRed:0 green:153.0/255 blue:255.0/255 alpha:1.0];
    }
    return self;
}
- (void)textFieldDidChage{
     [[NSNotificationCenter defaultCenter]postNotificationName:@"contentField" object:self.contentField.text];
}
//点击分享按钮
//- (void)clickshareButton{
//    UIView *shareView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.bounds.size.width, 120)];
//    shareView.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
//    self.shareView = shareView;
//    [self addSubview:shareView];
//    
//    
//    CGFloat marginX = 10;
//    CGFloat buttonH = 50;
//    CGFloat mainW = [UIScreen mainScreen].bounds.size.width;
//    for (int i = 0; i < self.pictureArr.count; i++) {
//        
//        CGFloat buttonW = (mainW - (self.pictureArr.count + 1) * marginX)/self.pictureArr.count;
//        CGFloat buttonX = marginX + (buttonW + marginX) * i;
//        CGFloat buttonY = marginX;
//        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
//        [shareView addSubview:btn];
//        UIImage *Img = [UIImage imageNamed:self.pictureArr[i]];
//        [btn setBackgroundImage:Img forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
//    }
//    
//    UIButton *cancleButton = [[UIButton alloc]init];
//    [shareView addSubview:cancleButton];
//    [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.mas_equalTo(shareView);
//        make.height.mas_equalTo(40);
//    }];
//    cancleButton.backgroundColor = [UIColor brownColor];
//    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
//    [cancleButton addTarget:self action:@selector(clickcancleButton) forControlEvents:UIControlEventTouchUpInside];
//}
//- (void)clickBtn{
//  [self.shareView removeFromSuperview];
//}
//- (void)clickcancleButton{
//    [self.shareView removeFromSuperview];
//}
//给个各控件赋值，并设置位置
- (void)setModel:(LSJTalkModel *)model{
    _model = model;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).offset(10);
    }];
    self.titleLabel.text = model.title;
    
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
    }];
    self.timeLabel.text = [NSString stringWithFormat:@"发布时间：%@",model.time];
    
    
    [self.lookNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(43);
        make.right.mas_equalTo(self.commentNum.mas_left).offset(-10);
    }];
    self.lookNum.text = [NSString stringWithFormat:@"查看：%@",model.lookNum];
    
    
    [self.commentNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.top.mas_equalTo(self.contentView).offset(43);
    }];
    self.commentNum.text = [NSString stringWithFormat:@"评价：%@",model.commentNum];
    
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
    }];
    self.content.numberOfLines = 0;
    self.content.text = model.content;
    

    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.content.mas_bottom).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    [self.shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [self.shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.shareButton.layer.cornerRadius = 5;
    self.shareButton.layer.masksToBounds = YES;
    
    [self.comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.content.mas_bottom).offset(60);
        make.left.mas_equalTo(self.contentView).offset(10);
    }];
    self.comment.text = @"评论";
    
    
    [self.contentField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.comment.mas_bottom).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(100);
    }];
    
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentField.mas_bottom).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    self.sendButton.layer.cornerRadius = 5;
    self.sendButton.layer.masksToBounds = YES;
    [self.sendButton setTitle:@"发表评论" forState:UIControlStateNormal];
    [self.sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
