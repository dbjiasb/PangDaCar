//
//  PeccancyRecord.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-29.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeccancyRecord : NSObject

@property (nonatomic, copy)NSString *uuid;
@property (nonatomic, copy)NSString *veh_no; //车牌号
@property (nonatomic, copy)NSString *pec_date;//
@property (nonatomic, copy)NSString *pec_address;//违章地点
@property (nonatomic, copy)NSString *pec_action;//违章情况
@property (nonatomic, copy)NSString *price; //罚款
@property (nonatomic, copy)NSString *score;// 扣分
@property (nonatomic, copy)NSString *is_return; //是否通知
@property (nonatomic, copy)NSString *is_read; //是否已读
@property (nonatomic, copy)NSString *create_date; //后台记录时间

- (void)fillFromDictionary:(NSDictionary *)dic;


@end
