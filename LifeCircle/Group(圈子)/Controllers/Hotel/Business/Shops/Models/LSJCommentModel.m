//
//  LSJCommentModel.m
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJCommentModel.h"

@implementation LSJCommentModel

-(instancetype)initWithDict:(NSDictionary*)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)commentModelWithDict:(NSDictionary*)dict{
    
    return [[self alloc]initWithDict:dict];
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{



}

@end
