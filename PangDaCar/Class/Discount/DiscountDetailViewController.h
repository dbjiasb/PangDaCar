//
//  DiscountDetailViewController.h
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscountDetailViewController : UIViewController
{
    UILabel *titleLabel;
    UIImageView *imageview;
    UILabel *timeLabel;
    UILabel *contentLabel;
}
@property (nonatomic,copy) NSString *dicountId;
@end
