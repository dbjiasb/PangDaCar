//
//  PeccancyCodeResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-7.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PeccancyCodeResp.h"

@implementation PeccancyCodeResp

- (void)dealloc
{
    self.imgcode = nil;
    self.cookie = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    if (!dic)
    {
        return;
    }
    
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    if (tem1 && [tem1 isKindOfClass:[NSDictionary class]])
    {
        self.imgcode =  ISNULL([tem1 objectForKey:@"imgcode"]) ? @"0" : [tem1 objectForKey:@"imgcode"];
        self.cookie =  ISNULL([tem1 objectForKey:@"cookie"]) ? @"" : [tem1 objectForKey:@"cookie"];
    }

}

@end
