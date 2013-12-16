//
//  HistoryPeccancyListResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "HistoryPeccancyListResp.h"
#import "PeccancyRecord.h"

@implementation HistoryPeccancyListResp

- (id)init
{
    if (self = [super init]) {
        
        self.peccancy_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.peccancy_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    if (tem1 && [tem1 isKindOfClass:[NSDictionary class]])
    {
        self.peccancy_num =  ISNULL([tem1 objectForKey:@"peccancy_num"]) ? 0 : [[tem1 objectForKey:@"peccancy_num"] integerValue];
        
        NSArray *list = [tem1 objectForKey:@"peccancy_list"];
        if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
        {
            for (int i = 0; i < [list count]; i++) {
                NSDictionary *itemDic = list[i];
                if (!ISNULL(itemDic))
                {
                    PeccancyRecord *record = [[[PeccancyRecord alloc] init] autorelease];
                    
                    [record fillFromDictionary:itemDic];
                    
                    [self.peccancy_list addObject:record];
                }
            }
        }
    }
    
}

@end
