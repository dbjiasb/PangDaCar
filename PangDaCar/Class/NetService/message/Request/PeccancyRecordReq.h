//
//  PeccancyRecordReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-29.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface PeccancyRecordReq : RequestMsg

@property (nonatomic, copy) NSString *imgcode;
@property (nonatomic, copy) NSString *cookie;

@end
