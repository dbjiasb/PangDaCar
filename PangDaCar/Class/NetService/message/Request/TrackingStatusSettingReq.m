//
//  TrackingStatusSettingReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TrackingStatusSettingReq.h"

@implementation TrackingStatusSettingReq

- (id)init
{
    if (self = [super init]) {
        
        self.status = @"1";
        self.time_interval = @"30";
    }
    return self;
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"status",@"time_interval",nil]]];
    
    return ret ;
    
}


- (Class) responseMsgClass
{
    return TrackingStatusSettingResp.class;
}

@end
