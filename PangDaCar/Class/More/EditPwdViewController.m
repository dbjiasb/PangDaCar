//
//  EditPwdViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import "EditPwdViewController.h"
#import "MBProgressHUD.h"

@interface EditPwdViewController ()
{
    id editPwdVoucher;
}
@end

@implementation EditPwdViewController

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
    [self setCustomTitle:@"修改密码"];
    [self setBackButton];
    [self initTextField];
}

-(void)initTextField
{
    UIImageView *bgview1=[[[UIImageView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0, 60.0)] autorelease];
    bgview1.image=[UIImage imageNamed:@"tableview_cell_normal"];
    bgview1.userInteractionEnabled=YES;
    UILabel *lable1=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 17.5,90.0, 25.0)] autorelease];
    lable1.backgroundColor=[UIColor clearColor];
    lable1.text=@"原始密码:";
    lable1.textAlignment=NSTextAlignmentRight;
    lable1.textColor=[UIColor blackColor];
    [bgview1 addSubview:lable1];
    pwdTf=[[[UITextField alloc] initWithFrame:CGRectMake(lable1.frame.origin.x+lable1.frame.size.width+5.0, 15.5, 193.5, 29.0)] autorelease];
    pwdTf.background=[UIImage imageNamed:@"inputtext"];
    pwdTf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    [pwdTf setValue:[NSNumber numberWithInt:3] forKey:@"_paddingLeft"];
    pwdTf.secureTextEntry=YES;
    pwdTf.delegate=self;
    [bgview1 addSubview:pwdTf];
    [self.view addSubview:bgview1];
    
    UIImageView *bgview2=[[[UIImageView alloc] initWithFrame:CGRectMake(0.0,bgview1.frame.origin.y+bgview1.frame.size.height,320.0, 60.0)] autorelease];
    bgview2.image=[UIImage imageNamed:@"tableview_cell_normal"];
    bgview2.userInteractionEnabled=YES;
    UILabel *lable2=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 17.5,90.0, 25.0)] autorelease];
    lable2.backgroundColor=[UIColor clearColor];
    lable2.text=@"新密码:";
    lable2.textAlignment=NSTextAlignmentRight;
    lable2.textColor=[UIColor blackColor];
    [bgview2 addSubview:lable2];
    newpwdTf=[[[UITextField alloc] initWithFrame:CGRectMake(lable2.frame.origin.x+lable2.frame.size.width+5.0, 15.5,193.5, 29.0)] autorelease];
    newpwdTf.background=[UIImage imageNamed:@"inputtext"];
    newpwdTf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    newpwdTf.delegate=self;
    newpwdTf.secureTextEntry=YES;
    [newpwdTf setValue:[NSNumber numberWithInt:3] forKey:@"_paddingLeft"];
    [bgview2 addSubview:newpwdTf];
    [self.view addSubview:bgview2];
    
    UIImageView *bgview3=[[[UIImageView alloc] initWithFrame:CGRectMake(0.0,bgview2.frame.origin.y+bgview2.frame.size.height,320.0, 60.0)] autorelease];
    bgview3.image=[UIImage imageNamed:@"tableview_cell_normal"];
    bgview3.userInteractionEnabled=YES;
    UILabel *lable3=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 17.5,90.0, 25.0)] autorelease];
    lable3.backgroundColor=[UIColor clearColor];
    lable3.text=@"确认新密码:";
    lable3.textAlignment=NSTextAlignmentRight;
    lable3.textColor=[UIColor blackColor];
    [bgview3 addSubview:lable3];
    confirmpwdTf=[[[UITextField alloc] initWithFrame:CGRectMake(lable3.frame.origin.x+lable3.frame.size.width+5.0, 15.5,193.5, 29.0)] autorelease];
    confirmpwdTf.background=[UIImage imageNamed:@"inputtext"];
    confirmpwdTf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    confirmpwdTf.delegate=self;
    confirmpwdTf.secureTextEntry=YES;
    [confirmpwdTf setValue:[NSNumber numberWithInt:3] forKey:@"_paddingLeft"];
    [bgview3 addSubview:confirmpwdTf];
    [self.view addSubview:bgview3];
    
    UIButton *confirmBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmBtn.frame=CGRectMake(13.0,bgview3.frame.origin.y+bgview3.frame.size.height+10.0, 294.0, 49.0);
    [confirmBtn setTitle:@"完成修改" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setBackgroundImage:[UIImage imageNamed:@"btnbg"] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font=[UIFont systemFontOfSize:20.0];
    [confirmBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(editPwdVoucher)
    {
        [DHServiceInvocation cancel:editPwdVoucher];
    }
    
}

-(void)btnClick:(id)sender
{
    self.pwd=pwdTf.text;
    self.newpwd=newpwdTf.text;
    self.confirmpwd=confirmpwdTf.text;
    if(self.pwd.length==0)
    {
        [MyUtil showAlert:@"请输入原始密码！"];
        return;
    }
    if(self.newpwd.length==0)
    {
        [MyUtil showAlert:@"请输入新密码！"];
        return;
    }
    if(![self.newpwd isEqualToString:self.confirmpwd])
    {
        [MyUtil showAlert:@"新密码和确认密码不一致！"];
        return;
    }
    [self loadAction];
}

#pragma -mark loadData
-(void)loadAction
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    EditPwdReq *req=[[EditPwdReq alloc] init];
    req.old_pwd=self.pwd;
    req.new_pwd=self.newpwd;
    
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [pwdTf resignFirstResponder];
    [newpwdTf resignFirstResponder];
    [confirmpwdTf resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([textField.text length] > 20 && ![string isEqualToString:@""])
    {
        return NO;
    }
    return YES;
}

-(void)dealloc
{
    self.pwd=nil;
    self.newpwd=nil;
    self.confirmpwd=nil;
    [super dealloc];
}

@end
