//
//  FourSListResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-20.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface FourSListResp : ResponseMsg

@property (nonatomic, copy) NSString *fourSnum;
@property (nonatomic, retain) NSMutableArray *fourSList;

@end
