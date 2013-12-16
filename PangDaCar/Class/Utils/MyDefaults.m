//
//  MyDefaults.m
//  Chinatsp
//
//  Created by Bolu Lv on 13-3-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "MyDefaults.h"

@implementation MyDefaults

+ (BOOL)isLogin
{
    BOOL isLogin = NO;
    
    isLogin = [self getUserName] ? YES : NO;
    
    return isLogin;
}

+ (void)setCityName:(NSString *)cityName
{
    [[NSUserDefaults standardUserDefaults] setObject:cityName forKey:@"cityName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSString *)getCityName
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"cityName"];
}

+ (void)setCityID:(NSString *)cityID
{
    [[NSUserDefaults standardUserDefaults] setObject:cityID forKey:@"cityID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getCityID
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"cityID"];
}

+(void)removeUserName
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"UserName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)setUserName:(NSString *)username
{
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"UserName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getUserName
{
//    return [[NSUserDefaults standardUserDefaults] stringForKey:@"UserName"] ? [[NSUserDefaults standardUserDefaults] stringForKey:@"UserName"] : @"23285";
    NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:@"UserName"];
    
    if (userName.length == 0) {
        userName = nil;
    }
    return userName;
}

+(void)setPwd:(NSString *)pwd
{
    [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:@"Pwd"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getPwd
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"Pwd"];
}

+(void)setTuid:(NSString *)tuid
{
    [[NSUserDefaults standardUserDefaults] setObject:tuid forKey:@"TUID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getTuid
{
    NSString *tuid = [[NSUserDefaults standardUserDefaults] stringForKey:@"TUID"];
    
    return tuid;
}

+ (void)removeTuid
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"TUID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)setToken:(NSString *)token
{
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"Token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getToken
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"Token"];
}

+ (void)removeToken
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (BOOL)firstStart
{
    //获取start值，是NO就是第一次启动
    BOOL val = [[NSUserDefaults standardUserDefaults] boolForKey:@"Start"];
    return !val;
    
}

+ (void)setFirstStart
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Start"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
