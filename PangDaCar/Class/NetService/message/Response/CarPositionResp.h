//
//  CarPositionResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-7.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface CarPositionResp : ResponseMsg

@property (nonatomic, copy) NSString *lng;
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *speed;
@property (nonatomic, copy) NSString *heading;
@property (nonatomic, copy) NSString *coord_type;
@property (nonatomic, copy) NSString *accel;
@property (nonatomic, copy) NSString *pitch;
@property (nonatomic, copy) NSString *roll;
@property (nonatomic, copy) NSString *sat_num;
@property (nonatomic, copy) NSString *geo_info;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *sublocality;
@property (nonatomic, copy) NSString *post_address;
@property (nonatomic, copy) NSString *raw_address;
@property (nonatomic, copy) NSString *gps_timestamp;
@property (nonatomic, copy) NSString *record_timestamp;


@end
