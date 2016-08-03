//
//  LSJpushSetTableViewCell.m
//  LifeCircle
//
//  Created by mac on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJpushSetTableViewCell.h"
#import "LSJGroupCircleModel.h"
#import <Masonry.h>
@interface LSJpushSetTableViewCell ()
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UISwitch *rightSwitch;
@end

@implementation LSJpushSetTableViewCell


#pragma mark
#pragma mark - 重写 cell 的 init 方法,并在里面添加一个开关
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UISwitch *rightSwitch = [[UISwitch alloc]init];
        self.rightSwitch = rightSwitch;
        [self.contentView addSubview:rightSwitch];
       
        UILabel *titleLabel = [[UILabel alloc]init];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:self.titleLabel];
    }
    
    return self;
    
    
    
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
#pragma mark
#pragma mark - 重写 setModel 方法

-(void)setModel:(LSJGroupCircleModel *)model
{
    _model = model;
    self.titleLabel.text = model.title;
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.left.mas_equalTo(self.contentView).offset(10);
    }];
    [self.rightSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.contentView).offset(-20);
        make.centerY.mas_equalTo(self.contentView);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(60);
    }];
    
}
@end
