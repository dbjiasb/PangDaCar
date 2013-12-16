//
//  PeccancyCarsReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-28.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PeccancyCarsReq.h"

@implementation PeccancyCarsReq

- (void)dealloc
{
    
    [super dealloc];
}

- (Class) responseMsgClass
{
    return PeccancyCarsResp.class;
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
//    if (self.car)
//    {
//        [ret addEntriesFromDictionary:[self.car dictionary]];
//    }
    [ret setObject:self.imei forKey:@"imei"];

    return ret ;
    
}

@end
