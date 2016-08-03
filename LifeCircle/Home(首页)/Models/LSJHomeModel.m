//
//  LSJHomeModel.m
//  LifeCircle
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJHomeModel.h"

@implementation LSJHomeModel

+(instancetype)GroupCircleModelWithDict:(NSDictionary *)dict{
    
    
    LSJHomeModel *model = [[LSJHomeModel alloc]init];
    
    model.image = dict[@"image"];
    
    model.name = dict[@"name"];
    
    model.describe = dict[@"describe"];
    
    model.btnText = dict[@"btnText"];
    
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
        
        LSJHomeModel *model = [LSJHomeModel GroupCircleModelWithDict:obj];
        
        [arrayM addObject:model];
    }];
    
    return arrayM;
}
@end
