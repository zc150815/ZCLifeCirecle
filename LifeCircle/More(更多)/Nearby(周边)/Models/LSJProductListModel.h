//
//  LSJProductListModel.h
//  LifeCircle
//
//  Created by Ning Xie on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJProductListModel : NSObject

@property (copy, nonatomic) NSString *iconName;

@property (copy, nonatomic) NSString *groupName;

@property (copy, nonatomic) NSString *kindName;


//省份
@property (copy, nonatomic) NSString *name;
//城市
@property (copy, nonatomic) NSString *cities;

+(NSArray *)LSJProductListModelWithPlistName:(NSString *)plistName;

@end
