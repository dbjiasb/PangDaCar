//
//  WeatherReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-20.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"


@interface WeatherReq : RequestMsg

@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *mid;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, copy) NSString *endTime;


@end
