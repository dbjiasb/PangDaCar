//
//  RegisterResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface RegisterResp : ResponseMsg

@property (nonatomic, copy) NSString *Uuuid;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *access_token;

- (void)fillFromDictionary:(NSDictionary *)dic;

@end
