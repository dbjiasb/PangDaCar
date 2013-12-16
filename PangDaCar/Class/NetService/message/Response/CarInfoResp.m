//
//  CarInfoResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-3.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CarInfoResp.h"

@implementation CarInfoResp

- (void)dealloc
{
    
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *infoDic = [dic objectForKey:@"resp_data"];
    
    
    if(infoDic && [infoDic isKindOfClass:[NSDictionary class]])
    {
//        self.car = [[[CarInfo alloc] init] autorelease];
//        [self.car fillFromDictionary:infoDic];
    }
    
    
}

@end
