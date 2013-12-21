//
//  EditPwdViewController.h
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditPwdViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *pwdTf;
    UITextField *newpwdTf;
    UITextField *confirmpwdTf;
}
@property(nonatomic,copy)NSString *pwd;
@property(nonatomic,copy)NSString *newpwd;
@property(nonatomic,copy)NSString *confirmpwd;
@end
