//
//  StolenStatusResp.h
//  PangDaCar
//
//  Created by ysw on 13-12-20.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "ResponseMsg.h"

@interface StolenStatusResp : ResponseMsg

@property(nonatomic,assign)NSInteger rescueid;
@property(nonatomic,copy)NSString *apply_time;
@property(nonatomic,copy)NSString *rescue_time;
@property(nonatomic,copy)NSString *rescue_finish_time;
@property(nonatomic,assign)NSInteger rescue_state;
@property(nonatomic,assign)NSInteger rescue_grade;


@end
