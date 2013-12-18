//
//  DiscountDetailViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "DiscountDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DiscountDetailViewController ()

@end

@implementation DiscountDetailViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = RGBCOLOR(240,240,240);
    [self setCustomTitle:@"优惠详情"];
    [self setBackButton];
    
    UIView *bgView=[[[UIView alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 406+(iPhone5?88:0))] autorelease];
    bgView.backgroundColor=RGBCOLOR(247,247,247);
    bgView.layer.borderWidth=1;
    bgView.layer.borderColor=[RGBCOLOR(229,229, 229) CGColor];
    [self.view addSubview:bgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
