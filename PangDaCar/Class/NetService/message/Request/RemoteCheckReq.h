//
//  RemoteCheckReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface RemoteCheckReq : RequestMsg

@property (nonatomic, copy) NSString *start;
@property (nonatomic, copy) NSString *rows;
@property (nonatomic, copy) NSString *type;

@end
