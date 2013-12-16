//
//  RegisterReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-14.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RegisterReq.h"

@implementation RegisterReq

- (void)dealloc
{
    
    self.password = nil;
    self.mobile_phone = nil;
    self.email = nil;
    self.verify_code = nil;
    
    [super dealloc];
}

- (NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"password",@"mobile_phone",@"email",@"verify_code",@"imei",nil]]];
    
    return ret ;
    
}

- (Class) responseMsgClass
{
    return RegisterResp.class;
}



@end
