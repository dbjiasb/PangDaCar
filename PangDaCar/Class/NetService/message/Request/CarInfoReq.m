//
//  CarInfoReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-3.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CarInfoReq.h"

@implementation CarInfoReq

- (Class) responseMsgClass
{
    return CarInfoResp.class;
    
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    
    return ret ;
    
}


@end
