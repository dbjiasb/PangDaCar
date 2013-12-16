//
//  BindCarResp.m
//  Chinatsp
//
//  Created by yuante on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "BindCarResp.h"

@implementation BindCarResp

- (void)dealloc
{
    self.caruuid = nil;
    self.tuid = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic {
    
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.caruuid =  ISNULL([tem1 objectForKey:@"caruuid"]) ? @"" : [tem1 objectForKey:@"caruuid"];
    self.tuid = ISNULL([tem1 objectForKey:@"tuid"]) ? @"" : [tem1 objectForKey:@"tuid"];
    
}


@end
