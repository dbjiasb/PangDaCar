//
//  AddBillViewController.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-29.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BillInfo;

@protocol AddBillDelegate <NSObject>

- (void)didAddBill:(BillInfo *)bill;
- (void)didEditBill:(BillInfo *)bill index:(NSInteger)index;

@end

@interface AddBillViewController : UIViewController

@property (nonatomic, retain) BillInfo *bill;
@property (nonatomic, assign) BOOL isAdd;
@property (nonatomic, assign) id<AddBillDelegate> delegate;
@property (nonatomic, assign) NSDictionary *info;
@property (nonatomic, assign) NSInteger index;

@end
