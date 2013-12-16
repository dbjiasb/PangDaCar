//
//  PswModifyReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-3.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PswModifyReq.h"

@implementation PswModifyReq

- (void)dealloc
{
    self.old_pwd = nil;
    self.n_pwd = nil;
    
    [super dealloc];
}

- (Class) responseMsgClass
{
    return PswModifyResp.class;
    
}


- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"old_pwd",nil]]];
    
    [ret setObject:self.n_pwd forKey:@"new_pwd"];
    
    return ret ;
    
}


@end
