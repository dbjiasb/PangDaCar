//
//  RequestMsg.m
//  JSONRPC_Test
//
//  Created by OuYiJian on 13-2-20.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "RequestMsg.h"
#import "ResponseMsg.h"
#import "Model_Delegate.h"
#import "MyDefaults.h"

@implementation RequestMsg

@synthesize responseMsgClass;

- (void) dealloc
{
    self._api_accept_type_ = nil;
    self.UUID = nil;
    self.imei = nil;
    self.access_token = nil;
    
    self.method = nil;
    
    [super dealloc];
}

- (id)init
{
    if (self = [super init])
    {
        self._api_accept_type_ = @"json";
        self.method = @"POST";
    }
    
    return self;
}

+ (id)shareInstance
{
    static dispatch_once_t pred;
    static RequestMsg *_requestMsg = nil;
    dispatch_once(&pred, ^{
        _requestMsg = [[RequestMsg alloc] init];
    });
    return _requestMsg;
}

- (NSDictionary*) dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    self.imei = [OpenUDID value];
    self.access_token = [MyDefaults getToken];
    
    if (self._api_accept_type_)
    {
        [dic addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"_api_accept_type_",nil]]];
    }

//    if (self.IMEI)
//    {
//        [dic setObject:self.IMEI forKey:@"IMEI"];
//    }
//    if (self.UUID) {
//        [dic setObject:self.UUID forKey:@"IMEI"];
//    }
//    if (self.access_token) {
//        [dic setObject:self.access_token forKey:@"IMEI"];
//    }
    
    return dic;
}

- (Class) responseMsgClass {
    
    if (responseMsgClass)
        return responseMsgClass;
    
    return ResponseMsg.class;
}

@end
