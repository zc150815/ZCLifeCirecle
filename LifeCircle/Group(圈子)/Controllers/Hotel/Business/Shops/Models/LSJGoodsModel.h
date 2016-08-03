//
//  LSJGoodsModel.h
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJGoodsModel : NSObject

@property(nonatomic,copy)NSString *shop_id;
@property(nonatomic,strong)NSArray *goods_list;
@property(nonatomic,copy)NSString *lon;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *shop_name;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *lat;
@property(nonatomic,copy)NSString *goods_anapshot_id;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *content;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)goodsModelWithDict:(NSDictionary*)dict;

@end
