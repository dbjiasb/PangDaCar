//
//  InvasionReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface InvasionReq : RequestMsg

@property (nonatomic, copy) NSString *start;
@property (nonatomic, copy) NSString *rows;

@end
