//
//  CarShopItem.h
//  Chinatsp
//
//  Created by chinatsp on 13-11-1.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarShopItem : NSObject

@property (nonatomic, copy) NSString  *carId;
@property (nonatomic, copy) NSString *carName;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *thumbUrl;
@property (nonatomic, copy) NSString *downloadUrl;
@property (nonatomic, copy) NSString *version;

@property (nonatomic, assign) NSInteger state;//0 没下载 1 下载中 2 已经下载 3 暂停
@property (nonatomic, assign) float progress;//下载百分比  0-1
@property (nonatomic, assign) float progressNum;//下载量
@property (nonatomic, assign) float total;//下载总量

@property (nonatomic, copy) NSString *fileName;

- (void)fillFromDictionary:(NSDictionary *)dic;
- (NSDictionary *)dictionary;

@end
