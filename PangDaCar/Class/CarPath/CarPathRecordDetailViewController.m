//
//  CarPathRecordDetailViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-16.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "CarPathRecordDetailViewController.h"

@interface CarPathRecordDetailViewController ()

@end

@implementation CarPathRecordDetailViewController

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
    [self setCustomTitle:@"记录详情"];
    [self setBackButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
