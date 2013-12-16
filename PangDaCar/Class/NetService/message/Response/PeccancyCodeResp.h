//
//  PeccancyCodeResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-7.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface PeccancyCodeResp : ResponseMsg

@property (nonatomic, copy) NSString *imgcode;//base64
@property (nonatomic, copy) NSString *cookie;
@end
