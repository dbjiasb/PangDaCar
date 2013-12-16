//
//  TrackingStatusResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface TrackingStatusResp : ResponseMsg

@property (nonatomic, copy) NSString *veh_tracking_id;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *start_time;


@end
