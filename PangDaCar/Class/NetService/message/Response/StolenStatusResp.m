//
//  StolenStatusResp.m
//  PangDaCar
//
//  Created by ysw on 13-12-20.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "StolenStatusResp.h"

@implementation StolenStatusResp

- (id)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.rescueid=[[tem1 objectForKey:@"id"] intValue];
    self.apply_time=[tem1 objectForKey:@"apply_time"];
    self.rescue_time=[tem1 objectForKey:@"rescue_time"];
    self.rescue_finish_time=[tem1 objectForKey:@"rescue_finish_time"];
    self.rescue_state=[[tem1 objectForKey:@"rescue_state"] intValue];
    self.rescue_grade=[[tem1 objectForKey:@"rescue_grade"] intValue];
}

-(void)dealloc
{
    self.apply_time=nil;
    self.rescue_time=nil;
    self.rescue_finish_time=nil;
    [super dealloc];
}

@end
