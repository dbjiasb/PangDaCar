//
//  TrackingStatusSettingResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TrackingStatusSettingResp.h"

@implementation TrackingStatusSettingResp

- (void)dealloc
{
    self.veh_tracking_id = nil;
    
    [super dealloc];
}


- (void)fillFromDictionary:(NSDictionary *)dic {
    
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    if (!ISNULL([tem1 objectForKey:@"veh_tracking_id"])) {
        
        self.veh_tracking_id = [tem1 objectForKey:@"veh_tracking_id"];
    }
    else
    {
        self.veh_tracking_id = @"";
    }
    
}

@end
