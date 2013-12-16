//
//  TrackingPathsResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface TrackingPathsResp : ResponseMsg

@property (nonatomic, retain) NSMutableArray *paths;

@end
