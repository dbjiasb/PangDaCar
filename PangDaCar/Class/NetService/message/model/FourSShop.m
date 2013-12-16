//
//  FourSShop.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-20.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "FourSShop.h"

@implementation FourSShop

- (void)dealloc
{
    self.name = nil;
    self.lat = nil;
    self.lng = nil;
    self.telephone = nil;
    self.address = nil;
    
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    self.name = ISNULL([dic objectForKey:@"name"]) ? @"" : [dic objectForKey:@"name"];
    self.lat = ISNULL([dic objectForKey:@"lat"]) ? @"" : [dic objectForKey:@"lat"];
    self.lng = ISNULL([dic objectForKey:@"lng"]) ? @"" : [dic objectForKey:@"lng"];
    self.telephone = ISNULL([dic objectForKey:@"telephone"]) ? @"" : [dic objectForKey:@"telephone"];
    self.address = ISNULL([dic objectForKey:@"address"]) ? @"" : [dic objectForKey:@"address"];
    
}

@end
