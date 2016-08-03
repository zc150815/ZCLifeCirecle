//
//  LSJInfoCell.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJInfoCell.h"
#import "Masonry.h"
@interface LSJInfoCell()
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIImageView *imgView;
@end
@implementation LSJInfoCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imgView = [[UIImageView alloc]init];
        self.imgView = imgView;
        [self addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(5);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(self.mas_height).offset(-10);
            make.width.equalTo(imgView.mas_height);
            
        }];
        
        UILabel *label = [[UILabel alloc]init];
        self.label = label;
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor colorWithRed:129.0/255 green:46.0/255 blue:21.0/255 alpha:1.0];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(5);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self.imgView.mas_left).offset(-30);
            make.bottom.equalTo(self).offset(-5);
        }];

      
        
    }
    
    return self;
}
- (void)setModel:(LSJHomeModel *)model{
    self.imgView.image = [UIImage imageNamed:model.image];
    self.label.text = model.name;
}
@end
