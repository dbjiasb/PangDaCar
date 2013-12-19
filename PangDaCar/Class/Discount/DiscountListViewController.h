//
//  DiscountListViewController.h
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscountListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *totalArray;
    UITableView *table;
}
@end
