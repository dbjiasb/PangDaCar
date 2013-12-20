//
//  BillCell.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-28.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *iconView;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *priceLabel;

+ (BillCell *)cell;
@end
