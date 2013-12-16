//
//  TuInfo.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-24.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TuInfo : NSObject

@property (nonatomic, copy)NSString *uuid;
@property (nonatomic, copy)NSString *tu_id;
@property (nonatomic, copy)NSString *tu_label;
@property (nonatomic, copy)NSString *veh_no;
@property (nonatomic, copy)NSString *engine_no;
@property (nonatomic, copy)NSString *frame_no;
@property (nonatomic, copy)NSString *manufacturer_code;
@property (nonatomic, copy)NSString *vehicle_type;

- (void)fillFromDictionary:(NSDictionary *)dic;

@end
