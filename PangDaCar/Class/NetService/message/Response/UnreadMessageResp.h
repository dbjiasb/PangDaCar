//
//  UnreadMessageResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface UnreadMessageResp : ResponseMsg

@property (nonatomic, assign) int push_num;
@property (nonatomic, retain) NSMutableArray *push_list;

@end
