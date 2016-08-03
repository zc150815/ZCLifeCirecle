//
//  LSJTalkModel.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJTalkModel.h"

@implementation LSJTalkModel
+ (instancetype)LSJTalkModelWithDict:(NSDictionary *)dict{
    LSJTalkModel *model = [[LSJTalkModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
+ (NSArray *)TalkArr{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Talk.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
//    NSLog(@"%@",arr);
    NSMutableArray *arrM = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LSJTalkModel *model = [LSJTalkModel LSJTalkModelWithDict:obj];
        [arrM addObject:model];
    }];
    return arrM;
}
- (NSString *)description{
    return [NSString stringWithFormat:@"%@----",self.title];
}
@end
