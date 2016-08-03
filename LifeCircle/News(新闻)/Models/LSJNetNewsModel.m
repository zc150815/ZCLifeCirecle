//
//  LSJNetNewsModel.m
//  LifeCircle
//
//  Created by Ning Xie on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJNetNewsModel.h"
#import <AFNetworking.h>

@implementation LSJNetNewsModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
+(instancetype)NewsModelWithDic:(NSDictionary *)dic
{
    LSJNetNewsModel *model = [[LSJNetNewsModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

+(void)downloadNewsWithUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *array))successBlock failBlock:(void (^)(NSError *error))failBlock
{
    [[AFHTTPSessionManager manager]GET:urlstr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        
        NSString *key = dic.keyEnumerator.nextObject;
        
        NSArray *array = [dic objectForKey:key];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            LSJNetNewsModel *model = [LSJNetNewsModel NewsModelWithDic:obj];
            
            [arrayM addObject:model];
        }];
        
        if (successBlock) {
            successBlock(arrayM.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failBlock) {
            failBlock(error);
        }
        
    }];
    
    
}

@end
