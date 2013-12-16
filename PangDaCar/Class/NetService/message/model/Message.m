//
//  Message.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "Message.h"

@implementation Message

- (void)dealloc
{
    self.uuid = nil;
    self.msg_id = nil;
    self.msg_type = nil;
    self.msg_num = nil;

    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    if (ISNULL(dic) ) {
        return;
    }
    
    self.uuid = ISNULL(dic[@"uuid"]) ? @"0" : dic[@"uuid"];
    self.msg_id = ISNULL(dic[@"msg_id"]) ? @"0" : dic[@"msg_id"];
    self.msg_type = ISNULL(dic[@"msg_type"]) ? @"0" : dic[@"msg_type"];
    self.msg_num = ISNULL(dic[@"msg_num"]) ? @"0" : dic[@"msg_num"];
}
@end
