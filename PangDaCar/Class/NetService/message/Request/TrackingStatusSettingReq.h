//
//  TrackingStatusSettingReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface TrackingStatusSettingReq : RequestMsg

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *time_interval;

@end
