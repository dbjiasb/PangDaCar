//
//  MaintainSettingResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "MaintainSettingResp.h"

@implementation MaintainSettingResp

- (void)dealloc
{
    self.record_timestamp = nil;
    
    self.time_interval = nil;
    
    self.mileage_interval = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    if (ISNULL(dic)) {
        return;
    }
    
    [super fillFromDictionary:dic];
    
    NSDictionary *dataDic = ISNULL([dic objectForKey:@"resp_data"]) ? nil : [dic objectForKey:@"resp_data"];
    
    self.record_timestamp = ISNULL([dataDic objectForKey:@"record_timestamp"]) ? @"" : [dataDic objectForKey:@"record_timestamp"];
    self.time_interval = ISNULL([dataDic objectForKey:@"time_interval"]) ? @"" : [dataDic objectForKey:@"time_interval"];
    self.mileage_interval = ISNULL([dataDic objectForKey:@"mileage_interval"]) ? @"" : [dataDic objectForKey:@"mileage_interval"];
}

@end
