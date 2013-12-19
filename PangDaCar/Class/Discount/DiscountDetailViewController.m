//
//  DiscountDetailViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "DiscountDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Information.h"

@interface DiscountDetailViewController ()
{
    id discountdeailVoucher;
}
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
    [self initView];
    [self loadData];
}

-(void)initView
{
    UIView *bgView=[[[UIView alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 406+(iPhone5?88:0))] autorelease];
    bgView.backgroundColor=RGBCOLOR(247,247,247);
    bgView.layer.borderWidth=1;
    bgView.layer.borderColor=[RGBCOLOR(229,229, 229) CGColor];
    [self.view addSubview:bgView];
    
    UIScrollView *bgscroll=[[[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 406+(iPhone5?88:0))] autorelease];
    [bgView addSubview:bgscroll];
    
    titleLabel=[[[UILabel alloc] initWithFrame:CGRectMake(5.0, 10.0, 290.0, 40.0)] autorelease];
    titleLabel.textColor=[UIColor blackColor];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.numberOfLines=0;
    titleLabel.textAlignment=NSTextAlignmentCenter;
    [bgscroll addSubview:titleLabel];
    
    imageview=[[[UIImageView alloc] initWithFrame:CGRectMake(43.5, titleLabel.frame.origin.y+titleLabel.frame.size.height+5.0, 213.0, 122.5)] autorelease];
    [bgscroll addSubview:imageview];
    
    timeLabel=[[[UILabel alloc] initWithFrame:CGRectMake(5.0, imageview.frame.origin.y+imageview.frame.size.height+5.0, 290.0, 20.0)] autorelease];
    timeLabel.textColor=RGBCOLOR(163, 163, 163);
    timeLabel.backgroundColor=[UIColor clearColor];
    timeLabel.numberOfLines=1;
    timeLabel.font=[UIFont systemFontOfSize:13.0];
    timeLabel.textAlignment=NSTextAlignmentCenter;
    [bgscroll addSubview:timeLabel];
    
    contentLabel=[[[UILabel alloc] initWithFrame:CGRectMake(5.0, timeLabel.frame.origin.y+timeLabel.frame.size.height+5.0, 290.0, 20.0)] autorelease];
    contentLabel.textColor=RGBCOLOR(163, 163, 163);
    contentLabel.backgroundColor=[UIColor clearColor];
    contentLabel.numberOfLines=0;
    contentLabel.font=[UIFont systemFontOfSize:13.0];
    [bgscroll addSubview:contentLabel];
    
    bgscroll.contentSize=CGSizeMake(300.0, contentLabel.frame.origin.y+contentLabel.frame.size.height+5.0);
}

-(void)loadData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    DealReq *req=[[DealReq alloc] init];
    req.method = @"GET";
    
    discountdeailVoucher=[DHServiceInvocation invokeWithNAME:[NSString stringWithFormat:@"%@%@/",Invoke_Name_Deals,self.dicountId] requestMsg:req eventHandle:(id<ServiceInvokeHandle>)self];
}

- (void)didSuccess:(id)result voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == discountdeailVoucher)
    {
        discountdeailVoucher = nil;
        
        DealResp *resp=(DealResp *)result;
        if([resp.deals_list count]>0)
        {
            Information *infromation=[resp.deals_list objectAtIndex:0];
            titleLabel.text=infromation.title;
            timeLabel.text=[NSString stringWithFormat:@"活动日期:%@",infromation.release_time];
            contentLabel.text=infromation.content;
            [contentLabel sizeToFit];
        }
    }
}

- (void)didFailure:(NSError *)err voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == discountdeailVoucher)
    {
        discountdeailVoucher = nil;
        [MyUtil showAlert:[err domain]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
