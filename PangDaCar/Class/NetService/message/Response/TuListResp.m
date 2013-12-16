//
//  TuListResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-24.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TuListResp.h"
#import "TuInfo.h"

@implementation TuListResp

- (void)dealloc
{
    self.tu_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
//    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
//    
//    self.tu_num = ISNULL([tem1 objectForKey:@"tu_num"]) ? 0 : [[tem1 objectForKey:@"tu_num"] integerValue];
    
    NSArray *listDic = [dic objectForKey:@"resp_data"];
    if (!ISNULL(listDic) && [listDic isKindOfClass:[NSArray class]])
    {
        if (!self.tu_list)
        {
            self.tu_list = [NSMutableArray array];
        }
        
        for (NSDictionary *dic in listDic) {
            
            TuInfo *tuInfo = [[[TuInfo alloc] init] autorelease];
            [tuInfo fillFromDictionary:dic];
            
            [self.tu_list addObject:tuInfo];
        }
    }
    
    
}

@end
