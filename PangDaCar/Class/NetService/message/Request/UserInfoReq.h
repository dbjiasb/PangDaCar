//
//  UserInfoReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-3.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@class UserInfo;

@interface UserInfoReq : RequestMsg

@property (nonatomic, retain) UserInfo *userInfo;

@end
