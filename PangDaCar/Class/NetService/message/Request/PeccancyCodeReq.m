//
//  PeccancyCodeReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-7.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PeccancyCodeReq.h"

@implementation PeccancyCodeReq

- (Class) responseMsgClass
{
    return PeccancyCodeResp.class;
    
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    

    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"imei"]]];
    
    return ret ;
    
}

@end
