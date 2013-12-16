//
//  BindCarReq.h
//  Chinatsp
//
//  Created by yuante on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface BindCarReq : RequestMsg

@property (nonatomic, copy) NSString *verify_code;
@property (nonatomic, copy) NSString *password;

- (NSDictionary *)dictionary;

@end
