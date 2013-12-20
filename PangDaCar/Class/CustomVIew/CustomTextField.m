//
//  CustomTextField.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-14.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self loadMyView];
    }
    return self;
}

- (void)dealloc
{
    self.textField = nil;
    
    [super dealloc];
}

- (void)loadMyView
{
    UIImage *bgImg = [[UIImage imageNamed:@"bg_input_01.png"] stretchableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13)];
    
    UIImageView *tidBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    tidBG.backgroundColor = [UIColor whiteColor];
    tidBG.layer.borderWidth = 1;
    tidBG.layer.borderColor = RGBCOLOR(179, 179, 179).CGColor;
    tidBG.image = bgImg;
    [self addSubview:tidBG];
    [tidBG release];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(tidBG.frame) + 8, CGRectGetMinY(tidBG.frame) + 6, self.frame.size.width - 18, self.frame.size.height - 12)];
    _textField.borderStyle = UITextBorderStyleNone;
    _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addSubview:_textField];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
