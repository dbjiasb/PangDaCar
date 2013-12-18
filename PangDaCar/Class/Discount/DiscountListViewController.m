//
//  DiscountListViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "DiscountListViewController.h"
#import "DiscountDetailViewController.h"

@interface DiscountListViewController ()

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
    
    UITableView *table=[[[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0,320.0, 416.0+(iPhone5?88:0)) style:UITableViewStylePlain] autorelease];
    table.delegate=self;
    table.dataSource=self;
    table.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
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
    UIImageView *img=[[[UIImageView alloc] initWithFrame:CGRectMake(10.0, 6.5, 102.5, 74.0)] autorelease];
    [cell.contentView addSubview:img];
    
    UILabel *titlelabel=[[[UILabel alloc] initWithFrame:CGRectMake(img.frame.size.width+img.frame.origin.x,15.0, 185.0, 25.0)] autorelease];
    titlelabel.numberOfLines=2;
    titlelabel.text=@"长安联手汽车之家领衔“双十一”购车狂欢盛宴";
    titlelabel.font=[UIFont systemFontOfSize:14.0];
    titlelabel.textColor=[UIColor blackColor];
    titlelabel.backgroundColor=[UIColor clearColor];
    [titlelabel sizeToFit];
    [cell.contentView addSubview:titlelabel];
    
    UILabel *timelabel=[[[UILabel alloc] initWithFrame:CGRectMake(img.frame.size.width+img.frame.origin.x, 65.0, 160.0, 20.0)] autorelease];
    timelabel.textColor=RGBCOLOR(131,131, 131);
    timelabel.font=[UIFont systemFontOfSize:12.0];
    timelabel.text=@"2013-10-25 15:33:33";
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
    DiscountDetailViewController *discountdetail=[[[DiscountDetailViewController alloc] init] autorelease];
    [self.navigationController pushViewController:discountdetail animated:YES];
}

@end
