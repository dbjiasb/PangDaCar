//
//  TipsTypeResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TipsTypeResp.h"

@implementation TipsTypeResp

- (id)init
{
    if (self = [super init]) {
        
        self.typeList = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.typeList = nil;
    self.content = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    id data = [dic objectForKey:@"resp_data"];
    
    if (data && [data isKindOfClass:[NSDictionary class]])
    {
        self.tips_num =  ISNULL([data objectForKey:@"tips_num"]) ? 0 : [[data objectForKey:@"tips_num"] integerValue];
        
        NSArray *list = [data objectForKey:@"tips_list"];
        if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
        {
            self.typeList = list;
            
        }
        
        self.content = data[@"content"];
    }
    
    
}

@end
