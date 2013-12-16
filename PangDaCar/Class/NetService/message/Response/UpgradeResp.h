//
//  UpgradeResp.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-6.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ResponseMsg.h"

@interface UpgradeResp : ResponseMsg

@property (nonatomic, copy) NSString *ver_num;
@property (nonatomic, copy) NSString *isforce;
@property (nonatomic, copy) NSString *download_url;
@property (nonatomic, copy) NSString *description;

@end
