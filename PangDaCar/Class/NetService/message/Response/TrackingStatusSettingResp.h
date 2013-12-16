//
//  TrackingStatusSettingResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface TrackingStatusSettingResp : ResponseMsg

@property (nonatomic, copy) NSString  *veh_tracking_id;

@end
