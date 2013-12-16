//
//  LoginResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"
#import "UserInfo.h"

@interface LoginResp : ResponseMsg

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *tuid;

- (void)fillFromDictionary:(NSDictionary *)dic;



@end
