//
//  BillInfo.h
//  PangDaCar
//
//  Created by chinatsp on 13-12-20.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BillInfo : NSObject

@property (nonatomic, assign) int billId;
@property (nonatomic, assign) float fee;
@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, copy) NSString *des;
@property (nonatomic, copy) NSString *date;


@end
