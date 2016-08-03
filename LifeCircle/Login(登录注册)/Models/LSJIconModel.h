//
//  LSJIconModel.h
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSJIconModel : UIButton
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *title;

+ (instancetype)iconWithDict:(NSDictionary *)dict;
@end
