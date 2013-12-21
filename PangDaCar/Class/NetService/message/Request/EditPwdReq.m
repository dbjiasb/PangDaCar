//
//  EditPwdReq.m
//  PangDaCar
//
//  Created by ysw on 13-12-20.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "EditPwdReq.h"

@implementation EditPwdReq


-(NSDictionary *)dictionary
{
    NSDictionary * dic = [super dictionary];
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    [ret addEntriesFromDictionary:dic];
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"old_pwd",@"new_pwd",nil]]];
    return ret ;	
}

-(Class)responseMsgClass
{
    return EditPwdResp.class;
}

-(void)dealloc
{
    self.old_pwd=nil;
    self.new_pwd=nil;
    [super dealloc];
}
@end
