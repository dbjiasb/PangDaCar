//
//  ResponseMsg.h
//  JSONRPC_Test
//
//  Created by OuYiJian on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model_Delegate.h"

@interface ResponseMsg : NSObject <FillFromDic>


@property (nonatomic, copy) NSString * resp_status; //ok


@property (nonatomic, retain) NSNumber * code;
@property (nonatomic, copy) NSString * retValue;

@property (nonatomic, copy) NSString *error_code;
@property (nonatomic, copy) NSString *error_desc;

- (void) fillFromDictionary:(NSDictionary*)dic;

@end
