//
//  LoginViewController.h
//  PangDaCar
//
//  Created by ysw on 13-12-18.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *userTf;
    UITextField *pwdTf;
}
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *pwd;
@end
