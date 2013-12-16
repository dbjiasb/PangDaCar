//
//  EditCarReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-10.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@class CarInfo;

@interface EditCarReq : RequestMsg

@property (nonatomic, retain) CarInfo *car;

@end
