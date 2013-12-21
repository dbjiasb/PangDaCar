//
//  RoadSecureViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-18.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "RoadSecureViewController.h"

@interface RoadSecureViewController ()
{
    id secureStatusVoucher;
    id scoreVoucher;
}
@end

@implementation RoadSecureViewController

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
    [self setCustomTitle:@"道路救援"];
    [self setRightBarBtnName:@"历史记录" selector:@selector(rightBtnClick)];
    [self setBackButton];
    [self initView];
    [self getSecureStatue];
}

-(void)initView
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake((320.0-216.0)/2,15.0,216.0, 80.0);
    [btn setImage:[UIImage imageNamed:@"roadsecure_btn_bg"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    bgView=[[[UIView alloc] initWithFrame:CGRectMake(0.0, btn.frame.origin.y+btn.frame.size.height+15.0, 320.0, 416.0-btn.frame.origin.y-btn.frame.size.height-15.0+(iPhone5?88:0))] autorelease];
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
}

#pragma -mark add accepted View
-(void)addAcceptView:(NSString *)time titlecolor:(UIColor*)color
{
    UIView *bgview1=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 100.0)] autorelease];
    [bgView addSubview:bgview1];
    
    UILabel *titlelabel=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 30)] autorelease];
    titlelabel.text=@"救援已受理";
    titlelabel.textColor=color;
    titlelabel.font=[UIFont systemFontOfSize:22.0];
    titlelabel.backgroundColor=[UIColor clearColor];
    [bgview1 addSubview:titlelabel];
    
    UILabel *msglabel=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, titlelabel.frame.origin.y+titlelabel.frame.size.height+5.0, 300.0, 25.0)] autorelease];
    msglabel.textColor=color;
    msglabel.backgroundColor=[UIColor clearColor];
    msglabel.text=@"正在调配救援车前往救援，请耐心等候...";
    [bgview1 addSubview:msglabel];
    
    UILabel *timelabel=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, msglabel.frame.origin.y+msglabel.frame.size.height+5.0, 300.0, 25.0)] autorelease];
    timelabel.textColor=color;
    timelabel.backgroundColor=[UIColor clearColor];
    timelabel.text=time;
    [bgview1 addSubview:timelabel];
}

#pragma -mark add finished View
-(void)addFinishedView:(NSString *)time grade:(NSInteger)grade titlecolor:(UIColor*)color
{
    UIView *lineview=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 100.0, 320.0, 1.0)] autorelease];
    lineview.backgroundColor=RGBCOLOR(167.0, 167.0, 167.0);
    [bgView addSubview:lineview];
    
    UIView *bgview1=[[[UIView alloc] initWithFrame:CGRectMake(0.0, 101.0, 320.0, 115.0)] autorelease];
    [bgView addSubview:bgview1];
    
    UILabel *titlelabel=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 30)] autorelease];
    titlelabel.text=@"救援完成";
    titlelabel.textColor=color;
    titlelabel.font=[UIFont systemFontOfSize:22.0];
    titlelabel.backgroundColor=[UIColor clearColor];
    [bgview1 addSubview:titlelabel];
    
    UILabel *msglabel=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, titlelabel.frame.origin.y+titlelabel.frame.size.height+5.0, 300.0, 40.0)] autorelease];
    msglabel.textColor=color;
    msglabel.numberOfLines=2;
    msglabel.backgroundColor=[UIColor clearColor];
    msglabel.text=@"为了更好的为您提供服务，请您及时对我们的服务进行评价...";
    [bgview1 addSubview:msglabel];
    
    UILabel *timelabel=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, msglabel.frame.origin.y+msglabel.frame.size.height+5.0, 180, 25.0)] autorelease];
    timelabel.textColor=color;
    timelabel.backgroundColor=[UIColor clearColor];
    timelabel.text=time;
    [bgview1 addSubview:timelabel];
    
    UILabel *scorelabel=[[[UILabel alloc] initWithFrame:CGRectMake(240.0, msglabel.frame.origin.y+msglabel.frame.size.height+5.0, 70.0, 25.0)] autorelease];
    scorelabel.text=[NSString stringWithFormat:@"评分：%d",grade];
    scorelabel.textColor=color;
    scorelabel.backgroundColor=[UIColor clearColor];
    [bgview1 addSubview:scorelabel];
    
    UIButton *scorebtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    scorebtn.frame=CGRectMake(240.0, msglabel.frame.origin.y+msglabel.frame.size.height+5.0, 70.0, 25.0);
    [scorebtn setTitle:@"评分" forState:UIControlStateNormal];
    [bgview1 addSubview:scorebtn];
}

-(void)rightBtnClick
{
    
}

-(void)getSecureStatue
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    StolenStatusReq *req=[[[StolenStatusReq alloc] init] autorelease];
    req.method=@"GET";
    NSString *url = [Invoke_Name_SecureStatus stringByReplacingOccurrencesOfString:@"UUID" withString:[MyDefaults getUserName]];
    NSString *newUrl = [url stringByReplacingOccurrencesOfString:@"TUID" withString:[MyDefaults getTuid]];
    
    secureStatusVoucher=[DHServiceInvocation invokeWithNAME:newUrl requestMsg:req eventHandle:(id<ServiceInvokeHandle>)self];
    
}

- (void)didSuccess:(id)result voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == secureStatusVoucher)
    {
        secureStatusVoucher = nil;
        StolenStatusResp *resp=(StolenStatusResp *)result;
        [self addAcceptView:resp.rescue_time titlecolor:RGBCOLOR(172, 172, 172)];
        [self addFinishedView:resp.rescue_finish_time grade:resp.rescue_grade titlecolor:[UIColor blackColor]];
    }
}

- (void)didFailure:(NSError *)err voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == secureStatusVoucher)
    {
        secureStatusVoucher = nil;
        [MyUtil showAlert:[err domain]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
