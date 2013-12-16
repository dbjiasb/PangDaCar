//
//  TuInfo.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-24.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TuInfo.h"

@implementation TuInfo

- (void)dealloc
{
    self.uuid = nil;
    self.tu_id = nil;
    self.tu_label = nil;
    self.veh_no = nil;
    self.engine_no = nil;
    self.frame_no = nil;
    self.manufacturer_code = nil;
    self.vehicle_type = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    self.uuid = ISNULL([dic objectForKey:@"uuid"]) ? @"0" : [dic objectForKey:@"uuid"] ;
    self.tu_id = ISNULL([dic objectForKey:@"tu_id"]) ? @"" : [dic objectForKey:@"tu_id"] ;
    self.tu_label = ISNULL([dic objectForKey:@"tu_label"]) ? @"" : [dic objectForKey:@"tu_label"] ;
    self.veh_no = ISNULL([dic objectForKey:@"veh_no"]) ? @"" : [dic objectForKey:@"veh_no"] ;
    self.engine_no = ISNULL([dic objectForKey:@"engine_no"]) ? @"" : [dic objectForKey:@"engine_no"] ;
    self.frame_no = ISNULL([dic objectForKey:@"frame_no"]) ? @"" : [dic objectForKey:@"frame_no"] ;
    self.manufacturer_code = ISNULL([dic objectForKey:@"manufacturer_code"]) ? @"" : [dic objectForKey:@"manufacturer_code"] ;
    self.vehicle_type = ISNULL([dic objectForKey:@"vehicle_type"]) ? @"" : [dic objectForKey:@"vehicle_type"] ;
    
}


@end
