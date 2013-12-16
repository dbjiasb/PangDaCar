//
//  InvasionReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "InvasionReq.h"

@implementation InvasionReq


- (id)init
{
    if (self = [super init])
    {
        self.start = @"0";
        self.rows = @"10";
    }
    
    return self;
}


- (void)dealloc
{
    
    self.start = nil;
    self.rows = nil;
    
    [super dealloc];
}

- (Class) responseMsgClass
{
    return InvasionResp.class;
    
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic addEntriesFromDictionary:[super dictionary]];
    
    
    [dic addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"start",@"rows"]]];
    
    return dic;
}

@end
