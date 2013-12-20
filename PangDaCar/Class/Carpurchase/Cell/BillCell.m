//
//  BillCell.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-28.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "BillCell.h"

@implementation BillCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (BillCell *)cell
{
    BillCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BillCell"
                                                   owner:self
                                                  options:nil] firstObject];
    cell.backgroundColor = [UIColor clearColor];
    
    
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
