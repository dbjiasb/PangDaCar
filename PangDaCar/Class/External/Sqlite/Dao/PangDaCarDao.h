//
//  ChinaTspDap.h
//  Chinatsp
//
//  Created by yuante on 13-4-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase;

@class BillInfo;

@interface PangDaCarDao : NSObject

+(PangDaCarDao *)singleDao;

-(FMDatabase *)createDataBase;

//插入数据
- (void)insertLocalBills:(NSArray *)bills; //插入养车消费
- (void)insertBill:(BillInfo *)bill; //单条

//更新
- (void)updateBill:(BillInfo *)bill; //单条

//查询
- (NSMutableArray *)getLocalBillsByStart:(NSDate *)startDate end:(NSDate *)endDate;
//删除
- (void)deleteBill:(BillInfo *)bill;

@end
