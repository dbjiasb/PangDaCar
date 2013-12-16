//
//  MyDefaults.h
//  Chinatsp
//
//  Created by Bolu Lv on 13-3-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDefaults : NSObject

+ (BOOL)isLogin;

+ (void)setCityName:(NSString *)cityName;
+(NSString *)getCityName;

+ (void)setCityID:(NSString *)cityID;
+(NSString *)getCityID;

+(void)setUserName:(NSString *)username;
+(NSString *)getUserName;
+(void)removeUserName;

+(void)setPwd:(NSString *)pwd;
+(NSString *)getPwd;
+(void)setTuid:(NSString *)tuid;
+(NSString *)getTuid;
+ (void)removeTuid;

+(void)setToken:(NSString *)token;
+(NSString *)getToken;
+ (void)removeToken;

+(BOOL)firstStart;
+ (void)setFirstStart;

@end
