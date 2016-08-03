//
//  LSJOneTableViewCell.m
//  LifeCircle
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJOneTableViewCell.h"




@implementation LSJOneTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    
    
    
    return self;
}
//-(void)setControll:(LSJCollectionViewController *)controll{
//
//    _controll = controll;
//    
//    [self addSubview:controll.collectionView];
//
//}

@end
