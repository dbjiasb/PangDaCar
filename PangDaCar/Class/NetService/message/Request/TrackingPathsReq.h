//
//  TrackingPathsReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface TrackingPathsReq : RequestMsg

@property (nonatomic, retain) NSArray *stack;

@end
