//
//  Information.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "Information.h"

@implementation Information

- (void)dealloc
{
    
    self.type = nil;
    self.content = nil;
    self.title = nil;
    self.pic_url = nil;
    self.release_time = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    if (ISNULL(dic))
    {
        return;
    }
    
    
    self.id = ISNULL(dic[@"id"]) ? @"0" : dic[@"id"];
    self.type = ISNULL(dic[@"type"]) ? @"0" : dic[@"type"];
    self.content = ISNULL(dic[@"content"]) ? @"0" : dic[@"content"];
    self.title = ISNULL(dic[@"title"]) ? @"0" : dic[@"title"];
    self.pic_url = ISNULL(dic[@"pic_url"]) ? @"0" : dic[@"pic_url"];
    self.release_time = ISNULL(dic[@"release_time"]) ? @"0" : dic[@"release_time"];
}

@end
