//
//  LoginReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "LoginReq.h"
#import "LoginResp.h"

@implementation LoginReq

- (void)dealloc
{
    self.uuid = nil;
    self.password = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    if ([self.method isEqualToString:@"POST"] )
    {
        [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"uuid",@"password",nil]]];
    }
    
    return ret ;
    
}

- (Class) responseMsgClass
{
    return LoginResp.class;
}

@end
