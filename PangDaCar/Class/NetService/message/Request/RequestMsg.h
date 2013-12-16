//
//  RequestMsg.h
//  JSONRPC_Test
//
//  Created by OuYiJian on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestMsgBasic <NSObject, ObjectToDic>

@required

- (Class) responseMsgClass;

@end



@interface RequestMsg : NSObject <RequestMsgBasic>


@property (nonatomic, assign) Class responseMsgClass;
@property (nonatomic, copy) NSString *_api_accept_type_;

@property (nonatomic, copy) NSString *imei; //手机标识
@property (nonatomic, copy) NSString *UUID;  //用户标识
@property (nonatomic, copy) NSString *access_token;//令牌

@property (nonatomic, copy) NSString *method;//提交方法// POST  GET


+ (id)shareInstance;

@end
