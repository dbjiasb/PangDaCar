//
//  CarCheckInfo.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-21.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarCheckInfo : NSObject

@property (nonatomic, copy) NSString *engine_status;
@property (nonatomic, copy) NSString *abs_status;
@property (nonatomic, copy) NSString *tcs_esp_status;//稳定性控制
@property (nonatomic, copy) NSString *eps_status; //转向
@property (nonatomic, copy) NSString *tpms_status; //胎压
@property (nonatomic, copy) NSString *diagnosis_time;//时间

- (void)fillFromDictionary:(NSDictionary *)dic;

@end
