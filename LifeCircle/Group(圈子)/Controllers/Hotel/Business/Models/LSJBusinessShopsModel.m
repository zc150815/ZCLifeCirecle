//
//  LSJBusinessShopsModel.m
//  LifeCircle
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJBusinessShopsModel.h"

@implementation LSJBusinessShopsModel

+(instancetype)BusinessShopsModelWithDict:(NSDictionary *)dict{
    
    
    LSJBusinessShopsModel *model = [[LSJBusinessShopsModel alloc]init];
    
    model.image = dict[@"image"];
    
    model.name = dict[@"name"];
    
    model.describe = dict[@"describe"];
    
    model.btnText = dict[@"btnText"];
    
    return model;
    
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
+(NSArray *)BusinessShopsModelWithPlistName:(NSString *)plistName{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:plistName ofType:nil];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *arrayM =[NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        LSJBusinessShopsModel *model = [LSJBusinessShopsModel BusinessShopsModelWithDict:obj];
        
        [arrayM addObject:model];
    }];
    
    return arrayM;
}


@end
