//
//  MainTainAlertViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-16.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "MainTainAlertViewController.h"

@interface MainTainAlertViewController ()

@end

@implementation MainTainAlertViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        totalArray=[[NSMutableArray alloc] init];
        for(int i=0;i<3;i++)
        {
            NSDictionary *nd=[NSDictionary dictionaryWithObjectsAndKeys:@"2013-08-09",@"time",@"为了更好的为你提供服务,请及时给我们的服务评价",@"des",nil];
            [totalArray addObject:nd];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = RGBCOLOR(240,240,240);
    [self setCustomTitle:@"保养维修提醒"];
    [self setRightBarBtnName:@"预约保养" selector:@selector(rightBtnClick)];
    [self setBackButton];
    
    UITableView *table=[[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 416.0+(iPhone5?88:0)) style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:table];
}

-(void)rightBtnClick
{
    
}

-(void)loadData
{
    
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
    UITableViewCell *cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
    UILabel *time=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 25.0)] autorelease];
    time.backgroundColor=[UIColor clearColor];
    time.textColor=[UIColor blackColor];
    time.text=[[totalArray objectAtIndex:[indexPath row]] objectForKey:@"time"];
    [cell.contentView addSubview:time];
    
    UILabel *content=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, time.frame.origin.y+time.frame.size.height, 300.0, 25.0)] autorelease];
    content.numberOfLines=0;
    content.textColor=[UIColor blackColor];
    content.text=[[totalArray objectAtIndex:[indexPath row]] objectForKey:@"des"];
    [content sizeToFit];
    [cell.contentView addSubview:content];
    
    cell.backgroundView.backgroundColor=RGBCOLOR(240,240,240);
    
    cell.selectedBackgroundView=[[[UIView alloc] initWithFrame:cell.frame] autorelease];
    
    UIView *lineview=[[[UIView alloc] initWithFrame:CGRectMake(0.0, content.frame.origin.y+content.frame.size.height+3.0, 320.0, 1.0)] autorelease];
    lineview.backgroundColor=RGBCOLOR(233,233,233);
    [cell.contentView addSubview:lineview];
    
    cell.selectedBackgroundView.backgroundColor=RGBCOLOR(181,185,188);
    CGFloat height=lineview.frame.origin.y+lineview.frame.size.height;
    CGRect rect=CGRectMake(0.0f, 0.0f, cell.bounds.size.width, height);
    cell.bounds=rect;
    return cell;
}

-(void)dealloc
{
    [totalArray release];
    [super dealloc];
}
@end
