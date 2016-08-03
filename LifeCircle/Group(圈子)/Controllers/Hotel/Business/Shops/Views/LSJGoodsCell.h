//
//  LSJGoodsCell.h
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LSJGoodsModel.h"

@interface LSJGoodsCell : UITableViewCell

@property (strong, nonatomic) LSJGoodsModel *goodsModel;

@property (weak, nonatomic) UIButton *searchInfoBtn;

@end
