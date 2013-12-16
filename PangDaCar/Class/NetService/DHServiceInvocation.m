//
//  DHServiceInvocation.m
//  HotelManager
//
//  Created by Dragon Huang on 13-5-19.
//  Copyright (c) 2013年 baiwei.Yuan Wen. All rights reserved.
//

#import "DHServiceInvocation.h"
#import "config.h"
#import "RequestMsg.h"
#import "JSONKit.h"
#import "NSString+URL.h"
#import "CheckNetwork.h"

#pragma mark - RequstTask

#define canResponse(__task, __method)       __task && \
[__task isMemberOfClass:RequstTask.class] && \
__task.eventHandle && \
[__task.eventHandle respondsToSelector:@selector(__method)]


@interface RequstTask : NSObject

@property (nonatomic, retain) NSString * key;

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) id param;
@property (nonatomic, assign) id<ServiceInvokeHandle> eventHandle;
@property (nonatomic, retain) NSURLConnection * connection;

@property (nonatomic, readonly) NSMutableData * cache;

@property (nonatomic, assign) BOOL didFailure;

@property (nonatomic, assign) BOOL runOnBackground;

@end

@implementation RequstTask

@synthesize key;

@synthesize name;
@synthesize param;
@synthesize eventHandle = _eventHandle;
@synthesize connection;

@synthesize cache;

- (id) init {
    if (self = [super init]) {
        self.didFailure = NO;
        self.runOnBackground = NO;
        cache = [[NSMutableData alloc] init];
    }
    return self;
}

- (void) dealloc {
    
    
    [super dealloc];
}

- (id<ServiceInvokeHandle>) eventHandle {
    
    @try {
        BOOL test; // 无用的
        test = [_eventHandle respondsToSelector:@selector(didSuccess:)];
        test = [_eventHandle respondsToSelector:@selector(didSuccess:voucher:)];
        test = [_eventHandle respondsToSelector:@selector(didFailure:)];
        test = [_eventHandle respondsToSelector:@selector(didFailure:voucher:)];
        test = [_eventHandle respondsToSelector:@selector(didCancel)];
    }
    @catch (NSException * exception) {
        NSLog(@"%@", [exception description]);
        return nil;
    }
    
    return _eventHandle;
}

@end



static NSMutableDictionary * _taskDic = nil;//存放所有任务
static DHServiceInvocation * _service = nil;//请求实例

RequstTask * _getTask(NSURLConnection *conn) {
    RequstTask * task = nil;
    NSArray * values = [_taskDic allValues];
    for (RequstTask * t in values) {
        if (t.connection == conn) {
            task = t;
            break;
        }
    }
    return task;
};

RequstTask * _getTaskByVoucher(id voucher) {
    return [_taskDic objectForKey:voucher];
}


@implementation DHServiceInvocation


+ (void) initialize
{
    _taskDic = [[NSMutableDictionary alloc] initWithCapacity:5];
    _service = [[DHServiceInvocation alloc] init];
    
}

+ (void) cancel:(id)param {
    
    if (![param isKindOfClass:NSObject.class])
        return;
    
    RequstTask * task = _getTaskByVoucher(param); // 取回当前任务
    if (task) {
        [task.connection cancel]; // 取消连接
        NSLog(@"User cancel %@", task.key);
    } else {
        return;
    }
    
    BOOL canResp = canResponse(task, didCancel);
    if (canResp) {
        [task.eventHandle didCancel];
    }
    
    [_taskDic removeObjectForKey:task.key]; // 释放该任务
}

+ (void)cancelEventHandle:(id)param
{
    
    if (![param isKindOfClass:NSObject.class])
        return;
    RequstTask * task = _getTaskByVoucher(param); // 取回当前任务
    if (task) {
        task.eventHandle = nil; // 取消回调
        NSLog(@"User cancel EventHandle %@ ", task.key);
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}



+ (id) invokeWithNAME:(id)name requestMsg:(id)msg eventHandle:(id<ServiceInvokeHandle>)handle
{
    if(![CheckNetwork isExistenceNetwork])
    {
//        NSLog(@"没有网络");
//        NSError *error = [NSError errorWithDomain:@"您的网络不给力，请稍后重试"
//                                             code:-1
//                                         userInfo:nil];
//        //数据出错
//        if(handle && [handle respondsToSelector:@selector(didFailure:voucher:)])
//        {
//            [handle didFailure:error
//                       voucher:error];
//            return error;
//        }
//        else if(handle && [handle respondsToSelector:@selector(didFailure:)])
//        {
//            [handle didFailure:error];
//        }
//        
//        return error;
    }
    
    // 初始化一个任务
    RequstTask *task = [[[RequstTask alloc] init] autorelease];
    task.name = name;
    task.param = msg;
    task.eventHandle = handle;
    
    
    int32_t i32max = INT32_MAX;
    int32_t random = ((int32_t)arc4random()) % i32max;
    id ret = [NSString stringWithFormat:@"%@[%o]", name, random];
    
    NSString * url = [NSString stringWithFormat:@"%@", (NSString *)name];
    
    // 初始化一个请求
    NSLog(@"Connection start with %@",  url);
    //    NSURL *nsUrl = [NSURL URLWithString:url];
    //    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    
    NSMutableURLRequest *request = [self requestWithURL:url param:msg];
    
    // 初始化一个连接(包括请求的内容)
    NSURLConnection *conn = [[[NSURLConnection alloc] initWithRequest:request delegate:_service startImmediately:NO] autorelease];
    
    if (conn)
    {
        task.connection = conn;
        [conn start]; // 打开连接
        task.key = ret;
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [_taskDic setValue:task forKey:task.key];
    } else
    {
        return nil;
    }
    
    return ret;
}

+ (NSMutableURLRequest *)requestWithURL:(NSString *)url param:(id)param
{
    
    NSMutableURLRequest *request = nil;
    if ([param isKindOfClass:[RequestMsg class]])
    {//
        
        //GET || DELETE
        if (![((RequestMsg *)param).method isEqualToString:@"POST"])
        {
            NSMutableString *temParamString = [NSMutableString string];
            NSDictionary *values = [param dictionary]; //得到参数列表
            
            //组合
            int keyCount = 0;
            for (NSString *key in [values allKeys])
            {
                keyCount ++;
                [temParamString appendFormat:@"%@=%@",key,[values objectForKey:key]];
                if (keyCount < [[values allKeys] count]) {
                    [temParamString appendString:@"&"];
                }
            }
            
            if (temParamString.length > 0)
            {
                url = [[NSString stringWithFormat:@"%@?%@",url,temParamString] URLEncodedString];
            }
            NSLog(@"param:%@",url);

            request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
            [request setHTTPMethod:((RequestMsg *)param).method];
           
            
            if (((RequestMsg *)param).access_token)
            {
                NSString *par = [NSString stringWithFormat:@"access_token=%@",((RequestMsg *)param).access_token];

                [request addValue:par forHTTPHeaderField:@"Cookie"];
            }
            
            if (((RequestMsg *)param).imei)
            {
                NSString *par = [NSString stringWithFormat:@"customer_key=%@",((RequestMsg *)param).imei];
                [request addValue:par forHTTPHeaderField:@"Cookie"];
            }

//            [request setValue:@"access_token=f4f96b182f1c46b6;customer_key=2c36ab3fdbd0465914d5585cb10b5240d7b6b37b" forHTTPHeaderField:@"Cookie"];
            NSLog(@"%@",request.allHTTPHeaderFields);
        }
        else
        {
            request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0f];
            
            [self prepareRequest:request param:param];
        }
    }
    
    return request;
}

+ (void) prepareRequest:(NSMutableURLRequest *)req param:(id )param {
    
    if ([param isKindOfClass:[RequestMsg class]])
    {
        // 普通的表单请求
        NSDictionary *values = [param dictionary]; //得到参数列表
        
        NSMutableString *temParamString = [NSMutableString string];
        
        //组合
        int keyCount = 0;
        for (NSString *key in [values allKeys])
        {
            keyCount ++;
            [temParamString appendFormat:@"%@=%@",key,[values objectForKey:key]];
            if (keyCount < [[values allKeys] count]) {
                [temParamString appendString:@"&"];
            }
        }
        NSLog(@"param:%@",temParamString);
        
        if (((RequestMsg *)param).access_token)
        {
            NSString *par = [NSString stringWithFormat:@"access_token=%@",((RequestMsg *)param).access_token];
            
            [req addValue:par forHTTPHeaderField:@"Cookie"];
        }
        
        if (((RequestMsg *)param).imei)
        {
            NSString *par = [NSString stringWithFormat:@"customer_key=%@",((RequestMsg *)param).imei];
            [req addValue:par forHTTPHeaderField:@"Cookie"];
        }

        NSLog(@"%@",req.allHTTPHeaderFields);

        
        NSString *data = temParamString;
        NSString *msgLength=[NSString stringWithFormat:@"%d",[data length]];
        
        // 初始化请求的内容
        [req addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
        [req setHTTPMethod:@"POST"];
        [req setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
        [req setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
        //            _appendLog(log, data);
        
        
        
        
    }
    
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)response
{
    
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

    RequstTask * task = _getTask(conn); // 取回当前任务
    [task.cache appendData: data];
    
    //    _updateDataRate(task.name, data.length);
#if kShouldPrintDetailsFlags
    NSString * strData = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    NSLog(@"Connection did receive data with %@.\r\n%@", task.key, strData);
#endif
    
    
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

    if ([[error domain] isEqualToString:NSURLErrorDomain])
    {
        error = [NSError errorWithDomain:@"网络连接失败，请稍后重试！" code:-2 userInfo:nil];
    }
    
    NSLog(@"%@",[error domain]);
    RequstTask * task = _getTask(conn); // 取回当前任务
    
    //数据出错
    if (canResponse(task, didFailure:voucher:)) {
        [task.eventHandle didFailure:error
                             voucher:task.key];
    }
    else if(canResponse(task, didFailure:))
    {
        [task.eventHandle didFailure:error];
    }
    
    // 释放该任务
    if (task.key)
    {
        [_taskDic removeObjectForKey:task.key];
    }
    
}

//请求结束
- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    RequstTask * task = _getTask(conn); // 取回当前任务
    
    NSLog(@"FinishLoading with url:%@",task.name);
    
    NSLog(@"return:%@",[[[NSString alloc] initWithData:task.cache encoding:NSUTF8StringEncoding] autorelease]);
    
//    NSDictionary *retDic = [task.cache objectFromJSONData];
    NSDictionary *retDic = [NSJSONSerialization JSONObjectWithData:task.cache
                                    options:0
                                      error:nil];
    if (retDic)
    {
        if (task.eventHandle)
        {
            Class cls = [task.param responseMsgClass];
            id resp = [[[cls alloc] init] autorelease];
            [resp fillFromDictionary:retDic];
            
            if (![((ResponseMsg *)resp).resp_status isEqualToString:@"OK"])
            {//数据有问题
                
                NSString *errDomain = ISNULL(((ResponseMsg *)resp).error_desc) ? @"数据出错" : ((ResponseMsg *)resp).error_desc;
                
                NSError *error = [NSError errorWithDomain:errDomain code:11 userInfo:nil];
                
                if (canResponse(task, didFailure:voucher:))
                {
                    [task.eventHandle didFailure:error
                                         voucher:task.key];
                    
                } else  if (canResponse(task, didFailure:))
                {
                    [task.eventHandle didFailure:error];
                }

                return;
            }
            // 通知用户调用成功
            else if (canResponse(task, didSuccess:voucher:))
            {
                [task.eventHandle didSuccess:resp voucher:task.key];
            }
            else if (canResponse(task, didSuccess:)) {
                [task.eventHandle didSuccess:resp];
            }
        }
    }
    else
    {//数据出错
        
        if(canResponse(task, dealWithWrongFormat:voucher:))
        {
            [task.eventHandle dealWithWrongFormat:task.cache voucher:task.key];
        }
        else if (canResponse(task, dealWithWrongFormat:))
        {//交由delegate去处理
            [task.eventHandle dealWithWrongFormat:task.cache];
        }
        else if (canResponse(task, didFailure:voucher:))
        {
            [task.eventHandle didFailure:[NSError errorWithDomain:@"数据出错" code:10 userInfo:nil]
                                 voucher:task.key];
        }
        else if(canResponse(task, didFailure:))
        {
            [task.eventHandle didFailure:[NSError errorWithDomain:@"数据出错" code:10 userInfo:nil]];
        }
    }
    
    
    // 释放该任务
    if (task.key)
    {
        [_taskDic  removeObjectForKey:task.key];
    }
    
}



//下面两段是重点，要服务器端单项HTTPS 验证，iOS 客户端忽略证书验证。
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    
//    NSLog(@"didReceiveAuthenticationChallenge %@ %zd", [[challenge protectionSpace] authenticationMethod], (ssize_t) [challenge previousFailureCount]);
    
    
    
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        
        [[challenge sender]  useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        
        [[challenge sender]  continueWithoutCredentialForAuthenticationChallenge: challenge];
        
    }
    
}


@end
