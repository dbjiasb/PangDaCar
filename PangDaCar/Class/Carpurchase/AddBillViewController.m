//
//  AddBillViewController.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-29.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "AddBillViewController.h"
#import "CustomTextField.h"
#import "PangDaCarDao.h"
#import "BillInfo.h"
#import "PangDaCarDao.h"

@interface AddBillViewController () <UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
{
    UITextField *priceText;
    NSString *typeName;
    NSInteger type;
    
    UIImageView *iconView;
    
    UITextView *_textView;
    
    UIButton *typeButton;
    
    int initIndex;
    
    UILabel *typeLabel;
    UITableView *_tableView;
}


@end

@implementation AddBillViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        initIndex = 0;
        type = 0;
        typeName = @"加油";
        self.isAdd = YES;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setBackButton];
    [self setCustomTitle:@"记账"];
//    [self loadNormalBG];
    self.view.backgroundColor =  RGBCOLOR(241, 241, 241);
    
    [self setRightBarBtnName:@"保存" selector:@selector(save)];

    if(!self.isAdd)
    {
        type = self.bill.type;
        initIndex = type;
        NSArray *array = @[@"加油",@"洗车",@"停车",@"违章",@"保险",@"过路",@"维修",@"贷款",@"其他"];

        typeName = array[type];
    }
    
//    [self addBG];
    [self loadTableView];
    [self loadFooterView];

}

- (void)loadTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320 ,[MyUtil viewHeight] - 44) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)loadFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, [MyUtil viewHeight] - 44 - 44)];
    _tableView.tableFooterView = footerView;
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, 100, 20)];
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = RGBCOLOR(106, 106, 106);
    label1.text = @"支出费用：";
    [footerView addSubview:label1];
    [label1 release];
    
    CustomTextField *cusTextField = [[CustomTextField alloc] initWithFrame:CGRectMake(10, 35, 300, 40)];
    priceText = cusTextField.textField;
    priceText.keyboardType = UIKeyboardTypeASCIICapable;
    priceText.delegate = (id<UITextFieldDelegate>)self;
    cusTextField.textField.placeholder = @"请输入费用";
    [footerView addSubview:cusTextField];
    [cusTextField release];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(cusTextField.frame) + 10, 100, 20)];
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = RGBCOLOR(106, 106, 106);
    label2.text = @"备注：";
    [footerView addSubview:label2];
    [label2 release];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label2.frame) + 5, 300, 160)];
    _textView.text = @"请输入备注...";
    _textView.textColor = [UIColor grayColor];
    _textView.layer.borderWidth = 1;
    _textView.font = [UIFont systemFontOfSize:16];
    _textView.layer.borderColor = RGBCOLOR(179, 179, 179).CGColor;
    _textView.delegate = self;
    [footerView addSubview:_textView];

    if (!self.isAdd)
    {
        priceText.text = [NSString stringWithFormat:@"%.2f",self.bill.fee];
        _textView.text = self.bill.des;
        
    }
}

- (void)save
{
    if (!self.bill)
    {
        self.bill = [[[BillInfo alloc] init] autorelease];

    }
    NSString *description = _textView.text;
    float price = [priceText.text floatValue];
    if (price == 0) {
        [MyUtil showMessageBox:@"请输入大于0的金额!"];
        return;
    }
    
    self.bill.fee = price;
    self.bill.date = [MyUtil GetNowDate];
    self.bill.des = description;
    self.bill.type = type;
    self.bill.typeName = typeName;
    
    
    if (self.isAdd)
    {
        [[PangDaCarDao singleDao] insertBill:self.bill];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didAddBill:)])
        {
            [self.delegate didAddBill:self.bill];
        }
    }
    else
    {
        [[PangDaCarDao singleDao] updateBill:self.bill];

        if (self.delegate && [self.delegate respondsToSelector:@selector(didEditBill:index:)])
        {
            [self.delegate didEditBill:self.bill index:self.index];
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)chooseType
{
    [_textView resignFirstResponder];
    [priceText resignFirstResponder];
    
    float offsetY = [MyUtil isIOS7OrLater] ? 44 : -22;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.center = CGPointMake(160, [MyUtil viewHeight] / 2 + offsetY);
    }];

    UIView *chooseTypeView = [self.view viewWithTag:2233];
    if (chooseTypeView) {
        return;
    }
    
    
    [self showPicker];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string   // return NO to not change text
{
    
    if (textField.text.length > 8 && ![string isEqualToString:@""]) {
        
        return NO;
    }
    
    if (![string isEqualToString:@""])
    {
        char c = [string UTF8String][0];
        if ((c > 57 || c < 48) && c != 46)
        {
            [MyUtil showMessageBox:@"只能输入数字"];
            return NO;
        }
    }
    
    return YES;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    float offsetY = [MyUtil isIOS7OrLater] ? 42 : 104;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.center = CGPointMake(160, [MyUtil viewHeight] / 2 - offsetY);
    }];

    if ([textView.text isEqualToString:@"请输入备注..."])
    {
        textView.textColor = [UIColor blackColor];
        _textView.text = @"";
    }
    
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if (textView.text.length == 0)
    {
        _textView.text = @"请输入备注...";
        _textView.textColor = [UIColor grayColor];
    }

    float offsetY = [MyUtil isIOS7OrLater] ? 44 : -22;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.center = CGPointMake(160, [MyUtil viewHeight] / 2 + offsetY);
    }];
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        if (textView.text.length == 0)
        {
            _textView.text = @"请输入备注...";
            _textView.textColor = [UIColor grayColor];
        }
        
        float offsetY = [MyUtil isIOS7OrLater] ? 44 : -22;
        
        [UIView animateWithDuration:0.25 animations:^{
            self.view.center = CGPointMake(160, [MyUtil viewHeight] / 2 + offsetY);
        }];

        return NO;
    }
    
    return YES;
}


-(void)showPicker
{
    float deltaY = 0;//[MyUtil isIOS7] ? 64 : 0;
    
    UIView *chooseTypeView = [[UIView alloc] initWithFrame:self.view.bounds];
    chooseTypeView.tag = 2233;
    [self.view addSubview:chooseTypeView];
    [chooseTypeView release];
    
    float viewHeight = [MyUtil screenHeight] - 44;
    float viewWidth = [MyUtil screenWidth];
    float heightToHide = 216 + 44;
    
    chooseTypeView.center = CGPointMake(chooseTypeView.center.x, chooseTypeView.center.y + heightToHide);
    
    UIToolbar *customBar=[[UIToolbar alloc] initWithFrame:CGRectMake(0.0, viewHeight-heightToHide + deltaY, viewWidth, 44.0)];
    customBar.barStyle=UIBarStyleBlackTranslucent;
    [chooseTypeView addSubview:customBar];
    [customBar release];
    
    
    UIBarButtonItem *done=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction)];
    UIBarButtonItem *empty=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *save=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(confirmAction)];
    customBar.items=[NSArray arrayWithObjects:done,empty,save, nil];
    [done release];
    [empty release];
    [save release];
    
    UIPickerView* picker=[[UIPickerView alloc] initWithFrame:CGRectMake(0.0, viewHeight - 216 + deltaY, viewWidth, 216.0)];
    picker.showsSelectionIndicator=YES;
    picker.delegate   = (id <UIPickerViewDelegate>)self;
    picker.dataSource = (id<UIPickerViewDataSource>)self;
    picker.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:160/255.0 green:160/255.0 blue:160/255.0 alpha:.98];

    [chooseTypeView addSubview:picker];
    [picker release];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        chooseTypeView.center = CGPointMake(chooseTypeView.center.x, chooseTypeView.center.y - heightToHide);
        
    } completion:^(BOOL finished)
     {
//         [picker reloadAllComponents];
         [picker selectRow:type inComponent:0 animated:YES];
     }];
    
}

- (void)cancelAction
{
     type = initIndex;
    
    NSArray *array = @[@"加油",@"洗车",@"停车",@"违章",@"保险",@"过路",@"维修",@"贷款",@"其他"];
    typeName = array[type];
    
    typeLabel.text = typeName;
    [typeButton setTitle:typeName forState:UIControlStateNormal];
    iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"bill_icon_%02d",type]];

    [self hidePickView];
}

- (void)confirmAction
{
//    NSArray *array = @[@"加油",@"洗车",@"停车",@"违章",@"保险",@"过路",@"维修",@"贷款",@"其他"];
//    NSInteger type =  [array indexOfObject:typeName];
    
    initIndex = type;
    [self hidePickView];
}

-(void)hidePickView
{
    
    UIView *view = [self.view viewWithTag:2233];
    if (view){
        
        float heightToHide = 216 + 44;
        
        [UIView animateWithDuration:0.4 animations:^{
            view.center = CGPointMake(view.center.x, view.center.y + heightToHide);
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    }
    
}



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 9;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *array = @[@"加油",@"洗车",@"停车",@"违章",@"保险",@"过路",@"维修",@"贷款",@"其他"];
    
    return array[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSArray *array = @[@"加油",@"洗车",@"停车",@"违章",@"保险",@"过路",@"维修",@"贷款",@"其他"];
    typeName = array[row];
    
    typeLabel.text = typeName;
    [typeButton setTitle:typeName forState:UIControlStateNormal];
    iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"bill_icon_%02d",row]];
    type = row;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.backgroundColor = [UIColor clearColor];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 44 - 1, 320, 1)];
        line.backgroundColor = RGBACOLOR(216, 216, 216, 0.8);
        [cell addSubview:line];
        [line release];
        
        cell.textLabel.textColor = RGBCOLOR(106, 106, 106);
        typeLabel = cell.detailTextLabel;
    }
    
    cell.textLabel.text = @"选择类别";
    cell.detailTextLabel.text = @"加油";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self chooseType];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
