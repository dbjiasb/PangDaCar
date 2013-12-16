//
//  CarControlReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface CarControlReq : RequestMsg

@property (nonatomic,copy) NSString *send_way;
@property (nonatomic,copy) NSString *is_instant;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *verify_code;
@property (nonatomic,copy) NSString *password;


@end
