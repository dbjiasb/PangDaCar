//
//  FourSListResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-20.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "FourSListResp.h"
#import "FourSShop.h"

@implementation FourSListResp

- (id)init
{
    if (self = [super init]) {
        
        self.fourSList = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.fourSList = nil;
    self.fourSnum = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.fourSnum =  ISNULL([tem1 objectForKey:@"4snum"]) ? @"" : [tem1 objectForKey:@"4snum"];
    
    NSArray *list = [tem1 objectForKey:@"4slist"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        for (int i = 0; i < [list count]; i++) {
            NSDictionary *itemDic = list[i];
            if (!ISNULL(itemDic))
            {
                FourSShop *shop = [[[FourSShop alloc] init] autorelease];
                
                [shop fillFromDictionary:itemDic];
                
                [self.fourSList addObject:shop];
            }
        }
    }

}


@end
