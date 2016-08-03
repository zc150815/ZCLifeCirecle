//
//  LSJShopModel.h
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJShopModel : NSObject

@property(nonatomic,copy)NSString *intro;
@property(nonatomic,copy)NSString *lon;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *server;
@property(nonatomic,copy)NSString *lat;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *score;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *shop_id;
//商品数组
@property(nonatomic,strong)NSArray *goods;
//评论数组
@property(nonatomic,strong)NSArray *comment_list;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)shopModelWithDict:(NSDictionary*)dict;

@end
