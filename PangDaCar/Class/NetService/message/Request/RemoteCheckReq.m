//
//  RemoteCheckReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RemoteCheckReq.h"

@implementation RemoteCheckReq

- (id)init
{
    if (self = [super init])
    {
        self.start = @"0";
        self.rows = @"30";
        self.type = @"0";
        
    }
    
    return self;
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"start",@"rows",@"type",nil]]];
    
    return ret ;
    
}

- (Class) responseMsgClass
{
    return RemoteCheckResp.class;
}

@end
