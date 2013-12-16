//
//  AdvertiseResq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-31.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface AdvertiseResp :  ResponseMsg

@property (nonatomic, assign) NSInteger advertise_num;
@property (nonatomic, retain) NSMutableArray *advertise_list;

@end
