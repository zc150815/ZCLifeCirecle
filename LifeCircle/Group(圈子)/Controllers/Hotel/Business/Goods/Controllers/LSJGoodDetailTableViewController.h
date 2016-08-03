//
//  LSJGoodDetailTableViewController.h
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSJGoodsModel.h"
#import "LSJShopModel.h"
@interface LSJGoodDetailTableViewController : UITableViewController
@property (nonatomic, strong) LSJGoodsModel *model;
@property (nonatomic, strong) LSJShopModel *shopModel;
@end
