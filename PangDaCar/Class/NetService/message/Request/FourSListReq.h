//
//  FourSListReq.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-20.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "RequestMsg.h"

@interface FourSListReq : RequestMsg

@property (nonatomic, copy) NSString *start;
@property (nonatomic, copy) NSString *rows;
@property (nonatomic, copy) NSString *prov_code;
@property (nonatomic, copy) NSString *prov_name;
@property (nonatomic, copy) NSString *city_code;
@property (nonatomic, copy) NSString *city_name;



@end
