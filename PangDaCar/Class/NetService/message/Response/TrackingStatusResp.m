//
//  TrackingStatusResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TrackingStatusResp.h"

@implementation TrackingStatusResp


- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    if ([tem1 isKindOfClass:[NSDictionary class]])
    {
        self.veh_tracking_id = ISNULL([tem1 objectForKey:@"veh_tracking_id"]) ? @"" : [tem1 objectForKey:@"veh_tracking_id"];
        self.status = ISNULL([tem1 objectForKey:@"status"]) ? @"" : [tem1 objectForKey:@"status"];
        self.start_time = ISNULL([tem1 objectForKey:@"start_time"]) ? @"" : [tem1 objectForKey:@"start_time"];
        
        if (self.start_time.length == [@"2013-10-29 21:03:12.0" length] ) {
            self.start_time = [self.start_time substringToIndex:self.start_time.length - 2];
        }
    }
    
    
    
}


@end
