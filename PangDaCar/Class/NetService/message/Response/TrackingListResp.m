//
//  TrackingListResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TrackingListResp.h"
#import "TrackingRecord.h"

@implementation TrackingListResp

- (void)dealloc
{
    self.tracking_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.tracking_num = ISNULL([tem1 objectForKey:@"tracking_num"]) ? 0 : [[tem1 objectForKey:@"tracking_num"] integerValue];
    
    NSArray *list = [tem1 objectForKey:@"tracking_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        if (!self.tracking_list)
        {
            self.tracking_list = [NSMutableArray array];
        }

        for (NSDictionary *dic in list) {
            
            TrackingRecord *record = [[[TrackingRecord alloc] init] autorelease];
            [record fillFromDictionary:dic];
            
            [self.tracking_list addObject:record];
        }
    }
    
    
}


@end
