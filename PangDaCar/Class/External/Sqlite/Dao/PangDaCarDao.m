//
//  ChinaTspDap.m
//  Chinatsp
//
//  Created by yuante on 13-4-12.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PangDaCarDao.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "BillInfo.h"

@implementation PangDaCarDao


static PangDaCarDao *singleDao=nil;

+(PangDaCarDao *)singleDao
{
    @synchronized(singleDao)
    {
        if(!singleDao)
        {
            singleDao=[[PangDaCarDao alloc] init];
        }
    }
    return singleDao;
}

-(FMDatabase *)createDataBase
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbpath = [documentDirectory stringByAppendingPathComponent:@"PangDaCar.db"];
//    NSLog(@"%@",dbpath);
    FMDatabase *db = [FMDatabase databaseWithPath:dbpath];
    if([db open])
    {
        [db executeUpdate:@"create table if not exists MaintainBill(id integer PRIMARY KEY,'fee' text,type integer,'typname' text, 'des' text , 'date' text)"];
        
    }
    return db;
}


#pragma mark - Insert Data

- (void)insertLocalBills:(NSArray *)bills
{
    for (int i = 0; i < bills.count; i++)
    {
        BillInfo *bill = bills[i];
        [self insertBill:bill];
    }
    
}

- (void)insertBill:(BillInfo *)bill
{

    FMDatabase *db = [self createDataBase];
    BOOL isscuess = [db executeUpdate:@"insert into  MaintainBill(fee, type,typname,des,date) values (?,?,?,?,?)",
                     [NSString stringWithFormat:@"%f",bill.fee],
                     @(bill.type),
                     bill.typeName,
                     bill.des,
                     bill.date];
    
    [db close];
    if (!isscuess) {
        NSLog(@"fail to insert Bill");
    }
    
}

//- (void)insertCarItemList:(NSArray *)itemList
//{
//    for (CarShopItem *item in itemList)
//    {
//        FMDatabase *db=[self createDataBase];
//        BOOL isscuess = [db executeUpdate:@"insert into  CarShopItem values (?,?,?,?,?,?,?,?,?)",item.carId,item.carName,item.picUrl,item.downloadUrl,item.version,@(item.state),item.fileName,@(0),@(0)];
//        
//        [db close];
//        if (!isscuess) {
//            NSLog(@"fail to insert %@",item.carId);
//        }
//    }
//
//}

#pragma mark - Delete Data

- (void)deleteBill:(BillInfo *)bill
{
    NSString *sql = [NSString stringWithFormat:@"delete from MaintainBill where id = %d",bill.billId];
    
    FMDatabase *db = [self createDataBase];
    BOOL isscuess=[db executeUpdate:sql];
    if (!isscuess) {
        NSLog(@"删除失败!");
    }

}
//- (void)deleteCarItem:(CarShopItem *)item
//{
//    NSString *sql = [NSString stringWithFormat:@"delete from CarShopItem where carId = %@",item.carId];
//    
//    FMDatabase *db=[self createDataBase];
//    BOOL isscuess=[db executeUpdate:sql];
//    if (!isscuess) {
//        NSLog(@"删除失败!");
//    }
//}

#pragma mark - Update

- (void)updateBill:(BillInfo *)bill //单条
{
    FMDatabase *db = [self createDataBase];
    
    //3. 判断数据表是否存在
    if (![db tableExists:@"MaintainBill"]) {
        //关闭数据库
        [db close];
        
    }
    [db beginTransaction];

    BOOL suc = [db executeUpdate:@"update MaintainBill set fee = ?, type = ?,  typname = ? , des = ? where id = ?;",
                [NSString stringWithFormat:@"%.f",bill.fee],
                @(bill.type),
                bill.typeName,
                bill.des,
                @(bill.billId)];
    if (!suc) {
        NSLog(@"更新记账单失败!");
    }
    
    [db commit];
    [db close];

    

}
//- (BOOL)updateFunctionClass:(FunctionClass *)functionClass
//{
//    
//    FMDatabase *db = [self createDataBase];
//    
//    //3. 判断数据表是否存在
//    if (![db tableExists:@"FunctionClass"]) {
//        //关闭数据库
//        [db close];
//        
//        return NO;
//    }
//
//    [db beginTransaction];
//    
//    BOOL suc = [db executeUpdate:@"update FunctionClass set favortag = ? where name = ?;",
//     @(functionClass.favorTag),
//     functionClass.name];
//    
//    
//    [db commit];
//    [db close];
//    
//    
//    return suc;
//    
//}

#pragma mark - Select

- (NSMutableArray *)getLocalBillsByStart:(NSDate *)startDate end:(NSDate *)endDate
{
    NSString *start = [startDate dateString];
    NSString *end = [endDate dateString];
    
    NSMutableArray *array = [NSMutableArray array];
    
    FMDatabase *db = [self createDataBase];
    
    //3. 判断数据表是否存在
    if (![db tableExists:@"MaintainBill"]) {
        //关闭数据库
        [db close];
        
        return nil;
    }
    
    NSString *strSQL=[NSString stringWithFormat:@"select * from MaintainBill where date >= '%@' and date < '%@' order by id DESC;",start,end];
    
    
    FMResultSet *fs = [db executeQuery:strSQL];
    while ([fs next])
    {
        BillInfo *item = [[BillInfo alloc] init] ;

        item.billId = [fs intForColumnIndex:0];
        item.fee = [[fs stringForColumnIndex:1] floatValue];
        item.type = [fs intForColumnIndex:2];
        item.typeName = [fs stringForColumnIndex:3];
        item.des = [fs stringForColumnIndex:4];
        item.date = [fs stringForColumnIndex:5];

        [array addObject:item];
        [item release];
    }
    
    [db close];
    
    if ([array count] > 0) {
        return array;
    }
    
    return nil;
}

@end
