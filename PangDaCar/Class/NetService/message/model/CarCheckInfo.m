//
//  CarCheckInfo.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CarCheckInfo.h"

@implementation CarCheckInfo

- (void)dealloc
{
    self.engine_status = nil;
    self.abs_status = nil;
    self.tcs_esp_status = nil;
    self.eps_status = nil;
    self.tpms_status = nil;
    self.diagnosis_time = nil;
    
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    if (ISNULL(dic)) {
        return;
    }
    
    
    self.engine_status = ISNULL([dic objectForKey:@"engine_status"]) ? @"" : [dic objectForKey:@"engine_status"];
    self.abs_status = ISNULL([dic objectForKey:@"abs_status"]) ? @"" : [dic objectForKey:@"abs_status"];
    self.tcs_esp_status = ISNULL([dic objectForKey:@"tcs_esp_status"]) ? @"" : [dic objectForKey:@"tcs_esp_status"];
    self.eps_status = ISNULL([dic objectForKey:@"eps_status"]) ? @"" : [dic objectForKey:@"eps_status"];
    self.tpms_status = ISNULL([dic objectForKey:@"tpms_status"]) ? @"" : [dic objectForKey:@"tpms_status"];
    self.diagnosis_time = ISNULL([dic objectForKey:@"diagnosis_time"]) ? @"" : [dic objectForKey:@"diagnosis_time"];
    
}

@end
