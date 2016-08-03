//
//  LSJGroupCircleModel.m
//  LifeCircle
//
//  Created by ios on 16/7/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJGroupCircleModel.h"

#import <AFNetworking.h>

@implementation LSJGroupCircleModel

+(instancetype)GroupCircleModelWithDict:(NSDictionary *)dict{


    LSJGroupCircleModel *model = [[LSJGroupCircleModel alloc]init];
    
    model.ID = dict[@"id"];
    
    model.title = dict[@"title"];
    
    model.cover = dict[@"cover"];
    
    return model;


}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
+(NSArray *)GroupCircleModelWithPlistName:(NSString *)plistName{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:plistName ofType:nil];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrayM =[NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        LSJGroupCircleModel *model = [LSJGroupCircleModel GroupCircleModelWithDict:obj];
        
        [arrayM addObject:model];
    }];
    
    return arrayM;
}

@end





