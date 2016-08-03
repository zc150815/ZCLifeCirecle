//
//  LSJGoodsModel.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJGoodsModel.h"

@implementation LSJGoodsModel

-(instancetype)initWithDict:(NSDictionary*)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)goodsModelWithDict:(NSDictionary*)dict{

    return [[self alloc]initWithDict:dict];

}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{



}

@end
