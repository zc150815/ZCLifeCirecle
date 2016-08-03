//
//  LSJGroupCircleModel.h
//  LifeCircle
//
//  Created by ios on 16/7/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJGroupCircleModel : NSObject

@property (copy, nonatomic) NSString *ID;

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *cover;

@property (copy, nonatomic) NSString *targetVC;


+(NSArray *)GroupCircleModelWithPlistName:(NSString *)plistName;

@end
