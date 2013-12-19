//
//  LoginViewController.m
//  PangDaCar
//
//  Created by ysw on 13-12-18.
//  Copyright (c) 2013年 ysw. All rights reserved.
//
#define CheckTag 100001
#define ConfirmTag 100002

#import "LoginViewController.h"

@interface LoginViewController ()
{
    id loginVoucher;
}
@end

@implementation LoginViewController

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
    [self setCustomTitle:@"登陆"];
    [self setBackButton];
    [self initView];
}

-(void)initView
{
    UIImageView *bgview1=[[[UIImageView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0, 60.0)] autorelease];
    bgview1.image=[UIImage imageNamed:@"tableview_cell_normal"];
    bgview1.userInteractionEnabled=YES;
    UILabel *lable1=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 17.5,90.0, 25.0)] autorelease];
    lable1.backgroundColor=[UIColor clearColor];
    lable1.text=@"用户名称:";
    lable1.textAlignment=NSTextAlignmentRight;
    lable1.textColor=[UIColor blackColor];
    [bgview1 addSubview:lable1];
    userTf=[[[UITextField alloc] initWithFrame:CGRectMake(lable1.frame.origin.x+lable1.frame.size.width+5.0, 15.5, 193.5, 29.0)] autorelease];
    userTf.background=[UIImage imageNamed:@"inputtext"];
    userTf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    [userTf setValue:[NSNumber numberWithInt:3] forKey:@"_paddingLeft"];
    userTf.delegate=self;
    [bgview1 addSubview:userTf];
    [self.view addSubview:bgview1];
    
    UIImageView *bgview2=[[[UIImageView alloc] initWithFrame:CGRectMake(0.0,bgview1.frame.origin.y+bgview1.frame.size.height,320.0, 60.0)] autorelease];
    bgview2.image=[UIImage imageNamed:@"tableview_cell_normal"];
    bgview2.userInteractionEnabled=YES;
    UILabel *lable2=[[[UILabel alloc] initWithFrame:CGRectMake(10.0, 17.5,90.0, 25.0)] autorelease];
    lable2.backgroundColor=[UIColor clearColor];
    lable2.text=@"密码:";
    lable2.textAlignment=NSTextAlignmentRight;
    lable2.textColor=[UIColor blackColor];
    [bgview2 addSubview:lable2];
    pwdTf=[[[UITextField alloc] initWithFrame:CGRectMake(lable2.frame.origin.x+lable2.frame.size.width+5.0, 15.5,193.5, 29.0)] autorelease];
    pwdTf.background=[UIImage imageNamed:@"inputtext"];
    pwdTf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    pwdTf.delegate=self;
    pwdTf.secureTextEntry=YES;
    [pwdTf setValue:[NSNumber numberWithInt:3] forKey:@"_paddingLeft"];
    [bgview2 addSubview:pwdTf];
    [self.view addSubview:bgview2];
    
    UIButton *saveBtn=[UIButton buttonWithType:UIButtonTypeInfoDark];
    saveBtn.frame=CGRectMake(20.0, bgview2.frame.origin.y+bgview2.frame.size.height+20.0, 23.5, 22.5);
    [saveBtn setImage:[UIImage imageNamed:@"unchecked_icon"] forState:UIControlStateNormal];
    [saveBtn setImage:[UIImage imageNamed:@"checked_icon"] forState:UIControlStateSelected];
    saveBtn.tag=CheckTag;
    saveBtn.selected=NO;
    [saveBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    
    UILabel *label=[[[UILabel alloc] initWithFrame:CGRectMake(saveBtn.frame.origin.x+saveBtn.frame.size.width+10.0, bgview2.frame.origin.y+bgview2.frame.size.height+21.0, 80.0, 20)] autorelease];
    label.textColor=[UIColor blackColor];
    label.backgroundColor=[UIColor clearColor];
    label.text=@"记住密码";
    [self.view addSubview:label];
    
    UIButton *confirmBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmBtn.frame=CGRectMake(13.0,saveBtn.frame.origin.y+saveBtn.frame.size.height+10.0, 294.0, 49.0);
    [confirmBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setBackgroundImage:[UIImage imageNamed:@"btnbg"] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font=[UIFont systemFontOfSize:20.0];
    confirmBtn.tag=ConfirmTag;
    [confirmBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(loginVoucher)
    {
        [DHServiceInvocation cancel:loginVoucher];
    }
    
}

-(void)btnClick:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    if(btn.tag==CheckTag)
    {
        btn.selected=!btn.selected;
    }
    else if (btn.tag==ConfirmTag)
    {
        self.username=userTf.text;
        self.pwd=pwdTf.text;
        if(ISNULL(self.username))
        {
            [MyUtil showAlert:@"请输入用户名"];
            return;
        }
        if(ISNULL(self.pwd))
        {
            [MyUtil showAlert:@"请输入密码"];
        }
        [userTf resignFirstResponder];
        [pwdTf resignFirstResponder];
        [self loginAction];
    }
}

- (void)loginAction
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    LoginReq *req = [[LoginReq alloc] init];
    req.uuid = self.username;
    req.password = self.pwd;
    
    loginVoucher = [DHServiceInvocation invokeWithNAME:Invoke_Name_Login
                             requestMsg:req
                            eventHandle:(id<ServiceInvokeHandle>)self];
}

- (void)didSuccess:(id)result voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == loginVoucher)
    {
        loginVoucher = nil;
        
        LoginResp *resp = (LoginResp *)result;
        [MyDefaults setUserName:resp.uuid];
        [MyDefaults setTuid:resp.tuid];
        [MyDefaults setToken:resp.access_token];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (void)didFailure:(NSError *)err voucher:(id)voucher
{
    [MBProgressHUD hideHUDForView:self.view animated:NO];
    if (voucher == loginVoucher)
    {
        loginVoucher = nil;
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
    [userTf resignFirstResponder];
    [pwdTf resignFirstResponder];
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
    self.username=nil;
    self.pwd=nil;
    [super dealloc];
}

@end
