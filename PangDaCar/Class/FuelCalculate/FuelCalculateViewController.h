//
//  FuelCalculateViewController.h
//  PangDaCar
//
//  Created by ysw on 13-12-19.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FuelCalculateViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *distanceTf;
    UITextField *addSoilPriceTf;
    UITextField *unitPriceTf;
    UILabel *fuellLabel;
    UILabel *aveFuelLable;
    UILabel *aveFeeNumLabel;
}
@end
