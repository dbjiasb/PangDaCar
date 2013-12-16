//
//  InvasionResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface InvasionResp : ResponseMsg

@property (nonatomic, assign) int open_num;
@property (nonatomic, retain) NSArray *open_list;

@end
