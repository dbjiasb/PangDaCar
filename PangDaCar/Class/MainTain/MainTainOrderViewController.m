//
//  MainTainOrderViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-18.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "MainTainOrderViewController.h"

@interface MainTainOrderViewController ()

@end

@implementation MainTainOrderViewController

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
    [self setCustomTitle:@"保养维修预约"];
    [self setRightBarBtnName:@"历史记录" selector:@selector(rightBtnClick)];
    [self setBackButton];
    [self initView];
}

-(void)initView
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake((320.0-216.0)/2,30.0,216.0, 80.0);
    [btn setImage:[UIImage imageNamed:@"order_btn_bg"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
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
