//
//  LSJShopCell.h
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LSJShopModel.h"

@interface LSJShopCell : UITableViewCell
@property (strong, nonatomic) LSJShopModel *shopModel;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (copy, nonatomic) void(^shareBlock)();

@end
