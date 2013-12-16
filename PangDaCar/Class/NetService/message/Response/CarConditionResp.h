//
//  CarConditionResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-17.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface CarConditionResp : ResponseMsg

@property (nonatomic, retain) NSString *manufacturer_code;//厂商代号
@property (nonatomic, retain) NSString *vehicle_type;//车型代号
@property (nonatomic, retain) NSString *tyre_temperature_warning;//轮胎温度报警
@property (nonatomic, retain) NSString *tyre_pressure_warning;//轮胎压力报警
@property (nonatomic, retain) NSString *tu_id;//

@property (nonatomic, retain) NSDate *recordDate;;//记录时间

@property (nonatomic, assign) int right_turn_signal_status;//右转向灯状态
@property (nonatomic, assign) int front_cover_status;//前盖关闭状态
@property (nonatomic, assign) int abs_status;//ABS状态

@property (nonatomic, assign) int remaining_fuel;//当前油量百分比
@property (nonatomic, assign) NSTimeInterval record_timestamp;//记录时间
@property (nonatomic, assign) int engine_rpm; //	发动机转速
@property (nonatomic, assign) int emergency_status;//紧急情况状态
@property (nonatomic, assign) int front_fog_lamps_status;//前雾灯状态
@property (nonatomic, assign) int mil_status;//故障指示灯MIL提醒
@property (nonatomic, assign) int dipped_beam_status;//近光灯状态
@property (nonatomic, assign) int high_beam_status;//远光灯状态
@property (nonatomic, assign) int mileage;//运行里程
@property (nonatomic, assign) int fuelleftover;//剩余油量
@property (nonatomic, assign) int average_fuel_consumption;//平均油耗
@property (nonatomic, assign) int door_status;//车门整体状态  车门开关状态
@property (nonatomic, assign) int trunk_status;//后备箱关闭状态
@property (nonatomic, retain) NSString *tyre_pressure;//轮胎压力
@property (nonatomic, assign) float battery_voltage;//电瓶电压
@property (nonatomic, assign) int oil_life;//机油寿命
@property (nonatomic, assign) float interior_temp; //车内温度

//车门
@property (nonatomic, assign) int copilot_door_status;//副驾驶门
@property (nonatomic, assign) int rear_left_door_status;//后左门
@property (nonatomic, assign) int driver_door_status;//驾驶员门
@property (nonatomic, assign) int rear_right_door_status;//后右门

@property (nonatomic, assign) int sunroof_status;//天窗
@property (nonatomic, assign) int rear_left_window_status;//左后车窗
@property (nonatomic, assign) int driver_window_status;//左前
@property (nonatomic, assign) int copilot_window_status;//右前
@property (nonatomic, assign) int rear_right_window_status;//右后



//***************************
//暂时没用
@property (nonatomic, assign) float engine_water_temp;//发动机冷却剂温度
@property (nonatomic, assign) int airbag_status;//安全气囊状态
@property (nonatomic, assign) int speed;//车速
@property (nonatomic, assign) int handbrake_status;//手刹状态
@property (nonatomic, assign) int wiper_status;//雨刮器状态
@property (nonatomic, assign) int rear_left_probe_status;//后左探头状态
@property (nonatomic, assign) int rear_right_probe_status;//后右探头状态
@property (nonatomic, assign) int reversing_radar_ranging;//倒车雷达测距
@property (nonatomic, assign) int contour_led_status;//轮廓灯状态
@property (nonatomic, assign) int left_turn_signal_status;//
@property (nonatomic, assign) int esp_status;//ESP状态


+ (CarConditionResp *)getLocalCarCondiction;


@end
