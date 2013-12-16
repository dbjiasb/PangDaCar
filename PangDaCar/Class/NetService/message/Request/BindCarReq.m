//
//  BindCarReq.m
//  Chinatsp
//
//  Created by yuante on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "BindCarReq.h"

@implementation BindCarReq

- (void)dealloc
{
    self.verify_code = nil;
    self.password = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    if ([self.method isEqualToString:@"DELETE"])
    {
        [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"verify_code",nil]]];
    }
    else
    {
        [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"verify_code",nil]]];
    }
    
    return ret ;
    
}

- (Class) responseMsgClass
{
    return RegisterResp.class;
}


@end
