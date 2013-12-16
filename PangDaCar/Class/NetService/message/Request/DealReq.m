//
//  FavorableReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "DealReq.h"

@implementation DealReq

- (id)init
{
    if (self = [super init])
    {
        self.start = @"0";
        self.rows = @"10";
        self.type = @"0";
    }

    return self;
}


- (void)dealloc
{
    
    self.start = nil;
    self.rows = nil;
    self.type = nil;
    
    [super dealloc];
}

- (Class) responseMsgClass
{
    return DealResp.class;
    
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic addEntriesFromDictionary:[super dictionary]];
    
 
    [dic addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"start",@"rows",@"type"]]];
    
    return dic;
}

@end
