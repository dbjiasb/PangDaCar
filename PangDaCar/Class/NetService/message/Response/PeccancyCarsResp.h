//
//  PeccancyCarsResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-28.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface PeccancyCarsResp : ResponseMsg

@property (nonatomic, assign) NSInteger veh_num;
@property (nonatomic, retain) NSMutableArray *veh_list;
@property (nonatomic, retain) NSNumber *carId;
@end
