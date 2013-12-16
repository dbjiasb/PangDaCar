//
//  FourSListReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-20.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "FourSListReq.h"

@implementation FourSListReq

- (id)init
{
    if (self = [super init])
    {
        self.prov_code = @"";
        self.prov_name = @"";
        
        self.city_code = @"";
        self.city_name = @"";
        
        self.start = @"0";
        self.rows = @"10";
    }
    
    return self;
}

- (void)dealloc
{
    self.prov_code = nil;
    self.prov_name = nil;
    
    self.city_code = nil;
    self.city_name = nil;
    
    self.start = nil;
    self.rows = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"start",@"rows",@"prov_code",@"prov_name",@"city_code",@"city_name",nil]]];
    
    return ret ;
    
}

- (Class) responseMsgClass
{
    return FourSListResp.class;
}


@end
