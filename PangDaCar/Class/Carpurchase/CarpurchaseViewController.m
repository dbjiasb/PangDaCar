//
//  CarpurchaseViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-19.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "CarpurchaseViewController.h"

@interface CarpurchaseViewController ()

@end

@implementation CarpurchaseViewController

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
	self.view.backgroundColor = RGBCOLOR(240, 240, 240);
    [self setCustomTitle:@"养车消费单"];
    [self setRightBarBtnName:@"新增记帐" selector:@selector(rightBtnClick)];
    [self setBackButton];
}

-(void)rightBtnClick
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
