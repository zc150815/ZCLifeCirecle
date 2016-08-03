//
//  LSJNetNewsModel.h
//  LifeCircle
//
//  Created by Ning Xie on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJNetNewsModel : NSObject
// 新闻标题
@property (nonatomic,copy) NSString *title;
/// 新闻图标
@property (nonatomic,copy) NSString *imgsrc;
// 新闻内容
@property (copy, nonatomic) NSString *digest;

//新闻详情
@property (copy, nonatomic) NSString *url_3w;
/// 新闻来源
@property (nonatomic,copy) NSString *source;
/// 新闻回复数
@property (nonatomic,strong) NSNumber *replyCount;
/// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
/// 大图标记
@property (nonatomic, assign) BOOL imgType;

//新闻时间
@property (copy, nonatomic) NSString *ptime;



+(void)downloadNewsWithUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *array))successBlock failBlock:(void (^)(NSError *error))failBlock;
@end
