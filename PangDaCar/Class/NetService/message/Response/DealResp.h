//
//  FavorableResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface DealResp : ResponseMsg

@property (nonatomic, assign) int deals_num;
@property (nonatomic, retain) NSMutableArray *deals_list;

@end
