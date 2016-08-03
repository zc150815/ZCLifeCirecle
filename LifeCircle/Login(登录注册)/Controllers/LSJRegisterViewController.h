//
//  LSJRegisterViewController.h
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSJRegisterViewController : UIViewController
@property (nonatomic, copy) void(^sendUpBlock)(NSString *account, NSString *password);
@end
