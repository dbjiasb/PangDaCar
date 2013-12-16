//
//  TuListResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-24.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface TuListResp : ResponseMsg

@property (nonatomic, retain) NSMutableArray *tu_list;
@property (nonatomic, assign) NSInteger tu_num;

@end
