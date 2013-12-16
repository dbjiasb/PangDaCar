//
//  ViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-14.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *maintain_order_Btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    maintain_order_Btn.frame=CGRectMake(0.0, 0.0, 320.0, 40.0);
    [maintain_order_Btn setTitle:@"保养预约" forState:UIControlStateNormal];
    [self.view addSubview:maintain_order_Btn];
    
    UIButton *carpath_record_Btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    carpath_record_Btn.frame=CGRectMake(0.0, maintain_order_Btn.frame.origin.y+maintain_order_Btn.frame.size.height+5.0, 320.0, 40.0);
    [carpath_record_Btn setTitle:@"行车记录" forState:UIControlStateNormal];
    [self.view addSubview:carpath_record_Btn];
    
    UIButton *newdiscount_Btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    newdiscount_Btn.frame=CGRectMake(0.0, carpath_record_Btn.frame.size.height+carpath_record_Btn.frame.origin.y, 320.0, 40.0);
    [newdiscount_Btn setTitle:@"最新优惠" forState:UIControlStateNormal];
    [self.view addSubview:newdiscount_Btn];
    
    UIButton *roadsecure_Btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    roadsecure_Btn.frame=CGRectMake(0.0, newdiscount_Btn.frame.origin.y+newdiscount_Btn.frame.size.height, 320.0, 40.0);
    [roadsecure_Btn setTitle:@"道路救援" forState:UIControlStateNormal];
    [self.view addSubview:roadsecure_Btn];
    
    UIButton *maintain_alert_Btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    maintain_alert_Btn.frame=CGRectMake(0.0, roadsecure_Btn.frame.origin.y+roadsecure_Btn.frame.size.height, 320.0, 40.0);
    [maintain_alert_Btn setTitle:@"保养维修提醒" forState:UIControlStateNormal];
    [self.view addSubview:maintain_alert_Btn];
    
    UIButton *carpurse_Btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    carpurse_Btn.frame=CGRectMake(0.0, maintain_alert_Btn.frame.origin.y+maintain_alert_Btn.frame.size.height, 320.0, 40.0);
    [carpurse_Btn setTitle:@"养车消费单" forState:UIControlStateNormal];
    [self.view addSubview:carpurse_Btn];
    
    UIButton *fuel_calculator_Btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    fuel_calculator_Btn.frame=CGRectMake(0.0, carpurse_Btn.frame.origin.y+carpurse_Btn.frame.size.height, 320.0, 40.0);
    [fuel_calculator_Btn setTitle:@"油耗计算器" forState:UIControlStateNormal];
    [self.view addSubview:fuel_calculator_Btn];
    
    UIButton *more_Btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    more_Btn.frame=CGRectMake(0.0, carpurse_Btn.frame.origin.y+carpurse_Btn.frame.size.height, 320.0, 40.0);    
    [more_Btn setTitle:@"更多" forState:UIControlStateNormal];
    [self.view addSubview:more_Btn];     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
