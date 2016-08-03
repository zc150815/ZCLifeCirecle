//
//  LSJShopModel.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJShopModel.h"

#import "LSJGoodsModel.h"

#import "LSJCommentModel.h"

@implementation LSJShopModel

-(instancetype)initWithDict:(NSDictionary*)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)shopModelWithDict:(NSDictionary*)dict{


    return [[self alloc]initWithDict:dict];

}
-(void)setGoods:(NSArray *)goods{
    
    NSMutableArray *arrayM = [NSMutableArray array];
   
    for (NSDictionary *dict in goods) {
        
        LSJGoodsModel *goodsModel = [LSJGoodsModel goodsModelWithDict:dict];
        [arrayM addObject:goodsModel];
    }
   
    _goods = arrayM.copy;
    
    
    
}
-(void)setComment_list:(NSArray *)comment_list{

    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in comment_list) {
        LSJCommentModel *commentModel = [LSJCommentModel commentModelWithDict:dict];
        
        [arrayM addObject:commentModel];
    }
    
    _comment_list = arrayM.copy;
    

}

@end
