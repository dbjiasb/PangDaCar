//
//  UserInfoReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-3.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UserInfoReq.h"
#import "UserInfo.h"

@implementation UserInfoReq

- (Class) responseMsgClass
{
    return UserInfoResp.class;
}

- (void)dealloc
{
    
    self.userInfo = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    if(![self.method isEqualToString:@"GET"])
    {
        [ret addEntriesFromDictionary:[self.userInfo dictionary]];
    }
    
    return ret ;
    
}

@end
