//
//  UserPublicInfo.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-24.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UserPublicInfo.h"

@implementation UserPublicInfo

- (void)dealloc
{
    self.uuid = nil;
    self.nick_name = nil;
    self.gender = nil;
    self.language = nil;
    self.role = nil;
    

    [super dealloc];
}

@end
