//
//  UpdateMsgStateReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-14.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UpdateMsgStateReq.h"

@implementation UpdateMsgStateReq

- (Class) responseMsgClass
{
    return UpdateMsgStateResp.class;
    
}

- (void)dealloc
{
    
//    self.uuid = nil;
    self.msg_id = nil;
    
    [super dealloc];
}


- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic addEntriesFromDictionary:[super dictionary]];
    
    
    [dic addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"msg_id"]]];
    
    return dic;
}


@end
