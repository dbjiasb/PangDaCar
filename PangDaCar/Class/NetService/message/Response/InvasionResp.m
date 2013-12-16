//
//  InvasionResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "InvasionResp.h"

@implementation InvasionResp

- (id)init
{
    if (self = [super init]) {
        
        self.open_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.open_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *data = [dic objectForKey:@"resp_data"];
    self.open_num =  ISNULL([data objectForKey:@"open_num"]) ? 0 : [[data objectForKey:@"open_num"] integerValue];
    
    NSArray *list = [data objectForKey:@"open_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        self.open_list = list;

    }
    
}


@end
