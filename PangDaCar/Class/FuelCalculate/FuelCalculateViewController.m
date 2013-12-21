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
        UILabel *resultTxt=[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 4.5+35.0*i, 115.0, 25.0)] autorelease];
        resultTxt.textColor=[UIColor blackColor];
        resultTxt.backgroundColor=[UIColor clearColor];
        resultTxt.text=[keys1 objectAtIndex:i];
        resultTxt.font=[UIFont systemFontOfSize:15.0];
        resultTxt.textAlignment=NSTextAlignmentCenter;
        [resultBgView addSubview:resultTxt];
        if(i==0)
        {
            fuellLabel=[[[UILabel alloc] initWithFrame:CGRectMake(resultTxt.frame.origin.x+resultTxt.frame.size.width+3.0, 4.5, 108, 25.0)] autorelease];
            fuellLabel.textColor=[UIColor blueColor];
            fuellLabel.backgroundColor=[UIColor clearColor];
            fuellLabel.textAlignment=NSTextAlignmentCenter;
            fuellLabel.font=[UIFont systemFontOfSize:15.0];
            [resultBgView addSubview:fuellLabel];
        }
        else if (i==1)
        {
            aveFuelLable=[[[UILabel alloc] initWithFrame:CGRectMake(resultTxt.frame.origin.x+resultTxt.frame.size.width+3.0, 4.5+35.0,108, 25.0)] autorelease];
            aveFuelLable.textColor=[UIColor blueColor];
            aveFuelLable.backgroundColor=[UIColor clearColor];
            aveFuelLable.textAlignment=NSTextAlignmentCenter;
            aveFuelLable.font=[UIFont systemFontOfSize:15.0];
            [resultBgView addSubview:aveFuelLable];
        }
        else if (i==2)
        {
            aveFeeNumLabel=[[[UILabel alloc] initWithFrame:CGRectMake(resultTxt.frame.origin.x+resultTxt.frame.size.width+3.0, 4.5+35.0*2,108, 25.0)] autorelease];
            aveFeeNumLabel.textColor=[UIColor blueColor];
            aveFeeNumLabel.backgroundColor=[UIColor clearColor];
            aveFeeNumLabel.textAlignment=NSTextAlignmentCenter;
            aveFeeNumLabel.font=[UIFont systemFontOfSize:15.0];
            [resultBgView addSubview:aveFeeNumLabel];
        }
        if(i!=0)
        {
            UIView *lineview=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 35.0*i, 300.0, 1.0)] autorelease];
            lineview.backgroundColor=RGBCOLOR(218,218, 218);
            [resultBgView addSubview:lineview];
        }
        
        UILabel *resultTxt1=[[[UILabel alloc] initWithFrame:CGRectMake(resultTxt.frame.origin.x+resultTxt.frame.size.width+113.0, 4.5+35.0*i, 73, 25.0)] autorelease];
        resultTxt1.textColor=[UIColor blackColor];
        resultTxt1.backgroundColor=[UIColor clearColor];
        resultTxt1.text=[keys2 objectAtIndex:i];
        resultTxt1.font=[UIFont systemFontOfSize:15.0];
        [resultBgView addSubview:resultTxt1];
    }
    
    UIView *lineview2=[[[UIView alloc] initWithFrame:CGRectMake(115.0, 0.0, 1.0, 107.0)] autorelease];
    lineview2.backgroundColor=RGBCOLOR(218,218, 218);
    [resultBgView addSubview:lineview2];
}

#pragma mark-Calculator Data
-(void)btnClick:(id)sender
{
    NSString *distanceStr=distanceTf.text;
    NSString *addsoilPriceStr=addSoilPriceTf.text;
    NSString *unitpriceStr=unitPriceTf.text;
    
    float distance=[distanceStr floatValue];
    float addsoilPrice=[addsoilPriceStr floatValue];
    float unitprice=[unitpriceStr floatValue];
    
    if(distanceStr.length==0||distance==0)
    {
        [MyUtil showMessageBox:@"请输入公里数！"];
        return;
    }
    if(addsoilPriceStr.length==0||addsoilPrice==0)
    {
        [MyUtil showMessageBox:@"请输入加油费用！"];
        return;
    }
    if(unitpriceStr.length==0||unitprice==0)
    {
        [MyUtil showMessageBox:@"请输入当前油价！"];
        return;
    }
    [self resignAllField];
    
    float fuelNum = addsoilPrice/unitprice;
    float aveFuel = fuelNum/distance*100;
    float aveFee = aveFuel*unitprice;
    
    fuellLabel.text=[NSString stringWithFormat:@"%.2f",fuelNum];
    aveFuelLable.text=[NSString stringWithFormat:@"%.2f",aveFuel];
    aveFeeNumLabel.text=[NSString stringWithFormat:@"%.2f",aveFee];
}

-(void)resignAllField
{
    [distanceTf resignFirstResponder];
    [addSoilPriceTf resignFirstResponder];
    [unitPriceTf resignFirstResponder];
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

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField.text.length>10 && ![string isEqualToString:@""])
    {
        return NO;
    }
    if(![string isEqualToString:@""])
    {
        char c=[string UTF8String][0];
        if((c>57 || c<48) && c!=46)
        {
            [MyUtil showMessageBox:@"只能输入数字"];
            return NO;
        }
    }
    return YES;
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
