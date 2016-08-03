//
//  LSJEvaluateModel.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJEvaluateModel.h"

@implementation LSJEvaluateModel
+ (instancetype)LSJEvaluateModelWithDict:(NSDictionary *)dict{
    LSJEvaluateModel *model = [[LSJEvaluateModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
+ (NSArray *)EvaluateArr{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Evaluate.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrM = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LSJEvaluateModel *model = [LSJEvaluateModel LSJEvaluateModelWithDict:obj];
        [arrM addObject:model];
    }];
    return arrM.copy;
}
@end
