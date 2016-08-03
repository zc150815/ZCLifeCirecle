//
//  LSJTalkCell.h
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSJTalkModel.h"
@interface LSJTalkCell : UITableViewCell
@property (nonatomic, strong) LSJTalkModel *model;
@property (nonatomic, weak) UIButton *shareButton;
@property (nonatomic, strong) NSArray *pictureArr;
@property (nonatomic, weak) UIButton *sendButton;
@property (nonatomic, weak) UIView *shareView;
@end
