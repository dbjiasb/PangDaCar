//
//  UpgradeResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-6.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UpgradeResp.h"

@implementation UpgradeResp

- (void)dealloc
{
    self.ver_num = nil;
    self.description = nil;
    self.download_url = nil;
    self.isforce = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.ver_num =  ISNULL([tem1 objectForKey:@"ver_num"]) ? @"0" : [tem1 objectForKey:@"ver_num"];
    self.description =  ISNULL([tem1 objectForKey:@"description"]) ? @"0" : [tem1 objectForKey:@"description"];
    self.download_url =  ISNULL([tem1 objectForKey:@"download_url"]) ? @"0" : [tem1 objectForKey:@"download_url"];
    self.isforce =  ISNULL([tem1 objectForKey:@"isforce"]) ? @"0" : [tem1 objectForKey:@"isforce"];

}

@end
