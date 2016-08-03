//
//  LSJEvaluateCell.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJEvaluateCell.h"
#import <Masonry.h>
#import "LSJTalkTableViewController.h"
@interface LSJEvaluateCell()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UILabel *contentLabel;
@end
@implementation LSJEvaluateCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc]init];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];
        
        UILabel *timeLabel = [[UILabel alloc]init];
        self.timeLabel = timeLabel;
        [self.contentView addSubview:timeLabel];
        
        UILabel *contenLabel = [[UILabel alloc]init];
        contenLabel.numberOfLines = 0;
        self.contentLabel = contenLabel;
        [self.contentView addSubview:contenLabel];
        
        UIButton *lookButton = [[UIButton alloc]init];
        
        [lookButton setTitle:@"查看" forState:UIControlStateNormal];
        
        [lookButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        lookButton.backgroundColor = [UIColor colorWithRed:0 green:153.0/255 blue:255.0/255 alpha:1.0];
        
        self.lookButton = lookButton;
        
        lookButton.layer.cornerRadius = 10;
        
        lookButton.layer.masksToBounds = YES;
        
        [self.contentView addSubview:lookButton];
        
    }
    return self;
}

- (void)setModel:(LSJEvaluateModel *)model{
    
    _model = model;
    
 [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.left.mas_equalTo(self.contentView).offset(10);
     make.size.mas_equalTo(CGSizeMake(200, 20));
 }];
    
    self.titleLabel.text = model.title;
    
 [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.mas_equalTo(self.contentView).offset(10);
     make.right.mas_equalTo(self.contentView).offset(-10);
     make.size.mas_equalTo(CGSizeMake(150, 20));
    }];
    
    self.timeLabel.text = model.time;
    
 [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
     make.left.mas_equalTo(self.contentView).offset(10);
     make.right.mas_equalTo(self.contentView).offset(-10);
    }];
    
    self.contentLabel.text = model.content;
    
 [self.lookButton mas_makeConstraints:^(MASConstraintMaker *make) {
     
     make.right.bottom.mas_equalTo(self.contentView).offset(-10);
     
     make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
     
     make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
}
- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
