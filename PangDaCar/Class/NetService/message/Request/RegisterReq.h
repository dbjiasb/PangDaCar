//
//  RegisterReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-14.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface RegisterReq : RequestMsg

@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *mobile_phone;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *verify_code;

- (NSDictionary *)dictionary;


@end
