//
//  RemoteCheckResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RemoteCheckResp.h"
#import "CarCheckInfo.h"

@implementation RemoteCheckResp

- (id)init
{
    if (self = [super init]) {
        
        self.report_list = [NSMutableArray array];
    }
    
    return self;
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    NSArray *list = [tem1 objectForKey:@"report_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
//        NSArray *list = [listDic allValues];
        for (int i = 0; i < [list count]; i++)
        {
            NSDictionary *itemDic = list[i];
            if (!ISNULL(itemDic))
            {
                CarCheckInfo *checkInfo = [[[CarCheckInfo alloc] init] autorelease];
                
                [checkInfo fillFromDictionary:itemDic];
                
                [self.report_list addObject:checkInfo];
            }
        }
    }
    
}

@end
