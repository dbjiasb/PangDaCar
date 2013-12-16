//
//  Information.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Information : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *pic_url;
@property (nonatomic, copy) NSString *release_time;


- (void)fillFromDictionary:(NSDictionary *)dic;

@end
