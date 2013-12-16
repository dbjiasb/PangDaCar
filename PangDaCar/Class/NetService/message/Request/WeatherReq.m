//
//  WeatherReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-20.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "WeatherReq.h"

@implementation WeatherReq

- (id)init
{
    if (self = [super init]) {
        
        _city = @"北京";
        _mid = [OpenUDID value];
    }
    
    return self;
}

- (void)dealloc
{
    self.city = nil;
    self.mid = nil;
    self.startTime = nil;
    self.endTime = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"city"/*,@"mid"*/,@"endTime",@"startTime",nil]]];
    
    return ret ;
    
}

- (Class) responseMsgClass
{
    return WeatherResp.class;
}


@end
