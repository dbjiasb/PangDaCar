//
//  UserIDReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-5.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UserIDReq.h"

@implementation UserIDReq

- (void)dealloc
{
    self.user_id = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    if(![self.method isEqualToString:@"GET"])
    {
        [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"user_id"]]];
    }
    
    return ret ;
    
}


- (Class) responseMsgClass
{
    return UserIDResp.class;
    
}


@end
