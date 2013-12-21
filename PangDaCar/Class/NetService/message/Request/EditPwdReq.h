//
//  EditPwdReq.h
//  PangDaCar
//
//  Created by ysw on 13-12-20.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "RequestMsg.h"

@interface EditPwdReq : RequestMsg

@property (nonatomic, copy) NSString *old_pwd;
@property (nonatomic, copy) NSString *new_pwd;

@end
