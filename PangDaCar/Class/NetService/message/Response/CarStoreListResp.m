//
//  CarStoreListResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-1.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CarStoreListResp.h"
#import "CarShopItem.h"

@implementation CarStoreListResp

- (id)init
{
    if (self = [super init]) {
        
        self.car_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.car_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.car_num =  ISNULL([tem1 objectForKey:@"car_num"]) ? 0 : [[tem1 objectForKey:@"car_num"] integerValue];
    
    NSArray *list = [tem1 objectForKey:@"car_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        for (int i = 0; i < [list count]; i++) {
            NSDictionary *itemDic = list[i];
            if (!ISNULL(itemDic))
            {
                CarShopItem *car = [[[CarShopItem alloc] init] autorelease];
                
                [car fillFromDictionary:itemDic];
                
                [self.car_list addObject:car];
            }
        }
    }
    
}

@end
