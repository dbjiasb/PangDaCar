//
//  CarPathRecordViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-16.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "CarPathRecordViewController.h"
#import "CarPathRecordDetailViewController.h"
#import "MyUtil.h"

@interface CarPathRecordViewController ()

@end

@implementation CarPathRecordViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        totalArray = [[NSMutableArray alloc] initWithObjects:@"2013年12月25号",@"2013年12月24号",@"2013年12月23号",nil];
//        self.title=@"行车记录";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(240,240,240);
    [self setCustomTitle:@"行车记录"];
    [self setBackButton];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 410.0+(iPhone5?88:0)) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
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
    return [totalArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell)
    {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify] autorelease];
    }
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    UILabel *label=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 17.5, 200.0, 25.0)] autorelease];
    label.textColor=[UIColor blackColor];
    label.text=[totalArray objectAtIndex:[indexPath row]];
    label.backgroundColor=[UIColor clearColor];
    [cell.contentView addSubview:label];
    
    UIImageView *arrow =[[[UIImageView alloc] initWithFrame:CGRectMake(280.0, 21.5, 17.0, 17.0)] autorelease];
    arrow.image=[UIImage imageNamed:@"arrow"];
    [cell.contentView addSubview:arrow];
    
    cell.backgroundView=[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableview_cell_normal"]] autorelease];
    cell.selectedBackgroundView=[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableview_cell_pressed"]] autorelease];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CarPathRecordDetailViewController *recorddetail=[[CarPathRecordDetailViewController alloc] init];
    [self.navigationController pushViewController:recorddetail animated:YES];
    [recorddetail release];
}

-(void)dealloc
{
    [totalArray release];
    [super dealloc];
}
@end
