//
//  DashBoardResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "DashBoardResp.h"

@implementation DashBoardResp

- (id)init
{
    if (self = [super init]) {
        
        self.dashboard_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.dashboard_list = nil;
    self.dashboard_content = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    id data = [dic objectForKey:@"resp_data"];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        self.dashboard_content = ISNULL(data[@"dashboard_content"]) ? @"" : data[@"dashboard_content"];
        
        self.dashboard_num =  ISNULL([data objectForKey:@"dashboard_num"]) ? 0 : [[data objectForKey:@"dashboard_num"] integerValue];
        
        NSArray *list = [data objectForKey:@"dashboard_list"];
        if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
        {
            self.dashboard_list = list;
            
        }
    }
    
    
}


@end
