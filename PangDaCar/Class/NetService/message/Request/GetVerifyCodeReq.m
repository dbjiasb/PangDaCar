//
//  GetVerifyCodeReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "GetVerifyCodeReq.h"

@implementation GetVerifyCodeReq

//- (NSDictionary *)dictionary
//{
//    NSDictionary * dic = [super dictionary];
//    NSMutableDictionary * ret = [[NSMutableDictionary alloc] init] ;
//    [ret addEntriesFromDictionary:dic];
//    
//    return ret ;
//    
//}

- (Class) responseMsgClass
{
    return GetVerifyCodeResp.class;
}


@end
