//
//  UserPublicInfoResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-24.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface UserPublicInfoResp : ResponseMsg

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *nick_name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *role;


@end
