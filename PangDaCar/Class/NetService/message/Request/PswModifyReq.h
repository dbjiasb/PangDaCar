//
//  PswModifyReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-3.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface PswModifyReq : RequestMsg

@property (nonatomic, copy) NSString *old_pwd;
@property (nonatomic, copy) NSString *n_pwd;

@end
