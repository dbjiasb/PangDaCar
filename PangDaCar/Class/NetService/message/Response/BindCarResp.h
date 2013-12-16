//
//  BindCarResp.h
//  Chinatsp
//
//  Created by yuante on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface BindCarResp : ResponseMsg

@property (nonatomic, copy) NSString *caruuid;
@property (nonatomic, copy) NSString *tuid;

@end
