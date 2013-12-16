//
//  MaintainSettingResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface MaintainSettingResp : ResponseMsg

@property (nonatomic ,copy) NSString *time_interval;
@property (nonatomic ,copy) NSString *mileage_interval;
@property (nonatomic ,copy) NSString *record_timestamp;


@end
