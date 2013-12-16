//
//  RemoteCheckResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface RemoteCheckResp : ResponseMsg

@property (nonatomic, retain) NSMutableArray *report_list;

@end
