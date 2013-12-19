//
//  CarpurchaseViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-19.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "CarpurchaseViewController.h"

@interface CarpurchaseViewController ()

@end

@implementation CarpurchaseViewController

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
    [self setCustomTitle:@"养车消费单"];
    [self setRightBarBtnName:@"新增记帐" selector:@selector(rightBtnClick)];
    [self setBackButton];
    [self initView];
}

-(void)rightBtnClick
{
    
}

-(void)initView
{
    UIButton *weekBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    weekBtn.frame=CGRectMake(12.0, 5.0, 98.5, 41);
    [weekBtn setTitle:@"周" forState:UIControlStateNormal];
    [weekBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [weekBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_white_bg"] forState:UIControlStateNormal];
    [weekBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_white_bg"] forState:UIControlStateHighlighted];
    [self.view addSubview:weekBtn];
    
    UIButton *monthBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    monthBtn.frame=CGRectMake(weekBtn.frame.origin.x+weekBtn.frame.size.width, 5.0, 98.5, 41);
    [monthBtn setTitle:@"月" forState:UIControlStateNormal];
    [monthBtn setTitleColor:RGBCOLOR(155, 155, 155) forState:UIControlStateNormal];
    [monthBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_grey_bg"] forState:UIControlStateNormal];
    [monthBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_grey_bg"] forState:UIControlStateHighlighted];
    [self.view addSubview:monthBtn];
    
    UIButton *yearBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    yearBtn.frame=CGRectMake(monthBtn.frame.origin.x+monthBtn.frame.size.width, 5.0, 98.5, 41);
    [yearBtn setTitle:@"年" forState:UIControlStateNormal];
    [yearBtn setTitleColor:RGBCOLOR(155, 155, 155) forState:UIControlStateNormal];
    [yearBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_grey_bg"] forState:UIControlStateNormal];
    [yearBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_grey_bg"] forState:UIControlStateHighlighted];
    [self.view addSubview:yearBtn];
    
    UIView *bgView=[[[UIView alloc] initWithFrame:CGRectMake(13.0, weekBtn.frame.origin.y+weekBtn.frame.size.height, 294.5, 58.5)] autorelease];
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(5.0, 12.0, 39.0, 34.5);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"leftarraw_btn_normal"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"leftarraw_btn_pressed"] forState:UIControlStateHighlighted];
    [bgView addSubview:leftBtn];
    
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(294.5-5.0-38.5, 12.0, 39.0, 34.5);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"rightarraw_btn_normal"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"rightarraw_btn_pressed"] forState:UIControlStateHighlighted];
    [bgView addSubview:rightBtn];
    
    UILabel *timelabel=[[[UILabel alloc] initWithFrame:CGRectMake(leftBtn.frame.origin.x+leftBtn.frame.size.width+5.0, 15.0, 197.0, 25.0)] autorelease];
    timelabel.backgroundColor=[UIColor clearColor];
    timelabel.textColor=[UIColor blackColor];
    [bgView addSubview:timelabel];
    
    UIView *bgView2=[[[UIView alloc] initWithFrame:CGRectMake(13.0, bgView.frame.origin.y+bgView.frame.size.height,294.5, 50.0)] autorelease];
    bgView2.backgroundColor=RGBCOLOR(210.0, 210.0, 210.0);
    [self.view addSubview:bgView2];
    
    UILabel *txtlabel=[[[UILabel alloc] initWithFrame:CGRectMake(5.0, 12.5, 75.0, 25.0)] autorelease];
    txtlabel.backgroundColor=[UIColor clearColor];
    txtlabel.textColor=[UIColor blackColor];
    txtlabel.text=@"总体支出";
    [bgView2 addSubview:txtlabel];
    
    UILabel *totalLabel=[[[UILabel alloc] initWithFrame:CGRectMake(80.0, 12.5, 210.0, 25)] autorelease];
    totalLabel.backgroundColor=[UIColor clearColor];
    totalLabel.textColor=[UIColor blackColor];
    totalLabel.text=@"0元";
    totalLabel.textAlignment=NSTextAlignmentRight;
    [bgView2 addSubview:totalLabel];
    
    UITableView *table=[[[UITableView alloc] initWithFrame:CGRectMake(12.0, bgView2.frame.origin.y+bgView2.frame.size.height, 294.5, 416.0-(bgView2.frame.origin.y+bgView2.frame.size.height)+(iPhone5?88:0)) style:UITableViewStylePlain] autorelease];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell)
    {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify] autorelease];
    }
    cell.textLabel.text=@"测试";
    return cell;
}

@end
