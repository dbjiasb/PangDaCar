//
//  LimitResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-9.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface LimitResp : ResponseMsg

@property (nonatomic, assign) int limit_num;
@property (nonatomic, retain) NSArray *limit_list;


@end
