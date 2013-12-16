//
//  PeccancyRecord.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-29.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PeccancyRecord.h"

@implementation PeccancyRecord


- (void)dealloc
{
    self.uuid = nil;
    self.veh_no = nil;
    self.pec_date = nil;
    self.pec_address = nil;
    self.pec_action = nil;
    self.price = nil;
    self.score = nil;
    self.is_return = nil;
    self.is_read = nil;
    self.create_date = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    self.uuid = ISNULL([dic objectForKey:@"uuid"]) ? @"0" : [dic objectForKey:@"uuid"] ;
    self.veh_no = ISNULL([dic objectForKey:@"veh_no"]) ? @"" : [dic objectForKey:@"veh_no"] ;
    self.pec_date = ISNULL([dic objectForKey:@"pec_date"]) ? @"" : [dic objectForKey:@"pec_date"] ;
    self.pec_address = ISNULL([dic objectForKey:@"pec_address"]) ? @"" : [dic objectForKey:@"pec_address"] ;
    self.pec_action = ISNULL([dic objectForKey:@"pec_action"]) ? @"" : [dic objectForKey:@"pec_action"] ;
    self.price = ISNULL([dic objectForKey:@"price"]) ? @"" : [dic objectForKey:@"price"] ;
    self.score = ISNULL([dic objectForKey:@"score"]) ? @"" : [dic objectForKey:@"score"] ;
    self.is_return = ISNULL([dic objectForKey:@"is_return"]) ? @"" : [dic objectForKey:@"is_return"] ;
    self.is_read = ISNULL([dic objectForKey:@"is_read"]) ? @"" : [dic objectForKey:@"is_read"] ;
    self.create_date = ISNULL([dic objectForKey:@"create_date"]) ? @"" : [dic objectForKey:@"create_date"] ;
    
}

@end
