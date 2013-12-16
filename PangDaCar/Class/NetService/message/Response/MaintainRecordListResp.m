//
//  MaintainRecordListResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "MaintainRecordListResp.h"

@implementation MaintainRecordListResp

- (void)dealloc
{
    self.service_list = nil;
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    NSArray *list = [tem1 objectForKey:@"service_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        self.service_list = list;
    }
    
    
}



@end
