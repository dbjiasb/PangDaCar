//
//  LoginResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "LoginResp.h"

@implementation LoginResp

- (void)dealloc
{
    self.access_token = nil;
    self.uuid = nil;
    self.tuid = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic {
    
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_content"];

    self.access_token =  ISNULL([tem1 objectForKey:@"access_token"]) ? @"" : [tem1 objectForKey:@"access_token"];
    self.uuid = ISNULL([tem1 objectForKey:@"uuid"]) ? @"" : [tem1 objectForKey:@"uuid"];
    self.tuid = ISNULL([tem1 objectForKey:@"tuid"]) ? @"" : [tem1 objectForKey:@"tuid"];
    
//    NSDictionary *tem2 = [tem1 objectForKey:@"protected"];
//    
//    if (!ISNULL(tem2))
//    {
//        self.userInfo = [[[UserInfo alloc] init] autorelease];
//        [self.userInfo fillFromDictionary:tem2];
//    }

}

@end
