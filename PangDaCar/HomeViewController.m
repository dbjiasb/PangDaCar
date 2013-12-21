//
//  ViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-14.
//  Copyright (c) 2013年 ysw. All rights reserved.
//
#define MainTain_Order_Tag 100001
#define CarPathRecord_Tag 100002
#define NewDiscount_Tag 100003
#define RoadSecure_Tag 100004
#define MainTain_Alert_Tag 100005
#define CarPurse_Tag 100006
#define Fuel_Tag 100007
#define More_Tag 100008

#import "HomeViewController.h"
#import "CarPathRecordViewController.h"
#import "MainTainAlertViewController.h"
#import "MoreViewController.h"
#import "DiscountListViewController.h"
#import "MainTainOrderViewController.h"
#import "LoginViewController.h"
#import "RoadSecureViewController.h"
#import "CarpurchaseViewController.h"
#import "FuelCalculateViewController.h"
#import "MyDefaults.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"
#import "ADInfo.h"

@interface HomeViewController ()
{
    id adVoucher;
}
@end

@implementation HomeViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        adArray=[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    adscoll=[[[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 195.0)] autorelease];
    adscoll.pagingEnabled=YES;
    //adscoll.delegate=self;
    adscoll.backgroundColor=[UIColor whiteColor];
    adscoll.showsHorizontalScrollIndicator=NO;
    adscoll.showsVerticalScrollIndicator=NO;
    [self.view addSubview:adscoll];
    
    [self initBtn];
    [self getAdFromFile];
}

-(void)initBtn
{
    UIButton *maintain_order_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    maintain_order_Btn.frame = CGRectMake(0.0, 200.0, 144.0,iPhone5?110.5:85);
    maintain_order_Btn.tag=MainTain_Order_Tag;
    [maintain_order_Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [maintain_order_Btn setImage:[UIImage imageNamed:iPhone5?@"maintain_icon1136":@"maintain_icon"] forState:UIControlStateNormal];
    [self.view addSubview:maintain_order_Btn];
    
    UIButton *carpath_record_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    carpath_record_Btn.frame=CGRectMake(maintain_order_Btn.frame.origin.x+maintain_order_Btn.frame.size.width+5.0, 200.0, 85.0, iPhone5?110.5:85);
    carpath_record_Btn.tag=CarPathRecord_Tag;
    [carpath_record_Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [carpath_record_Btn setImage:[UIImage imageNamed:iPhone5?@"carpath_icon1136":@"carpath_icon"] forState:UIControlStateNormal];
    [self.view addSubview:carpath_record_Btn];
    
    UIButton *newdiscount_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    newdiscount_Btn.frame=CGRectMake(carpath_record_Btn.frame.size.width+carpath_record_Btn.frame.origin.x+5.0,200.0,85.0,iPhone5?110.5:85);
    newdiscount_Btn.tag=NewDiscount_Tag;
    [newdiscount_Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [newdiscount_Btn setImage:[UIImage imageNamed:iPhone5?@"newdiscount_icon1136":@"newdiscount_icon"] forState:UIControlStateNormal];
    [self.view addSubview:newdiscount_Btn];
    
    UIButton *roadsecure_Btn =[UIButton buttonWithType:UIButtonTypeCustom];
    roadsecure_Btn.frame=CGRectMake(0.0, maintain_order_Btn.frame.origin.y+maintain_order_Btn.frame.size.height+5.0, 158.5, iPhone5?111.0:85.5);
    roadsecure_Btn.tag=RoadSecure_Tag;
    [roadsecure_Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [roadsecure_Btn setTitle:@"道路救援" forState:UIControlStateNormal];
    [roadsecure_Btn setImage:[UIImage imageNamed:iPhone5?@"roadsecure_icon1136":@"roadsecure_icon"] forState:UIControlStateNormal];
    [self.view addSubview:roadsecure_Btn];
    
    UIButton *maintain_alert_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    maintain_alert_Btn.frame=CGRectMake(roadsecure_Btn.frame.origin.x+roadsecure_Btn.frame.size.width+5.0, maintain_order_Btn.frame.origin.y+maintain_order_Btn.frame.size.height+5.0,158.5,iPhone5?111.0:85.5);
    maintain_alert_Btn.tag=MainTain_Alert_Tag;
    [maintain_alert_Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [maintain_alert_Btn setImage:[UIImage imageNamed:iPhone5?@"maintain_alert_icon1136":@"maintain_alert_icon"] forState:UIControlStateNormal];
    [self.view addSubview:maintain_alert_Btn];

    UIButton *carpurse_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    carpurse_Btn.frame=CGRectMake(0.0, roadsecure_Btn.frame.origin.y+roadsecure_Btn.frame.size.height+5.0, 85.0, iPhone5?110.5:85);
    carpurse_Btn.tag=CarPurse_Tag;
    [carpurse_Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [carpurse_Btn setImage:[UIImage imageNamed:iPhone5?@"carpurse_icon1136":@"carpurse_icon@2x"] forState:UIControlStateNormal];
    [self.view addSubview:carpurse_Btn];
    
    UIButton *fuel_calculator_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    fuel_calculator_Btn.frame=CGRectMake(carpurse_Btn.frame.size.width+carpurse_Btn.frame.origin.x+5.0, roadsecure_Btn.frame.origin.y+roadsecure_Btn.frame.size.height+5.0, 85.0, iPhone5?110.5:85);
    fuel_calculator_Btn.tag=Fuel_Tag;
    [fuel_calculator_Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [fuel_calculator_Btn setImage:[UIImage imageNamed:iPhone5?@"fuel_calculator_icon1136":@"fuel_calculator_icon@2x"] forState:UIControlStateNormal];
    [self.view addSubview:fuel_calculator_Btn];
    
    UIButton *more_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    more_Btn.frame=CGRectMake(fuel_calculator_Btn.frame.size.width+fuel_calculator_Btn.frame.origin.x+5.0, roadsecure_Btn.frame.origin.y+roadsecure_Btn.frame.size.height+5.0, 144.0, iPhone5?110.5:85);
    more_Btn.tag=More_Tag;
    [more_Btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [more_Btn setImage:[UIImage imageNamed:iPhone5?@"more_icon1136":@"more_icon@2x"] forState:UIControlStateNormal];
    [self.view addSubview:more_Btn];
}

-(void)btnClick:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    if(![MyDefaults isLogin])
    {
        LoginViewController *login=[[[LoginViewController alloc] init] autorelease];
        UINavigationController *loginNav=[[[UINavigationController alloc] initWithRootViewController:login] autorelease];
        [self presentViewController:loginNav animated:YES completion:^{
            
        }];
        return;
    }
    switch (btn.tag) {
        case MainTain_Order_Tag:
        {
            MainTainOrderViewController *maintainorder=[[[MainTainOrderViewController alloc] init] autorelease];
            UINavigationController *maintainorderNav=[[[UINavigationController alloc] initWithRootViewController:maintainorder] autorelease];
            [self presentViewController:maintainorderNav animated:YES completion:^{
                
            }];
        }
            break;
        case CarPathRecord_Tag:
        {
            
            CarPathRecordViewController *carpath=[[[CarPathRecordViewController alloc] init] autorelease];
            UINavigationController *carpathNav=[[[UINavigationController alloc] initWithRootViewController:carpath] autorelease];
            [self presentViewController:carpathNav animated:YES completion:^{
                
            }];
        }
            break;
        case NewDiscount_Tag:
        {
            DiscountListViewController *discountlist=[[[DiscountListViewController alloc] init] autorelease];
            UINavigationController *discountlistNav=[[[UINavigationController alloc] initWithRootViewController:discountlist] autorelease];
            [self presentViewController:discountlistNav animated:YES completion:^{
                
            }];
        }
            break;
        case RoadSecure_Tag:
        {
            RoadSecureViewController *roadsecure=[[[RoadSecureViewController alloc] init] autorelease];
            UINavigationController *roadsecureNav=[[[UINavigationController alloc] initWithRootViewController:roadsecure] autorelease];
            [self presentViewController:roadsecureNav animated:YES completion:^{
                
            }];
        }
            break;
        case MainTain_Alert_Tag:
        {
            MainTainAlertViewController *maintainalert=[[[MainTainAlertViewController alloc] init] autorelease];
            UINavigationController *maintainalertNav=[[[UINavigationController alloc] initWithRootViewController:maintainalert] autorelease];
            [self presentViewController:maintainalertNav animated:YES completion:^{
                
            }];
        }
            break;
        case CarPurse_Tag:
        {
            CarpurchaseViewController *carpurchase=[[[CarpurchaseViewController alloc] init] autorelease];
            UINavigationController *carpurcharNav=[[[UINavigationController alloc] initWithRootViewController:carpurchase] autorelease];
            [self presentViewController:carpurcharNav animated:YES completion:^{
                
            }];
        }
            break;
        case Fuel_Tag:
        {
            FuelCalculateViewController *fuelcalculate=[[[FuelCalculateViewController alloc] init] autorelease];
            UINavigationController *fuelcalculateNav=[[[UINavigationController alloc] initWithRootViewController:fuelcalculate] autorelease];
            [self presentViewController:fuelcalculateNav animated:YES completion:^{
                
            }];
        }
            break;
        case More_Tag:
        {
            MoreViewController *more=[[MoreViewController alloc] init];
            UINavigationController *moreNav=[[UINavigationController alloc] initWithRootViewController:more];
            [self presentViewController:moreNav animated:YES completion:^{
                
            }];
        }
            break;
        default:
            break;
    }
}

#pragma mark-readFile
-(void)getAdFromFile
{
    NSString *ceche = [MyUtil getCachePath];
    NSString *url = [NSString stringWithFormat:@"%@/lastAd.txt",ceche];
    NSArray *tempArray=[NSArray arrayWithContentsOfFile:url];
    for (int i = 0; i < [tempArray count]; i++)
    {
        NSDictionary *itemDic = tempArray[i];
        if (!ISNULL(itemDic))
        {
            ADInfo *adInfo = [[[ADInfo alloc] init] autorelease];
            
            [adInfo fillFromDictionary:itemDic];
            
            [adArray addObject:adInfo];
        }
    }
    if([adArray count]>0)
    {
        [self addViewToScroll:[adArray autorelease]];
    }
    [self loadData];
}

#pragma mark-loadData
-(void)loadData
{
    if([adArray count]==0)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    AdvertiseReq *avert =[[AdvertiseReq alloc] init];
    avert.method=@"GET";
    adVoucher=[DHServiceInvocation invokeWithNAME:Invoke_Name_GetAdvertise requestMsg:avert eventHandle:(id<ServiceInvokeHandle>)self];
}

- (void)didSuccess:(id)result voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == adVoucher)
    {
        adVoucher = nil;
        AdvertiseResp *resp = (AdvertiseResp *)result;
        [adscoll removeAllSubviews];
        [self addViewToScroll:resp.advertise_list];
    }
}

- (void)didFailure:(NSError *)err voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == adVoucher)
    {
        adVoucher = nil;
        [MyUtil showAlert:[err domain]];
    }
}

#pragma -mark UIScrollView add view
-(void)addViewToScroll:(NSArray *)array
{
    adscoll.contentSize = CGSizeMake(320.0*[array count], 195.0);
    for(int i=0;i<[array count];i++)
    {
        ADInfo *adInfo=[array objectAtIndex:i];
        UIImageView *adimg=[[UIImageView alloc] initWithFrame:CGRectMake(i*320.0f, 0.0f, 320.0f, adscoll.frame.size.height)];
        adimg.userInteractionEnabled=YES;
        [adimg setImageWithURL:[NSURL URLWithString:adInfo.advertise_img_url]];
        [adscoll addSubview:adimg];
        [adimg release];
    }
    UIPageControl *pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake(0.0f, 185, 320.0f, 10.0f)];
    pageControl.numberOfPages=[array count];
    pageControl.currentPage=0;
    [adscoll addSubview:pageControl];
    [pageControl release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [adArray release];
    [super dealloc];
}

@end
