//
//  MaintainRecordListReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "MaintainRecordListReq.h"

@implementation MaintainRecordListReq

- (id)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

- (Class) responseMsgClass
{
    return MaintainRecordListResp.class;
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    
    if (self.service_description) {
        [ret setObject:self.service_description forKey:@"service_description"];
    }
    
    return ret ;
    
}

@end
