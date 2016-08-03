//
//  LSJCommentTableViewCell.m
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJCommentTableViewCell.h"
@interface LSJCommentTableViewCell()
@property (nonatomic, weak) UILabel *commentTime;
@property (nonatomic, weak) UILabel *commentContent;
@end
@implementation LSJCommentTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *commentTime = [[UILabel alloc]init];
        self.commentTime = commentTime;
        [self.contentView addSubview:commentTime];
        
        UILabel *commentContent = [[UILabel alloc]init];
        self.commentContent = commentContent;
        [self.contentView addSubview:commentContent];
    }
    return self;
}

- (void)setModel:(LSJTalkModel *)model{
    _model = model;
    [self.commentTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.left.mas_equalTo(self.contentView).offset(10);
    }];
    self.commentTime.text = [NSString stringWithFormat:@"我是张三   %@",model.time];
    
    [self.commentContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.commentTime.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.contentView).offset(-10);
    }];
    self.commentContent.text = model.comment;
    self.commentContent.numberOfLines = 0;
    self.commentContent.font = [UIFont systemFontOfSize:10];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
