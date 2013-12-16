//
//  CarPositionResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-7.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CarPositionResp.h"

@implementation CarPositionResp

- (void)dealloc
{
    self.lng = nil;
    self.lat = nil;
    self.speed = nil;
    self.heading = nil;
    self.coord_type = nil;
    self.accel = nil;
    self.pitch = nil;
    self.roll = nil;
    self.sat_num = nil;
    self.geo_info = nil;
    self.region = nil;
    self.province = nil;
    self.city = nil;
    self.sublocality = nil;
    self.post_address = nil;
    self.raw_address = nil;
    self.gps_timestamp = nil;
    self.record_timestamp = nil;

    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    if (!dic)
    {
        return;
    }
    
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    NSDictionary *current = [tem1 objectForKey:@"current"];
    if (current && [current isKindOfClass:[NSDictionary class]])
    {
        self.lng =  ISNULL([current objectForKey:@"lng"]) ? @"0" : [current objectForKey:@"lng"];
        self.lat =  ISNULL([current objectForKey:@"lat"]) ? @"0" : [current objectForKey:@"lat"];
        self.speed =  ISNULL([current objectForKey:@"speed"]) ? @"0" : [current objectForKey:@"speed"];
        self.heading =  ISNULL([current objectForKey:@"heading"]) ? @"0" : [current objectForKey:@"heading"];
        self.coord_type =  ISNULL([current objectForKey:@"coord_type"]) ? @"0" : [current objectForKey:@"coord_type"];
        self.accel =  ISNULL([current objectForKey:@"accel"]) ? @"0" : [current objectForKey:@"accel"];
        self.pitch =  ISNULL([current objectForKey:@"pitch"]) ? @"0" : [current objectForKey:@"pitch"];
        self.roll =  ISNULL([current objectForKey:@"roll"]) ? @"0" : [current objectForKey:@"roll"];
        self.sat_num =  ISNULL([current objectForKey:@"sat_num"]) ? @"0" : [current objectForKey:@"sat_num"];
        self.geo_info =  ISNULL([current objectForKey:@"geo_info"]) ? @"0" : [current objectForKey:@"geo_info"];
        self.region =  ISNULL([current objectForKey:@"region"]) ? @"0" : [current objectForKey:@"region"];
        self.province =  ISNULL([current objectForKey:@"province"]) ? @"0" : [current objectForKey:@"province"];
        self.city =  ISNULL([current objectForKey:@"city"]) ? @" " : [current objectForKey:@"city"];
        self.sublocality =  ISNULL([current objectForKey:@"sublocality"]) ? @"0" : [current objectForKey:@"sublocality"];
        self.post_address =  ISNULL([current objectForKey:@"post_address"]) ? @"0" : [current objectForKey:@"post_address"];
        self.raw_address =  ISNULL([current objectForKey:@"raw_address"]) ? @"0" : [current objectForKey:@"raw_address"];
        self.gps_timestamp =  ISNULL([current objectForKey:@"gps_timestamp"]) ? @"0" : [current objectForKey:@"gps_timestamp"];
        self.record_timestamp =  ISNULL([current objectForKey:@"record_timestamp"]) ? @"0" : [current objectForKey:@"record_timestamp"];

    }
    

}

@end
