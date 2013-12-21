//
//  CarInfoViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "CarInfoViewController.h"

@interface CarInfoViewController ()
{
    id editPwdVoucher;
}
@end

@implementation CarInfoViewController

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = RGBCOLOR(240,240,240);
    [self setCustomTitle:@"车辆信息"];
    [self setBackButton];
    
    [self initLabel];
    UITableView *table=[[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 416.0+(iPhone5?88:0)) style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    table.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
}

-(void)initLabel
{
    if(carModel)
    {
        [carModel removeFromSuperview];
        carModel=nil;
    }
    carModel=[[UILabel alloc] initWithFrame:CGRectMake(105.0, 11.0, 190.0, 25.0)];
    carModel.textColor=[UIColor blackColor];
    carModel.backgroundColor=[UIColor clearColor];
    
    if(carType)
    {
        [carType removeFromSuperview];
        carType=nil;
    }
    carType=[[UILabel alloc] initWithFrame:CGRectMake(105.0, 11.0, 190.0, 25.0)];
    carType.textColor=[UIColor blackColor];
    carType.backgroundColor=[UIColor clearColor];
    
    if(carColor)
    {
        [carColor removeFromSuperview];
        carColor=nil;
    }
    carColor=[[UILabel alloc] initWithFrame:CGRectMake(105.0, 11.0, 190.0, 25.0)];
    carColor.textColor=[UIColor blackColor];
    carColor.backgroundColor=[UIColor clearColor];
    
    if(carNumType)
    {
        [carNumType removeFromSuperview];
        carNumType=nil;
    }
    carNumType=[[UILabel alloc] initWithFrame:CGRectMake(105.0, 11.0, 190.0, 25.0)];
    carNumType.textColor=[UIColor blackColor];
    carNumType.backgroundColor=[UIColor clearColor];
    
    if(carNum)
    {
        [carNum removeFromSuperview];
        carNum=nil;
    }
    carNum=[[UILabel alloc] initWithFrame:CGRectMake(105.0, 11.0, 190.0, 25.0)];
    carNum.textColor=[UIColor blackColor];
    carNum.backgroundColor=[UIColor clearColor];
    
    if(carEngineNum)
    {
        [carEngineNum removeFromSuperview];
        carEngineNum=nil;
    }
    carEngineNum=[[UILabel alloc] initWithFrame:CGRectMake(105.0, 11.0, 190.0, 25.0)];
    carEngineNum.textColor=[UIColor blackColor];
    carEngineNum.backgroundColor=[UIColor clearColor];
    
    if(carFrameNum)
    {
        [carFrameNum removeFromSuperview];
        carFrameNum=nil;
    }
    carFrameNum=[[UILabel alloc] initWithFrame:CGRectMake(105.0, 11.0, 190.0, 25.0)];
    carFrameNum.textColor=[UIColor blackColor];
    carFrameNum.backgroundColor=[UIColor clearColor];
}

#pragma -mark loadData
-(void)loadAction
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    EditPwdReq *req=[[EditPwdReq alloc] init];
    
    NSString *newUrl = [Invoke_Name_EditPwd stringByReplacingOccurrencesOfString:@"UUID" withString:[MyDefaults getUserName]];
    editPwdVoucher = [DHServiceInvocation invokeWithNAME:newUrl
                                              requestMsg:req
                                             eventHandle:(id<ServiceInvokeHandle>)self];
}

- (void)didSuccess:(id)result voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == editPwdVoucher)
    {
        editPwdVoucher = nil;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didFailure:(NSError *)err voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == editPwdVoucher)
    {
        editPwdVoucher = nil;
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
    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 47.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell)
    {
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    for(UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    if([indexPath row]%2==0)
    {
        cell.backgroundView=[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg_white"]] autorelease];
    }
    else
    {
        cell.backgroundView=[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg_black"]] autorelease];
    }
    UILabel *titlelabel=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 11.0, 90.0, 25.0)] autorelease];
    titlelabel.backgroundColor=[UIColor clearColor];
    titlelabel.textColor=[UIColor blackColor];
    titlelabel.textAlignment=NSTextAlignmentRight;
    [cell.contentView addSubview:titlelabel];
    if([indexPath row]==0)
    {
        titlelabel.text=@"车型:";
    }
    else if ([indexPath row]==1)
    {
        titlelabel.text=@"车款:";
    }
    else if ([indexPath row]==2)
    {
        titlelabel.text=@"车身颜色:";
    }
    else if ([indexPath row]==3)
    {
        titlelabel.text=@"车牌类型:";
    }
    else if ([indexPath row]==4)
    {
        titlelabel.text=@"车牌号:";
    }
    else if ([indexPath row]==5)
    {
        titlelabel.text=@"发动机号:";
    }
    else if ([indexPath row]==6)
    {
        titlelabel.text=@"车架号:";
    }
    return cell;
}

-(void)dealloc
{
    [carModel release];
    [carType release];
    [carColor release];
    [carNumType release];
    [carNum release];
    [carEngineNum release];
    [carFrameNum release];
    [super dealloc];
}

@end
