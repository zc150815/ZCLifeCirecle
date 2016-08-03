//
//  LSJIconModel.m
//  LifeCircle
//
//  Created by 刁 海瑞 on 16/7/30.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJIconModel.h"

@implementation LSJIconModel
+ (instancetype)iconWithDict:(NSDictionary *)dict{
    
    LSJIconModel *model = [[LSJIconModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    return model;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
