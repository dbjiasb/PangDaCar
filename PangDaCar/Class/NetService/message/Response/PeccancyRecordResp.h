//
//  PeccancyRecordResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-29.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface PeccancyRecordResp : ResponseMsg

@property (nonatomic, assign) NSInteger peccancy_num;
@property (nonatomic, retain) NSMutableArray *peccancy_list;

@end
