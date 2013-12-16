//
//  UserPublicInfoResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-24.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UserPublicInfoResp.h"

@implementation UserPublicInfoResp

- (void)dealloc
{
    self.uuid  = nil;
    
    self.nick_name  = nil;
    
    self.gender  = nil;
    
    self.language  = nil;
    
    self.role  = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.uuid = ISNULL([tem1 objectForKey:@"uuid"]) ? 0 : [tem1 objectForKey:@"uuid"];
    self.nick_name = ISNULL([tem1 objectForKey:@"nick_name"]) ? 0 : [tem1 objectForKey:@"nick_name"];
    self.gender = ISNULL([tem1 objectForKey:@"gender"]) ? 0 : [tem1 objectForKey:@"gender"];
    self.language = ISNULL([tem1 objectForKey:@"language"]) ? 0 : [tem1 objectForKey:@"language"];
    self.role = ISNULL([tem1 objectForKey:@"role"]) ? 0 : [tem1 objectForKey:@"role"];
    
}


@end
