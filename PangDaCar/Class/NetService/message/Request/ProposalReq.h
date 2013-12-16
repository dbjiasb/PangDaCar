//
//  ProposalReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-30.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface ProposalReq : RequestMsg

@property(nonatomic, copy) NSString *proposal_title;
@property(nonatomic, copy) NSString *proposal_content;
@property(nonatomic, copy) NSString *tel_phone;


@end
