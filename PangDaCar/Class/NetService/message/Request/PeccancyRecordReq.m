//
//  PeccancyRecordReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-29.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PeccancyRecordReq.h"

@implementation PeccancyRecordReq

- (Class) responseMsgClass
{
    return PeccancyRecordResp.class;
    
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"imei"]]];
    if(self.imgcode)
    {
        [ret setObject:self.imgcode forKey:@"imgcode"];
    }
    
    if (self.cookie) {
        [ret setObject:self.cookie forKey:@"cookie"];
    }
    
    return ret ;
    
}


@end
