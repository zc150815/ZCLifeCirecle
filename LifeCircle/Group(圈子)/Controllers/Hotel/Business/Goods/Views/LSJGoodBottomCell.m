//
//  LSJGoodBottomCell.m
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJGoodBottomCell.h"

@implementation LSJGoodBottomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconImg = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImg];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        

    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
