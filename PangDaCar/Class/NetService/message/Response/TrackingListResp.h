//
//  TrackingListResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface TrackingListResp : ResponseMsg

@property (nonatomic,assign) int tracking_num;
@property (nonatomic,retain) NSMutableArray *tracking_list;


@end
