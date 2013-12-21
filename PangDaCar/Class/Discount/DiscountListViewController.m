//
//  DiscountListViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "DiscountListViewController.h"
#import "DiscountDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "Information.h"

@interface DiscountListViewController ()
{
    id discountVoucher;
}
@end

@implementation DiscountListViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        totalArray=[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = RGBCOLOR(240, 240, 240);
    [self setCustomTitle:@"最新优惠"];
    [self setBackButton];
    
    table=[[[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0,320.0, 416.0+(iPhone5?88:0)) style:UITableViewStylePlain] autorelease];
    table.delegate=self;
    table.dataSource=self;
    table.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    
    [self loadData];
}

-(void)loadData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    DealReq *req=[[DealReq alloc] init];
    req.method = @"GET";
    
    NSString *newUrl = [Invoke_Name_Deals stringByReplacingOccurrencesOfString:@"UUID" withString:[MyDefaults getUserName]];
    discountVoucher=[DHServiceInvocation invokeWithNAME:newUrl requestMsg:req eventHandle:(id<ServiceInvokeHandle>)self];
}

- (void)didSuccess:(id)result voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == discountVoucher)
    {
        discountVoucher = nil;
        
        DealResp *resp=(DealResp *)result;
        [totalArray addObjectsFromArray:resp.deals_list];
        [table reloadData];
    }
}

- (void)didFailure:(NSError *)err voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == discountVoucher)
    {
        discountVoucher = nil;
        [MyUtil showAlert:[err domain]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [totalArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 87;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell)
    {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify] autorelease];
    }
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    cell.backgroundView=[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discount_cell_normal"]] autorelease];
    cell.selectedBackgroundView=[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discount_cell_pressed"]] autorelease];
    Information *information=[totalArray objectAtIndex:[indexPath row]];
    UIImageView *img=[[[UIImageView alloc] initWithFrame:CGRectMake(10.0, 6.5, 102.5, 74.0)] autorelease];
    [img setImageWithURL:[NSURL URLWithString:information.pic_url]];
    [cell.contentView addSubview:img];
    
    UILabel *titlelabel=[[[UILabel alloc] initWithFrame:CGRectMake(img.frame.size.width+img.frame.origin.x,15.0, 185.0, 25.0)] autorelease];
    titlelabel.numberOfLines=2;
    titlelabel.text=information.title;
    titlelabel.font=[UIFont systemFontOfSize:14.0];
    titlelabel.textColor=[UIColor blackColor];
    titlelabel.backgroundColor=[UIColor clearColor];
    [titlelabel sizeToFit];
    [cell.contentView addSubview:titlelabel];
    
    UILabel *timelabel=[[[UILabel alloc] initWithFrame:CGRectMake(img.frame.size.width+img.frame.origin.x, 65.0, 160.0, 20.0)] autorelease];
    timelabel.textColor=RGBCOLOR(131,131, 131);
    timelabel.font=[UIFont systemFontOfSize:12.0];
    timelabel.text=information.release_time;
    timelabel.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:timelabel];
    
    UIImageView *arrow =[[[UIImageView alloc] initWithFrame:CGRectMake(295.0, 30.0, 17.0, 17.0)] autorelease];
    arrow.image=[UIImage imageNamed:@"arrow"];
    [cell.contentView addSubview:arrow];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    Information *information=[totalArray objectAtIndex:[indexPath row]];
    
    DiscountDetailViewController *discountdetail=[[[DiscountDetailViewController alloc] init] autorelease];
    discountdetail.dicountId = information.id;
    [discountdetail setValue:information.id forKey:@"dicountId"];
    
    [self.navigationController pushViewController:discountdetail animated:YES];
}

-(void)dealloc
{
    [totalArray release];
    [super dealloc];
}

@end
