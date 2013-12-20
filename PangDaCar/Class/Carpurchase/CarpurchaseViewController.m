//
//  CarpurchaseViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-19.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "CarpurchaseViewController.h"
#import "AddBillViewController.h"
#import "PangDaCarDao.h"
#import "BillInfo.h"
#import "BillCell.h"

@interface CarpurchaseViewController ()<AddBillDelegate>
{
    UITableView *_tableView;
    
    int chooseTag;
    
    
    float totalFee;
    
    UILabel *totalLabel;
    UILabel *timelabel;
}

@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) NSDate *endDate;

@property (nonatomic, retain) NSMutableArray *dataList;

@end

@implementation CarpurchaseViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        chooseTag = 100;
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
    
    //得到最近的一个星期日和星期六
    [self getWeakInitStartAndEnd];

    [self initView];
    
    [self getData];
    [self loadTableView];
    
    //计算总消费
    [self caculateTotal];
}


- (void)getWeakInitStartAndEnd
{
    NSDate *now =[NSDate date];
    int week = [now weekday];
    
    int deltaWithMonday = week - 1;
    NSDate *mondayDate = [NSDate dateWithTimeInterval:- 60 * 60 * 24 * deltaWithMonday sinceDate:now];
    self.startDate = mondayDate;
    self.endDate = [NSDate dateWithTimeInterval:60 * 60 * 24 * 6 sinceDate:self.startDate];
    
    timelabel.text = [NSString stringWithFormat:@"%@~%@",[self.startDate dateString],[self.endDate dateString]];

}

- (void)getMonthInitStartAndEnd
{
    NSDate *now = [NSDate date];
    self.startDate = [now beginningOfMonth];
    self.endDate = [now endOfMonth];
    timelabel.text = [MyUtil GetNowYearAndMonth];

}

- (void)getYearInitStartAndEnd
{
    NSDate *now = [NSDate date];
    
    int year = [now getYear];
    NSString *start = [NSString stringWithFormat:@"%d-01-01 00:00:00",year];
    NSString *end = [NSString stringWithFormat:@"%d-12-31 00:00:00",year];
    
    self.startDate = [MyUtil getDateFromString:start];
    self.endDate = [MyUtil getDateFromString:end];
    
    timelabel.text = [MyUtil GetNowYear];

}

- (void)caculateTotal
{
    totalFee = 0;
    
    for (int i = 0 ; i < self.dataList.count; i++)
    {
        BillInfo *bill = self.dataList[i];
        
        totalFee += bill.fee;
    }
    
    totalLabel.text = [NSString stringWithFormat:@"%.2f 元",totalFee];
    
}

-(void)rightBtnClick
{
    AddBillViewController *controller = [[AddBillViewController alloc] init];
    controller.isAdd = YES;
    controller.delegate = self;
    
    [self.navigationController pushViewController:controller animated:YES];
    
}

-(void)initView
{
    UIButton *weekBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    weekBtn.frame=CGRectMake(12.0, 5.0, 98.5, 41);
    [weekBtn setTitle:@"周" forState:UIControlStateNormal];
    [weekBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected ];
    [weekBtn setTitleColor:RGBCOLOR(155, 155, 155) forState:UIControlStateNormal];
    weekBtn.selected = YES;
    weekBtn.tag = 100;
    [weekBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_grey_bg"] forState:UIControlStateNormal];
    [weekBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_white_bg"] forState:UIControlStateSelected];
    [weekBtn addTarget:self action:@selector(selectTypeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weekBtn];
    
    UIButton *monthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    monthBtn.frame = CGRectMake(weekBtn.frame.origin.x+weekBtn.frame.size.width, 5.0, 98.5, 41);
    monthBtn.tag = 101;
    [monthBtn setTitle:@"月" forState:UIControlStateNormal];
    [monthBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [monthBtn setTitleColor:RGBCOLOR(155, 155, 155) forState:UIControlStateNormal ];
    [monthBtn addTarget:self action:@selector(selectTypeAction:) forControlEvents:UIControlEventTouchUpInside];
    [monthBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_grey_bg"] forState:UIControlStateNormal];
    [monthBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_white_bg"] forState:UIControlStateSelected];
    [self.view addSubview:monthBtn];
    
    UIButton *yearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    yearBtn.frame = CGRectMake(monthBtn.frame.origin.x+monthBtn.frame.size.width, 5.0, 98.5, 41);
    yearBtn.tag = 102;
    [yearBtn setTitle:@"年" forState:UIControlStateNormal];
    [yearBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected ];
    [yearBtn setTitleColor:RGBCOLOR(155, 155, 155) forState:UIControlStateNormal];

    [yearBtn addTarget:self action:@selector(selectTypeAction:) forControlEvents:UIControlEventTouchUpInside];
    [yearBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_grey_bg"] forState:UIControlStateNormal];
    [yearBtn setBackgroundImage:[UIImage imageNamed:@"datebtn_white_bg"] forState:UIControlStateSelected];
    [self.view addSubview:yearBtn];
    
    UIView *bgView = [[[UIView alloc] initWithFrame:CGRectMake(13.0, weekBtn.frame.origin.y+weekBtn.frame.size.height, 294.5, 58.5)] autorelease];
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(5.0, 12.0, 39.0, 34.5);
    leftBtn.tag = 1;
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"leftarraw_btn_normal"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"leftarraw_btn_pressed"] forState:UIControlStateHighlighted];
    [bgView addSubview:leftBtn];
    [leftBtn addTarget:self action:@selector(chageDateRange:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.tag = 2;
    rightBtn.frame = CGRectMake(294.5-5.0-38.5, 12.0, 39.0, 34.5);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"rightarraw_btn_normal"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"rightarraw_btn_pressed"] forState:UIControlStateHighlighted];
    [bgView addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(chageDateRange:) forControlEvents:UIControlEventTouchUpInside];

    timelabel = [[[UILabel alloc] initWithFrame:CGRectMake(leftBtn.frame.origin.x+leftBtn.frame.size.width+5.0, 15.0, 197.0, 25.0)] autorelease];
    timelabel.text = [NSString stringWithFormat:@"%@~%@",[self.startDate dateString],[self.endDate dateString]];
    timelabel.font = [UIFont systemFontOfSize:15];
    timelabel.backgroundColor=[UIColor clearColor];
    timelabel.textAlignment = NSTextAlignmentCenter;
    timelabel.textColor=[UIColor blackColor];
    [bgView addSubview:timelabel];
    
    UIView *bgView2 = [[[UIView alloc] initWithFrame:CGRectMake(13.0, bgView.frame.origin.y+bgView.frame.size.height,294.5, 50.0)] autorelease];
    bgView2.backgroundColor = RGBCOLOR(210.0, 210.0, 210.0);
    [self.view addSubview:bgView2];
    
    UILabel *txtlabel=[[[UILabel alloc] initWithFrame:CGRectMake(5.0, 12.5, 75.0, 25.0)] autorelease];
    txtlabel.backgroundColor=[UIColor clearColor];
    txtlabel.textColor=[UIColor blackColor];
    txtlabel.text=@"总体支出";
    [bgView2 addSubview:txtlabel];
    
    totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 12.5, 210.0, 25)] ;
    totalLabel.backgroundColor = [UIColor clearColor];
    totalLabel.textColor = [UIColor blackColor];
    totalLabel.text = @"0元";
    totalLabel.textAlignment = NSTextAlignmentRight;
    [bgView2 addSubview:totalLabel];
    
}

- (void)chageDateRange:(UIButton *)button
{
    //向左
    if (button.tag == 1)
    {
        if (chooseTag == 100)
        {
            self.endDate = [NSDate dateWithTimeInterval:-60 * 60 * 24 sinceDate:self.startDate];
            self.startDate = [NSDate dateWithTimeInterval:-60 * 60 * 24 * 7 sinceDate:self.startDate];
            timelabel.text = [NSString stringWithFormat:@"%@~%@",[self.startDate dateString],[self.endDate dateString]];
        }
        else if(chooseTag == 101)
        {
            self.startDate = [self.startDate dateafterMonth:-1];
            self.endDate = [self.endDate dateafterMonth:-1];
            
            timelabel.text = [NSString stringWithFormat:@"%d年%02d月",[self.startDate getYear],[self.startDate getMonth]];
        }
        else
        {
            int year = [self.startDate getYear] - 1;
            NSString *start = [NSString stringWithFormat:@"%d-01-01 00:00:00",year];
            NSString *end = [NSString stringWithFormat:@"%d-12-31 00:00:00",year];
            
            self.startDate = [MyUtil getDateFromString:start];
            self.endDate = [MyUtil getDateFromString:end];
            
            timelabel.text = [NSString stringWithFormat:@"%d年",[self.startDate getYear]];
        }
    }
    
    //向右
    else
    {
        if (chooseTag == 100)
        {
            self.startDate = [NSDate dateWithTimeInterval:60 * 60 * 24 sinceDate:self.endDate];
            self.endDate = [NSDate dateWithTimeInterval:60 * 60 * 24 * 6 sinceDate:self.startDate];
            timelabel.text = [NSString stringWithFormat:@"%@~%@",[self.startDate dateString],[self.endDate dateString]];
        }
        else if(chooseTag == 101)
        {
            self.startDate = [self.startDate dateafterMonth:1];
            self.endDate = [self.endDate dateafterMonth:1];
            
            timelabel.text = [NSString stringWithFormat:@"%d年%02d月",[self.startDate getYear],[self.startDate getMonth]];
        }
        else
        {
            int year = [self.startDate getYear] + 1;
            NSString *start = [NSString stringWithFormat:@"%d-01-01 00:00:00",year];
            NSString *end = [NSString stringWithFormat:@"%d-12-31 00:00:00",year];
            
            self.startDate = [MyUtil getDateFromString:start];
            self.endDate = [MyUtil getDateFromString:end];
            
            timelabel.text = [NSString stringWithFormat:@"%d年",[self.startDate getYear]];
        }

    }
    
    
    [self getData];
}

- (void)loadTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(12.0, 156, 294.5, 250 + (iPhone5 ? 88:0)) style:UITableViewStylePlain] ;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

//年月周切换
- (void)selectTypeAction:(UIButton *)button
{
    UIButton *lastBtn = (UIButton *)[self.view viewWithTag:chooseTag];
    lastBtn.selected = NO;
    
    switch (button.tag)
    {
        case 100:
            [self getWeakInitStartAndEnd];
            break;
        case 101:
            [self getMonthInitStartAndEnd];
            break;
        case 102:
        {
            [self getYearInitStartAndEnd];
        }
            break;
            
        default:
            break;
    }
    
    button.selected = YES;
    chooseTag = button.tag;
    
    [self getData];
}

- (void)getData
{
    self.dataList = [[PangDaCarDao singleDao] getLocalBillsByStart:self.startDate end:self.endDate];
    [_tableView reloadData];
    
    [self caculateTotal];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self chooseBillWithIndexPath:indexPath];
}

- (void)chooseBillWithIndexPath:(NSIndexPath *)indexPath
{
    BillInfo *bill = [self.dataList objectAtIndex:indexPath.row];
    
    AddBillViewController *controller = [[AddBillViewController alloc] init];
    controller.isAdd = NO;
    controller.index = indexPath.row;
    controller.delegate = self;
    controller.bill = bill;
    
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

- (void)didAddBill:(BillInfo *)bill
{
    [self.dataList insertObject:bill atIndex:0];
    
    [_tableView reloadData];
    [self caculateTotal];
}

- (void)didEditBill:(BillInfo *)bill index:(NSInteger)index
{
    [_tableView reloadData];
    [self caculateTotal];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"BillCell";
    BillCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell)
    {
        cell=[BillCell cell];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    BillInfo *bill = self.dataList[indexPath.row];
    cell.iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"bill_icon_%02d",bill.type]];
    cell.dateLabel.text = bill.date;
    cell.priceLabel.text = [NSString stringWithFormat:@"%.2f元",bill.fee];
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tv editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
	return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle  forRowAtIndexPath:(NSIndexPath *)indexPath
{
    BillInfo *bill = [self.dataList objectAtIndex:indexPath.row];
    
    
    [[PangDaCarDao singleDao] deleteBill:bill];
    [self.dataList removeObject:bill];
    
    [tableView reloadData];
    [self caculateTotal];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return @"删除";
}

@end
