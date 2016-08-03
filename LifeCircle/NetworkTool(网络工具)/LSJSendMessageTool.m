//
//  LSJSendMessageTool.m
//  LifeCircle
//
//  Created by ios on 16/8/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LSJSendMessageTool.h"

#import <AFNetworking.h>

#import "NSString+Hash.h"

@implementation LSJSendMessageTool

static id _instanceType;
+(instancetype)sharedLSJSendMessage{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instanceType = [[self alloc]init];
    });

    return _instanceType;
}

-(void)sendMessageWithPhoneNumber:(NSString *)phoneNumber andsucceedBlock:(void (^)(NSString *verification))succeedBlock andfailureBlock:(void (^)(NSError *error))failureBlock{
    
    
    //获取一个4位数的随机数
    int numeber = arc4random_uniform(8999) + 1000;
    
    NSString *numberStr = [NSString stringWithFormat:@"%d",numeber];
    
    NSString *account = @"cf_wwwh";
    
    NSString * apiKey= @"de77de387ec67a178ae314d69c15ca04";
    
    //手机号
    NSString *mobile = [NSString stringWithFormat:@"%@",phoneNumber];
    
    NSString *content = [NSString stringWithFormat:@"您的验证码是：%@。请不要把验证码泄露给其他人。",numberStr];
    
    NSDate *currentDate = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyMMddHHmmss"];
    
    //当前系统时间
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    NSMutableString *password = [NSMutableString string];
    
    [password appendString:account];
    
    [password appendString:apiKey];
    
    [password appendString:mobile];
    
    [password appendString:content];
    
    [password appendString:dateString];
    
    NSString *passwordMd5 = [password md5String];
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    //    manger.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    
    NSString *urlStr = @"https://106.ihuyi.com/webservice/sms.php?method=Submit";
    
    NSDictionary *dict = @{
                           @"method":@"Submit",
                           @"account":account,
                           @"password":passwordMd5,
                           @"mobile":mobile,
                           @"content":content,
                           @"time":dateString
                           };
    
    
    [manger POST:urlStr parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error.code != -1016) {
            if (failureBlock) {
                failureBlock(error);
            }
        }
        if (succeedBlock) {
            succeedBlock(numberStr);
        }

        
    }];

    

}
@end
