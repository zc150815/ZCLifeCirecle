//
//  LSJTalkModel.h
//  LifeCircle
//
//  Created by ios on 16/7/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJTalkModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *lookNum;
@property (nonatomic, copy) NSString *commentNum;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *comment;
+ (NSMutableArray *)TalkArr;
@end
