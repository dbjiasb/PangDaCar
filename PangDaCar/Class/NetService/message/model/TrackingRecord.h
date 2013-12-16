//
//  TrackingRecord.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//


@interface TrackingRecord : NSObject

@property (nonatomic, copy) NSString *veh_tracking_id;
@property (nonatomic, copy) NSString *start_address;
@property (nonatomic, copy) NSString *end_address;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *end_time;
@property (nonatomic, copy) NSString *useTime;

- (void)fillFromDictionary:(NSDictionary *)dic;

@end
