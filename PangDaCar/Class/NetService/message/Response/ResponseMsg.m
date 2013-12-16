//
//  ResponseMsg.m
//  JSONRPC_Test
//
//  Created by OuYiJian on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ResponseMsg.h"

@implementation ResponseMsg


@synthesize code;

@synthesize resp_status;

@synthesize retValue;

- (void) fillFromDictionary:(NSDictionary*)dic
{
    self.resp_status = [dic valueForKey:@"resp_status"];

    self.code = [dic valueForKey:@"code"];
    self.retValue = [dic valueForKey:@"retValue"];

    self.error_code = [dic valueForKey:@"error_code"];
    self.error_desc = [dic valueForKey:@"error_desc"];
}

@end
