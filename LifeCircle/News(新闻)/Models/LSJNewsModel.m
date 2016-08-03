//
//  LSJNewsModel.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNewsModel.h"

@implementation LSJNewsModel

+(instancetype)initNewsModelWithDic:(NSDictionary *)dic
{
    LSJNewsModel *model = [[LSJNewsModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+(NSArray *)setupNewsModelWithPlistName:(NSString *)plistName
{
    NSString *path = [[NSBundle mainBundle]pathForResource:plistName ofType:nil];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        LSJNewsModel *model = [LSJNewsModel initNewsModelWithDic:obj];
        
        [arrayM addObject:model];
        
        
    }];
    return arrayM.copy;
}
@end
