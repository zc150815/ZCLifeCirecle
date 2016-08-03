//
//  LSJProductListModel.m
//  LifeCircle
//
//  Created by Ning Xie on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJProductListModel.h"

@implementation LSJProductListModel
+(NSArray *)LSJProductListModelWithPlistName:(NSString *)plistName;
{
    NSString *path = [[NSBundle mainBundle]pathForResource:plistName ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        LSJProductListModel *model = [LSJProductListModel LSJProductListModelWithDic:obj];
        
        [arrayM addObject:model];
        
    }];
    
    return arrayM.copy;
    
}

+(instancetype)LSJProductListModelWithDic:(NSDictionary *)dic
{
    LSJProductListModel *model = [[LSJProductListModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
