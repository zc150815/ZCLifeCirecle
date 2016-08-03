//
//  LSJNewsModel.h
//  LifeCircle
//
//  Created by Ning Xie on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJNewsModel : NSObject

@property (copy, nonatomic) NSString *ID;

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *cover;

@property (copy, nonatomic) NSString *targetVC;


+(NSArray *)setupNewsModelWithPlistName:(NSString *)plistName;


@end
