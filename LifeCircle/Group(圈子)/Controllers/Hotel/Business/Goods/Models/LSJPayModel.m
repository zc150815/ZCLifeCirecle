//
//  LSJPayModel.m
//  LifeCircle
//
//  Created by ios on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJPayModel.h"

@implementation LSJPayModel
+(instancetype)LSJTalkModelWithDict:(NSDictionary *)dict{
  LSJPayModel *model = [[LSJPayModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
+ (NSArray *)TalkArr{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Pay.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrM = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LSJPayModel *model = [LSJPayModel LSJTalkModelWithDict:obj];
        [arrM addObject:model];
    }];
    return arrM.copy;
}
- (NSString *)description{
    return [NSString stringWithFormat:@"%@----",self.title];
}

@end
