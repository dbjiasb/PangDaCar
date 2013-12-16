//
//  SafeCodeReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "SafeCodeReq.h"

@implementation SafeCodeReq

- (Class) responseMsgClass
{
    return SafeCodeResp.class;
}



- (void)dealloc
{
    self.tuid = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"tuid",nil]]];
    
    return ret ;
    
}


@end
