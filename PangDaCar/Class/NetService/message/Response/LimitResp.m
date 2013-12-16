
//
//  LimitResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-9.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "LimitResp.h"

@implementation LimitResp

- (id)init
{
    if (self = [super init]) {
        
        self.limit_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.limit_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *data = [dic objectForKey:@"resp_data"];
    self.limit_num =  ISNULL([data objectForKey:@"limit_num"]) ? 0 : [[data objectForKey:@"limit_num"] integerValue];

    NSArray *list = [data objectForKey:@"limit_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        self.limit_list = list;
//        for (int i = 0; i < [list count]; i++) {
//            NSDictionary *itemDic = list[i];
//            if (!ISNULL(itemDic))
//            {
//                CarShopItem *car = [[[CarShopItem alloc] init] autorelease];
//                
//                [car fillFromDictionary:itemDic];
//                
//                [self.car_list addObject:car];
//            }
//        }
    }
    
}

@end
