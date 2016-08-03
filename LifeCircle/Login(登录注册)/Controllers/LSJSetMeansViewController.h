//
//  LSJSetMeansViewController.h
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSJSetMeansViewController : UIViewController

@property (copy, nonatomic) void (^alterMeansBlock)(NSString *phoneNum,NSString *name);

@end
