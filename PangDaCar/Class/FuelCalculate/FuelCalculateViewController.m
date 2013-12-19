//
//  FuelCalculateViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-19.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "FuelCalculateViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface FuelCalculateViewController ()

@end

@implementation FuelCalculateViewController

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
    [self setCustomTitle:@"油耗计算"];
    [self setBackButton];
    [self initViews];
}

-(void)initViews
{
    UILabel *label1=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 200.0, 25.0)] autorelease];
    label1.textColor=[UIColor blackColor];
    label1.backgroundColor=[UIColor clearColor];
    label1.text=@"本次行驶(公里):";
    [self.view addSubview:label1];
    
    UIView *distancebgView=[[[UIView alloc] initWithFrame:CGRectMake(10.0, label1.frame.origin.y+label1.frame.size.height+3.0, 300.0, 40.0)] autorelease];
    distancebgView.layer.borderWidth=1;
    distancebgView.backgroundColor=[UIColor whiteColor];
    distancebgView.layer.borderColor=[RGBCOLOR(218,218, 218) CGColor];
    [self.view addSubview:distancebgView];
    
    distanceTf=[[[UITextField alloc] initWithFrame:CGRectMake(3.0, 0.0, 294.0, 40.0)] autorelease];
    distanceTf.delegate=self;
    distanceTf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    distanceTf.borderStyle=UITextBorderStyleNone;
    [distancebgView addSubview:distanceTf];
    
    UILabel *label2=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, distancebgView.frame.origin.y+distancebgView.frame.size.height+5.0, 200.0, 25.0)] autorelease];
    label2.textColor=[UIColor blackColor];
    label2.backgroundColor=[UIColor clearColor];
    label2.text=@"加油花费(元):";
    [self.view addSubview:label2];
    
    UIView *addSoilPricebgView=[[[UIView alloc] initWithFrame:CGRectMake(10.0, label2.frame.origin.y+label2.frame.size.height+3.0, 300.0, 40.0)] autorelease];
    addSoilPricebgView.layer.borderWidth=1;
    addSoilPricebgView.backgroundColor=[UIColor whiteColor];
    addSoilPricebgView.layer.borderColor=[RGBCOLOR(218,218, 218) CGColor];
    [self.view addSubview:addSoilPricebgView];
    
    addSoilPriceTf=[[[UITextField alloc] initWithFrame:CGRectMake(3.0, 0.0, 294.0, 40.0)] autorelease];
    addSoilPriceTf.delegate=self;
    addSoilPriceTf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    addSoilPriceTf.borderStyle=UITextBorderStyleNone;
    [addSoilPricebgView addSubview:addSoilPriceTf];

    UILabel *label3=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, addSoilPricebgView.frame.origin.y+addSoilPricebgView.frame.size.height+5.0, 200.0, 25.0)] autorelease];
    label3.textColor=[UIColor blackColor];
    label3.backgroundColor=[UIColor clearColor];
    label3.text=@"当前油价(元/升):";
    [self.view addSubview:label3];
    
    UIView *unitPricebgView=[[[UIView alloc] initWithFrame:CGRectMake(10.0, label3.frame.origin.y+label3.frame.size.height+3.0, 300.0, 40.0)] autorelease];
    unitPricebgView.layer.borderWidth=1;
    unitPricebgView.backgroundColor=[UIColor whiteColor];
    unitPricebgView.layer.borderColor=[RGBCOLOR(218,218, 218) CGColor];
    [self.view addSubview:unitPricebgView];
    
    unitPriceTf=[[[UITextField alloc] initWithFrame:CGRectMake(3.0, 0.0, 294.0, 40.0)] autorelease];
    unitPriceTf.delegate=self;
    unitPriceTf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    unitPriceTf.borderStyle=UITextBorderStyleNone;
    [unitPricebgView addSubview:unitPriceTf];
    
    UIButton *confirmBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmBtn.frame=CGRectMake(10.0,unitPricebgView.frame.origin.y+unitPricebgView.frame.size.height+10.0, 300.0, 40.0);
    [confirmBtn setTitle:@"油耗计算" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setBackgroundImage:[UIImage imageNamed:@"btnbg"] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font=[UIFont systemFontOfSize:20.0];
    [confirmBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    
    UILabel *label4=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, confirmBtn.frame.origin.y+confirmBtn.frame.size.height+5.0, 200.0, 25.0)] autorelease];
    label4.textColor=[UIColor blackColor];
    label4.backgroundColor=[UIColor clearColor];
    label4.text=@"计算结果:";
    [self.view addSubview:label4];
    
    UIView *resultBgView=[[[UIView alloc] initWithFrame:CGRectMake(10.0,label4.frame.origin.y+label4.frame.size.height, 300.0, 107.0)] autorelease];
    resultBgView.layer.borderColor=[RGBCOLOR(218,218, 218) CGColor];
    resultBgView.layer.borderWidth=1;
    [self.view addSubview:resultBgView];
    
    NSArray *keys1=[NSArray arrayWithObjects:@"加油量",@"本次平均耗油",@"平均每公里耗油", nil];
    NSArray *keys2=[NSArray arrayWithObjects:@"升",@"升每公里",@"元/百公里", nil];
    for(int i=0;i<3;i++)
    {
        
    }
    
    UIView *lineview1=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 35.0, 300.0, 1.0)] autorelease];
    lineview1.backgroundColor=RGBCOLOR(218,218, 218);
    [resultBgView addSubview:lineview1];
    
    UIView *lineview2=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 70.0, 300.0, 1.0)] autorelease];
    lineview2.backgroundColor=RGBCOLOR(218,218, 218);
    [resultBgView addSubview:lineview2];
    
    UIView *lineview3=[[[UIView alloc] initWithFrame:CGRectMake(130.0, 0.0, 1.0, 107.0)] autorelease];
    lineview3.backgroundColor=RGBCOLOR(218,218, 218);
    [resultBgView addSubview:lineview3];
    
    UILabel *resultTxt1=[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 4.5, 130.0, 25.0)] autorelease];
    resultTxt1.textColor=[UIColor blackColor];
    resultTxt1.backgroundColor=[UIColor clearColor];
    resultTxt1.text=@"加油量";
    resultTxt1.textAlignment=NSTextAlignmentCenter;
    [resultBgView addSubview:resultTxt1];
    
    UILabel *resultTxt2=[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 4.5+35.0, 130.0, 25.0)] autorelease];
    resultTxt2.textColor=[UIColor blackColor];
    resultTxt2.backgroundColor=[UIColor clearColor];
    resultTxt2.text=@"本次平均耗油";
    resultTxt2.textAlignment=NSTextAlignmentCenter;
    [resultBgView addSubview:resultTxt2];
    
    UILabel *resultTxt3=[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 4.5+35.0*2, 130.0, 25.0)] autorelease];
    resultTxt3.textColor=[UIColor blackColor];
    resultTxt3.backgroundColor=[UIColor clearColor];
    resultTxt3.text=@"平均每公里耗油";
    resultTxt3.textAlignment=NSTextAlignmentCenter;
    [resultBgView addSubview:resultTxt3];
    
    resultValue1=[[[UILabel alloc] initWithFrame:CGRectMake(lineview3.frame.origin.x+lineview3.frame.size.width, 4.5, 85, 25.0)] autorelease];
    resultValue1.textColor=[UIColor blueColor];
    resultValue1.backgroundColor=[UIColor redColor];
    resultValue1.textAlignment=NSTextAlignmentCenter;
    resultValue1.font=[UIFont systemFontOfSize:15.0];
    [resultBgView addSubview:resultValue1];
    
    UILabel *resultTxt4=[[[UILabel alloc] initWithFrame:CGRectMake(resultValue1.frame.origin.x+resultValue1.frame.size.width, 4.5, 85, 25.0)] autorelease];
    resultTxt4.textColor=[UIColor blackColor];
    resultTxt4.backgroundColor=[UIColor clearColor];
    resultTxt4.text=@"升";
    resultTxt4.font=[UIFont systemFontOfSize:15.0];
    [resultBgView addSubview:resultTxt4];
    
    resultValue2=[[[UILabel alloc] initWithFrame:CGRectMake(lineview3.frame.origin.x+lineview3.frame.size.width, 4.5+35.0, 85, 25.0)] autorelease];
    resultValue2.textColor=[UIColor blueColor];
    resultValue2.backgroundColor=[UIColor redColor];
    resultValue2.textAlignment=NSTextAlignmentCenter;
    resultValue2.font=[UIFont systemFontOfSize:15.0];
    [resultBgView addSubview:resultValue2];
    
    UILabel *resultTxt5=[[[UILabel alloc] initWithFrame:CGRectMake(resultValue2.frame.origin.x+resultValue2.frame.size.width,4.5+35.0,85, 25.0)] autorelease];
    resultTxt5.textColor=[UIColor blackColor];
    resultTxt5.backgroundColor=[UIColor clearColor];
    resultTxt5.font=[UIFont systemFontOfSize:15.0];
    resultTxt5.text=@"升/百公里";
    [resultBgView addSubview:resultTxt5];
    
    resultValue3=[[[UILabel alloc] initWithFrame:CGRectMake(lineview3.frame.origin.x+lineview3.frame.size.width, 4.5+35.0*2, 85, 25.0)] autorelease];
    resultValue3.textColor=[UIColor blueColor];
    resultValue3.backgroundColor=[UIColor redColor];
    resultValue3.textAlignment=NSTextAlignmentCenter;
    resultValue3.font=[UIFont systemFontOfSize:15.0];
    [resultBgView addSubview:resultValue3];
    
    UILabel *resultTxt6=[[[UILabel alloc] initWithFrame:CGRectMake(resultValue3.frame.origin.x+resultValue3.frame.size.width,4.5+35.0*2,85, 25.0)] autorelease];
    resultTxt6.textColor=[UIColor blackColor];
    resultTxt6.backgroundColor=[UIColor clearColor];
    resultTxt6.font=[UIFont systemFontOfSize:15.0];
    resultTxt6.text=@"元/百公里";
    [resultBgView addSubview:resultTxt6];
    
    
}

-(void)btnClick:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame=textField.superview.frame;
    int offset=frame.origin.y+80.0-(self.view.frame.size.height-216.0);//键盘顶部与textfiled的距离
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.3];
    float width=self.view.frame.size.width;
    float height=self.view.frame.size.height;
    if(offset>0)
    {
        CGRect rect=CGRectMake(0.0, -offset, width, height);
        self.view.frame=rect;
    }
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self closekeyboard];
    return YES;
}

-(void)closekeyboard
{
    [distanceTf resignFirstResponder];
    [addSoilPriceTf resignFirstResponder];
    [unitPriceTf resignFirstResponder];
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.3];
    float width=self.view.frame.size.width;
    float height=self.view.frame.size.height;
    CGRect rect=CGRectMake(0.0, 0.0, width, height);
    self.view.frame=rect;
    [UIView commitAnimations];
}

@end
