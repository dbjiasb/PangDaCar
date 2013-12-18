//
//  CarInfoViewController.h
//  PangDaCar
//
//  Created by ysw on 13-12-17.
//  Copyright (c) 2013年 ysw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *carModel;
    UILabel *carType;
    UILabel *carColor;
    UILabel *carOutput;
    UILabel *carSoilType;
    UILabel *carNumType;
    UILabel *carNum;
    UILabel *carEngineNum;
    UILabel *carFrameNum;
}
@end
