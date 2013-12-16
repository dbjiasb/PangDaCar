//
//  DHServiceInvocation.h
//  HotelManager
//
//  Created by Dragon Huang on 13-5-19.
//  Copyright (c) 2013年 baiwei.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ServiceInvokeHandle <NSObject>

@optional

- (void)didSuccess:(id)result;

- (void)didSuccess:(id)result voucher:(id)voucher;

- (void)didFailure:(NSError *)err;

- (void)didFailure:(NSError *)err voucher:(id)voucher;

//在数据解释出错的情况下，会检测是否实现此方法，如果有，将不再回调didFailure：和didFailure：voucher：
- (void)dealWithWrongFormat:(NSData *)data;
- (void)dealWithWrongFormat:(NSData *)data voucher:(id)voucher;

- (void)didCancel;

- (id)doConvertResult:(NSData *)data;

@end


@interface DHServiceInvocation : NSObject <NSURLConnectionDataDelegate>

+ (id) invokeWithNAME:(id)name requestMsg:(id)msg eventHandle:(id<ServiceInvokeHandle>)handle;
+ (void)cancelEventHandle:(id)param;
+ (void) cancel:(id)voucher;


@end
