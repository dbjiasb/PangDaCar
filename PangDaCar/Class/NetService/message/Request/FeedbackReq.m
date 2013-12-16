//
//  Feedback.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "FeedbackReq.h"

@implementation FeedbackReq

- (Class) responseMsgClass
{
    return FeedbackResp.class;
    
}

- (void)dealloc
{
    
    self.feedback_content = nil;
    
    [super dealloc];
}


- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic addEntriesFromDictionary:[super dictionary]];
    
    
    [dic addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"feedback_content"]]];
    
    return dic;
}

@end
