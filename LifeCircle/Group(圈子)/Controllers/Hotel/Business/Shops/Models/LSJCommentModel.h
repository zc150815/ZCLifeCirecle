//
//  LSJCommentModel.h
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJCommentModel : NSObject

@property(nonatomic,copy)NSString *score;
@property(nonatomic,copy)NSString *comment;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *time;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)commentModelWithDict:(NSDictionary*)dict;
@end
