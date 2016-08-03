//
//  LSJTwoTableViewCell.m
//  LifeCircle
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJTwoTableViewCell.h"
#import "LSJTwoCollectionView.h"
#import <Masonry.h>
@implementation LSJTwoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
   
        
        LSJTwoCollectionView *twoCollectionView = [[LSJTwoCollectionView alloc] init];
        
      
        
        twoCollectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:twoCollectionView];
        
        [twoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.right.equalTo(self).offset(0);
            make.top.equalTo(self).offset(0);
            make.bottom.equalTo(self).offset(0);
        }];
        
        
    }
    return self;
}
@end
