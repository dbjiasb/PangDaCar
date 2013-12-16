//
//  UserInfoResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-3.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@class UserInfo;

@interface UserInfoResp : ResponseMsg

@property (nonatomic, retain) UserInfo *userInfo;

@end
