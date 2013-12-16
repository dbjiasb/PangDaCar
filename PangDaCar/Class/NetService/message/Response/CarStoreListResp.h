//
//  CarStoreListResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-1.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface CarStoreListResp : ResponseMsg

@property (nonatomic, assign) NSInteger car_num;
@property (nonatomic, retain) NSMutableArray *car_list;


@end
