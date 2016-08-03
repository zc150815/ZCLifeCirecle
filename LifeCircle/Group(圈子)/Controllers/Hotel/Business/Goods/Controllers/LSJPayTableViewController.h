//
//  LSJPayTableViewController.h
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSJGoodsModel.h"
@interface LSJPayTableViewController : UITableViewController
@property (nonatomic, strong) LSJGoodsModel *model;
@property (nonatomic, copy) NSString *sumNum;
@property (nonatomic, copy) NSString *showNum;
@end
