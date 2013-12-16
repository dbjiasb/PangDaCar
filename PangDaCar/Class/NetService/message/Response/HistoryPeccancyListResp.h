//
//  HistoryPeccancyListResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface HistoryPeccancyListResp : ResponseMsg

@property (nonatomic, assign) NSInteger peccancy_num;
@property (nonatomic, retain) NSMutableArray *peccancy_list;

@end
