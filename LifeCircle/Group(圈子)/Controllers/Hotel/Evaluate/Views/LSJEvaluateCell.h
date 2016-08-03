//
//  LSJEvaluateCell.h
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSJEvaluateModel.h"
@interface LSJEvaluateCell : UITableViewCell
@property (nonatomic, strong) LSJEvaluateModel *model;
@property (nonatomic, weak) UIButton *lookButton;
@end
