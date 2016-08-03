//
//  LSJHomeModel.h
//  LifeCircle
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJHomeModel : NSObject

@property (copy, nonatomic) NSString *image;

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *describe;

@property (copy, nonatomic) NSString *btnText;

+(NSArray *)GroupCircleModelWithPlistName:(NSString *)plistName;
@end
