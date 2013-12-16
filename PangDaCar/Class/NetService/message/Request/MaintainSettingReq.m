//
//  MaintainSettingReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "MaintainSettingReq.h"

@implementation MaintainSettingReq

- (id)init
{
    if (self = [super init])
    {
        self.time_interval = 6;
        self.mileage_interval = 2000;
        
    }
    
    return self;
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    if(![self.method isEqualToString:@"GET"])
    {
        [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"time_interval",@"mileage_interval",nil]]];
    }
    
    return ret ;
    
}

- (Class) responseMsgClass
{
    return MaintainSettingResp.class;
}



@end
