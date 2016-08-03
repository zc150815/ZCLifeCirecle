//
//  LSJGoodMiddleCell.m
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJGoodMiddleCell.h"
@interface LSJGoodMiddleCell()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UIButton *addressBtn;
@property (nonatomic, weak) UIButton *phoneBtn;
@end
@implementation LSJGoodMiddleCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc]init];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];

        UIButton *addressBtn = [[UIButton alloc]init];
        self.addressBtn = addressBtn;
        [self.contentView addSubview:addressBtn];
        
        UIView *lineView = [[UIView alloc]init];
        self.lineView = lineView;
        [self.contentView addSubview:lineView];
        
        UIButton *phoneBtn = [[UIButton alloc]init];
        self.phoneBtn = phoneBtn;
        [self.contentView addSubview:phoneBtn];
        
    }
    return self;
}

- (void)setModel:(LSJGoodsModel *)model{
    _model = model;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentView).offset(10);
    }];
    self.titleLabel.text = model.title;
    self.titleLabel.font = [UIFont systemFontOfSize:21];
    
    [self.addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(-10);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.right.mas_equalTo(self.lineView.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    [self.addressBtn setImage:[UIImage imageNamed:@"位置小图"] forState:UIControlStateNormal];
    [self.addressBtn setTitle:model.address forState:UIControlStateNormal];
    [self.addressBtn setTitleColor:[UIColor colorWithRed:253.0/255 green:182.0/255 blue:45.0/255 alpha:1.0] forState:UIControlStateNormal];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(-5);
        make.right.mas_equalTo(self.phoneBtn.mas_left).offset(-10);
        make.left.mas_equalTo(self.addressBtn.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(1, 30));
    }];
    self.lineView.backgroundColor = [UIColor colorWithRed:237.0/255 green:237.0/255 blue:237.0/255 alpha:1.0];

    
    [self.phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).offset(-10);
        make.right.mas_equalTo(self.contentView).offset(-10);
        make.left.mas_equalTo(self.lineView.mas_right).offset(10);
    }];
    [self.phoneBtn setImage:[UIImage imageNamed:@"电话"] forState:UIControlStateNormal];
    [self.phoneBtn setTitle:model.phone forState:UIControlStateNormal];
    [self.phoneBtn setTitleColor:[UIColor colorWithRed:253.0/255 green:182.0/255 blue:45.0/255 alpha:1.0] forState:UIControlStateNormal];
    [self.phoneBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickBtn{
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://15971504654"]];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
