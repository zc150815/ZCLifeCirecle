//
//  LSJTitleTableViewCell.h
//  LifeCircle
//
//  Created by Ning Xie on 16/7/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    RealtimeNews,
    PictureNews,
    VideoNews,
    BreakingNews
} NewsType;


@interface LSJTitleTableViewCell : UITableViewCell


@property (nonatomic, copy) void (^callBack) (NewsType type);

@end
