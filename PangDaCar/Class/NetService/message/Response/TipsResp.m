//
//  TipsResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TipsResp.h"

@implementation TipsResp

- (id)init
{
    if (self = [super init]) {
        
        self.tips_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.tips_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *data = [dic objectForKey:@"resp_data"];
    self.tips_num =  ISNULL([data objectForKey:@"tips_num"]) ? 0 : [[data objectForKey:@"tips_num"] integerValue];
    
    NSArray *list = [data objectForKey:@"tips_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        self.tips_list = list;
        
    }
    
}

@end
