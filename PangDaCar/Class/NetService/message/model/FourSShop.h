//
//  FourSShop.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-20.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FourSShop : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *telephone;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *lng;
@property (nonatomic, copy) NSString *lat;

- (void)fillFromDictionary:(NSDictionary *)dic;

@end
