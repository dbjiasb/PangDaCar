//
//  CarConditionResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-17.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CarConditionResp.h"
#define File_Name @"carcondiction.json"

@implementation CarConditionResp

- (void)dealloc
{
    self.manufacturer_code = nil;
    
    
    [super dealloc];
}

+ (CarConditionResp *)getLocalCarCondiction
{
    
    CarConditionResp *resp = nil;
    
    //从本地获取
    NSString *file = [MyUtil getCachePath];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",file,File_Name]];
    if(dic)
    {
        resp = [[[CarConditionResp alloc] init] autorelease];
        NSString *tuid = [MyDefaults getTuid];
        
        [resp fillFromDictionary1:dic];

        if ([resp.tu_id isEqualToString:tuid])
        {
            return resp;
        }
        else
        {
            return nil;
        }
    }
    
    return resp;
}

- (void)fillFromDictionary1:(NSDictionary *)dic
{
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.manufacturer_code =  ISNULL([tem1 objectForKey:@"manufacturer_code"]) ? @"" : [tem1 objectForKey:@"manufacturer_code"];
    self.vehicle_type = ISNULL([tem1 objectForKey:@"vehicle_type"]) ? @"" : [tem1 objectForKey:@"vehicle_type"];
    self.tyre_temperature_warning = ISNULL([tem1 objectForKey:@"tyre_temperature_warning"]) ? @"" : [tem1 objectForKey:@"tyre_temperature_warning"];
    self.tyre_pressure_warning = ISNULL([tem1 objectForKey:@"tyre_pressure_warning"]) ? @"" : [tem1 objectForKey:@"tyre_pressure_warning"];
    self.tu_id = ISNULL([tem1 objectForKey:@"tu_id"]) ? @"" : [tem1 objectForKey:@"tu_id"];
    self.tyre_pressure = ISNULL([tem1 objectForKey:@"tyre_pressure"]) ? @"" : [tem1 objectForKey:@"tyre_pressure"];
    
    self.right_turn_signal_status = ISNULL([tem1 objectForKey:@"right_turn_signal_status"]) ? 0 : [[tem1 objectForKey:@"right_turn_signal_status"] integerValue];
    
    //四个门
    self.rear_right_door_status = ISNULL([tem1 objectForKey:@"rear_right_door_status"]) ? -1 : [[tem1 objectForKey:@"rear_right_door_status"] integerValue];
    self.driver_door_status = ISNULL([tem1 objectForKey:@"driver_door_status"]) ? -1 : [[tem1 objectForKey:@"driver_door_status"] integerValue];
    self.rear_left_door_status = ISNULL([tem1 objectForKey:@"rear_left_door_status"]) ? -1 : [[tem1 objectForKey:@"rear_left_door_status"] integerValue];
    self.copilot_door_status = ISNULL([tem1 objectForKey:@"copilot_door_status"]) ? -1 : [[tem1 objectForKey:@"copilot_door_status"] integerValue];
    
    
    self.front_cover_status = ISNULL([tem1 objectForKey:@"front_cover_status"]) ? 0 : [[tem1 objectForKey:@"front_cover_status"] integerValue];
    self.abs_status = ISNULL([tem1 objectForKey:@"abs_status"]) ? 0 : [[tem1 objectForKey:@"abs_status"] integerValue];
    self.remaining_fuel = ISNULL([tem1 objectForKey:@"remaining_fuel"]) ? 0 : [[tem1 objectForKey:@"remaining_fuel"] integerValue];
    
    NSString *time = [tem1 objectForKey:@"record_timestamp"];
    
    if (!ISNULL(time))
    {
        self.record_timestamp = [time doubleValue];
        
        self.recordDate = [NSDate dateWithTimeIntervalSince1970:self.record_timestamp];
    }
    
    self.engine_rpm = ISNULL([tem1 objectForKey:@"engine_rpm"]) ? 0 : [[tem1 objectForKey:@"engine_rpm"] integerValue];
    self.emergency_status = ISNULL([tem1 objectForKey:@"emergency_status"]) ? 0 : [[tem1 objectForKey:@"emergency_status"] integerValue];
    self.front_fog_lamps_status = ISNULL([tem1 objectForKey:@"front_fog_lamps_status"]) ? 0 : [[tem1 objectForKey:@"front_fog_lamps_status"] integerValue];
    self.mil_status = ISNULL([tem1 objectForKey:@"mil_status"]) ? 0 : [[tem1 objectForKey:@"mil_status"] integerValue];
    self.dipped_beam_status = ISNULL([tem1 objectForKey:@"dipped_beam_status"]) ? -1 : [[tem1 objectForKey:@"dipped_beam_status"] integerValue];
    self.high_beam_status = ISNULL([tem1 objectForKey:@"high_beam_status"]) ? -1 : [[tem1 objectForKey:@"high_beam_status"] integerValue];
    self.mileage = ISNULL([tem1 objectForKey:@"mileage"]) ? 0 : [[tem1 objectForKey:@"mileage"] integerValue];
    self.fuelleftover = ISNULL([tem1 objectForKey:@"fuelleftover"]) ? 0 : [[tem1 objectForKey:@"fuelleftover"] integerValue];
    self.average_fuel_consumption = ISNULL([tem1 objectForKey:@"average_fuel_consumption"]) ? 0 : [[tem1 objectForKey:@"average_fuel_consumption"] integerValue];
    self.door_status = ISNULL([tem1 objectForKey:@"door_status"]) ? 0 : [[tem1 objectForKey:@"door_status"] integerValue];
    self.battery_voltage = ISNULL([tem1 objectForKey:@"battery_voltage"]) ? 0 : [[tem1 objectForKey:@"battery_voltage"] integerValue];
    
    self.oil_life = ISNULL([tem1 objectForKey:@"oil_life"]) ? 0 : [[tem1 objectForKey:@"oil_life"] integerValue];
    self.interior_temp = ISNULL([tem1 objectForKey:@"interior_temp"]) ? -100 : [[tem1 objectForKey:@"interior_temp"] floatValue];
    self.sunroof_status = ISNULL([tem1 objectForKey:@"sunroof_status"]) ? -1 : [[tem1 objectForKey:@"sunroof_status"] integerValue];
    self.trunk_status = ISNULL([tem1 objectForKey:@"trunk_status"]) ? -1 : [[tem1 objectForKey:@"trunk_status"] integerValue];
    
    self.copilot_window_status = ISNULL([tem1 objectForKey:@"copilot_window_status"]) ? -1 : [[tem1 objectForKey:@"copilot_window_status"] integerValue];
    self.rear_left_window_status = ISNULL([tem1 objectForKey:@"rear_left_window_status"]) ? -1 : [[tem1 objectForKey:@"rear_left_window_status"] integerValue];
    self.driver_window_status = ISNULL([tem1 objectForKey:@"driver_window_status"]) ? -1 : [[tem1 objectForKey:@"driver_window_status"] integerValue];
    self.rear_right_window_status = ISNULL([tem1 objectForKey:@"rear_right_window_status"]) ? -1 : [[tem1 objectForKey:@"rear_right_window_status"] integerValue];
    
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    
    if (ISNULL(dic))
        return;
    
    //保存本地
    NSString *file = [MyUtil getCachePath];
    
    BOOL isSuc = [dic writeToFile:[NSString stringWithFormat:@"%@/%@",file,File_Name] atomically:YES];
    
    if (!isSuc)
    {
        NSLog(@"保存车况失败!");
    }
    
    [self fillFromDictionary1:dic];

}

@end
