//
//  CarControlReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CarControlReq.h"

@implementation CarControlReq


- (id)init
{
    if (self = [super init])
    {
        self.send_way = @"";
        self.type = @"";
        self.is_instant = @"1";
        self.content = @"";
        
        self.verify_code = @"";
        self.password = @"";
        
    }
    
    return self;
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"send_way",@"type",@"is_instant",@"content",@"verify_code",@"password",nil]]];
    
    return ret ;
    
}

- (Class) responseMsgClass
{
    return CarControlResp.class;
}


@end
