//
//  LoginReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface LoginReq : RequestMsg

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

- (NSDictionary *)dictionary;

@end
