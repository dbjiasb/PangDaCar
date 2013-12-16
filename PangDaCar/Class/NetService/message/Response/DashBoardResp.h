//
//  DashBoardResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface DashBoardResp : ResponseMsg

@property (nonatomic, assign) NSInteger dashboard_num;
@property (nonatomic, retain) NSArray  *dashboard_list;

@property (nonatomic, copy) NSString  *dashboard_content;

@end
