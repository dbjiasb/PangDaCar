//
//  UnreadMessageResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UnreadMessageResp.h"
#import "Message.h"

@implementation UnreadMessageResp

- (id)init
{
    if (self = [super init]) {
        
        self.push_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.push_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *data = [dic objectForKey:@"resp_data"];
    self.push_num =  ISNULL([data objectForKey:@"push_num"]) ? 0 : [[data objectForKey:@"push_num"] integerValue];
    
    NSArray *list = [data objectForKey:@"push_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        for (int i = 0; i < [list count]; i++) {
            NSDictionary *itemDic = list[i];
            if (!ISNULL(itemDic))
            {
                Message *message = [[[Message alloc] init] autorelease];
                
                [message fillFromDictionary:itemDic];
                
                [self.push_list addObject:message];
            }
        }
    }
    
}

@end
