//
//  FavorableResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "DealResp.h"
#import "Information.h"

@implementation DealResp

- (id)init
{
    if (self = [super init]) {
        
        self.deals_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.deals_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *data = [dic objectForKey:@"resp_data"];
    self.deals_num =  ISNULL([data objectForKey:@"deals_num"]) ? 0 : [[data objectForKey:@"deals_num"] integerValue];
    
    NSArray *list = [data objectForKey:@"deals_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        for (int i = 0; i < [list count]; i++) {
            NSDictionary *itemDic = list[i];
            if (!ISNULL(itemDic))
            {
                Information *info = [[[Information alloc] init] autorelease];
                
                [info fillFromDictionary:itemDic];
                
                [self.deals_list addObject:info];
            }
        }
    }
    
}


@end
