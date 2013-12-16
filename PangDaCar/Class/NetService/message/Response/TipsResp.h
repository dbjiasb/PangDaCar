//
//  TipsResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface TipsResp : ResponseMsg

@property (nonatomic, assign) int tips_num;
@property (nonatomic, retain) NSArray *tips_list;

@end
