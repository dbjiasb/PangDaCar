//
//  UpdateMsgStateReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-14.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface UpdateMsgStateReq : RequestMsg

//@property (nonatomic,copy) NSString *uuid; 
@property (nonatomic,copy) NSString *msg_id;

@end
