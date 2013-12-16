//
//  Message.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *msg_id;
@property (nonatomic, copy) NSString *msg_type;
@property (nonatomic, retain) NSNumber *msg_num;

- (void)fillFromDictionary:(NSDictionary *)dic;

@end
