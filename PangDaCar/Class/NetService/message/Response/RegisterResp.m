//
//  RegisterResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RegisterResp.h"

@implementation RegisterResp

- (void)dealloc
{
    self.Uuuid = nil;
    self.password = nil;
    self.access_token = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic {
    
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.Uuuid =  ISNULL([tem1 objectForKey:@"uuuid"]) ? @"" : [tem1 objectForKey:@"uuuid"];
    self.password = ISNULL([tem1 objectForKey:@"password"]) ? @"" : [tem1 objectForKey:@"password"];
    self.access_token = ISNULL([tem1 objectForKey:@"access_token"]) ? @"" : [tem1 objectForKey:@"access_token"];
}

@end
