//
//  MaintainSettingReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface MaintainSettingReq : RequestMsg

@property (nonatomic, assign) int time_interval;
@property (nonatomic, assign) int mileage_interval;

@end
