//
//  SafeCodeResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "SafeCodeResp.h"

@implementation SafeCodeResp

- (void)dealloc
{
    self.latFourPhoneNum = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    if (!dic) {
        return;
    }
    
    [super fillFromDictionary:dic];
    
    NSString *data = [dic objectForKey:@"resp_data"];
    
    if ([data isKindOfClass:[NSString class] ]&& data.length == 4) {
        
        self.latFourPhoneNum = data;
    }
    
}

@end
