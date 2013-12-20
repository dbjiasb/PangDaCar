//
//  BillInfo.m
//  PangDaCar
//
//  Created by chinatsp on 13-12-20.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "BillInfo.h"

@implementation BillInfo

- (void)dealloc
{
    self.typeName = nil;
    self.des = nil;
    self.date = nil;
    
    [super dealloc];
}

@end
