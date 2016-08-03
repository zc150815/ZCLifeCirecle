//
//  LSJSendMessageTool.h
//  LifeCircle
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSJSendMessageTool : NSObject

+(instancetype)sharedLSJSendMessage;

-(void)sendMessageWithPhoneNumber:(NSString *)phoneNumber andsucceedBlock:(void (^)(NSString *verification))succeedBlock andfailureBlock:(void (^)(NSError *error))failureBlock;

@end
