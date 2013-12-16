//
//  EditCarReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-10.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "EditCarReq.h"

@implementation EditCarReq

- (void)dealloc
{
    self.car = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic addEntriesFromDictionary:[super dictionary]];
    
//    [dic addEntriesFromDictionary:[self.car peccancyDictionary]];
    
    [dic setObject:self.imei forKey:@"imei"];
    
    return dic;
}

- (Class) responseMsgClass
{
    return EditCarResp.class;
    
}

@end
