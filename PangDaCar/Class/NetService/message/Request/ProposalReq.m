//
//  ProposalReq.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-30.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ProposalReq.h"

@implementation ProposalReq

- (Class) responseMsgClass
{
    return ProposalResp.class;
    
}

- (void)dealloc
{
    
    //    self.uuid = nil;
    self.proposal_title = nil;
    self.proposal_content = nil;
    self.tel_phone = nil;
    
    [super dealloc];
}


- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic addEntriesFromDictionary:[super dictionary]];
    
    
    [dic addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"proposal_title",@"proposal_content",@"tel_phone"]]];
    
    return dic;
}

@end
