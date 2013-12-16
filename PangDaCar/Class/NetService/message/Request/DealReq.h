//
//  FavorableReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface DealReq : RequestMsg

@property (nonatomic, copy) NSString *start;
@property (nonatomic, copy) NSString *rows;
@property (nonatomic, copy) NSString *type;

@end
