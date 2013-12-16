//
//  PeccancyCarsResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-28.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PeccancyCarsResp.h"

@implementation PeccancyCarsResp

- (id)init
{
    if (self = [super init]) {
        
        self.veh_list = [NSMutableArray array];
        self.carId = nil;
    }
    
    return self;
}

- (void)dealloc
{
    self.veh_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *data = [dic objectForKey:@"resp_data"];
    
    self.carId = ISNULL([data objectForKey:@"id"]) ? @0 : [NSNumber numberWithInt:[[data objectForKey:@"id"] integerValue]];
    
    self.veh_num =  ISNULL([data objectForKey:@"veh_num"]) ? 0 : [[data objectForKey:@"veh_num"] integerValue];
    
    NSArray *list = [data objectForKey:@"veh_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {

        for (int i = 0; i < [list count]; i++)
        {
            NSDictionary *itemDic = list[i];
            if (!ISNULL(itemDic))
            {
//                CarInfo *car = [[[CarInfo alloc] init] autorelease];
//                
//                [car fillFromDictionary:itemDic];
//                
//                [self.veh_list addObject:car];
            }
        }
    }
    
}


@end
