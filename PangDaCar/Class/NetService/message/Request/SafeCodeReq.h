//
//  SafeCodeReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-16.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface SafeCodeReq : RequestMsg

@property (nonatomic, copy) NSString *tuid;

- (NSDictionary *)dictionary;


@end
