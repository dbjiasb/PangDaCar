//
//  UserInfoResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-3.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UserInfoResp.h"
#import "UserInfo.h"

@implementation UserInfoResp

- (void)dealloc
{

    self.userInfo = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    NSDictionary *infoDic = [tem1 objectForKey:@"protected"];
    
    if(infoDic && [infoDic isKindOfClass:[NSDictionary class]])
    {
        self.userInfo = [[[UserInfo alloc] init] autorelease];
        [self.userInfo fillFromDictionary:infoDic];
    }
    
    
}

@end
