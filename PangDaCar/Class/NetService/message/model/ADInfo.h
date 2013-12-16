//
//  ADInfo.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-31.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADInfo : NSObject

@property (nonatomic, copy) NSString *advertise_id;
@property (nonatomic, copy) NSString *advertise_title;
@property (nonatomic, copy) NSString *advertise_img_url;
@property (nonatomic, copy) NSString *advertise_url;
@property (nonatomic, copy) NSString *description;

- (void)fillFromDictionary:(NSDictionary *)dic;
- (NSDictionary *)dictionary;

@end
