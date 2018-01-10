//
//  XWDAFNManager.h
//  AFNetworkingDemo
//
//  Created by Rui on 16/12/13.
//  Copyright © 2016年 Rui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#define kTimeOutInterval 30
typedef void (^SuccessBlock)(NSDictionary *data);
typedef void (^FailBlock)(NSError *error);
@interface XWDAFNManager : NSObject

+(AFHTTPSessionManager *)manager;
//请求数据
+ (void)getWithUrlStr:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(SuccessBlock)success fail:(FailBlock)fail;

+ (void)postWithUrlStr:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(SuccessBlock)success fail:(FailBlock)fail;
/*
 下载
 */
+ (void)downLoadWithUrlString:(NSString *)urlString success:(SuccessBlock)success fail:(FailBlock)fail;
/*
 上传表单
 */
+ (void)uploadWithPath:(NSString *)urlString parameters:(NSDictionary *)parameters content:(NSString *)content upImg:(NSString *)upImg audioPath:(NSString *)audioPath success:(SuccessBlock)success fail:(FailBlock)fail;

- (void)AFNetworkStatus;





@end
