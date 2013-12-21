//
//  AdvertiseResq.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-31.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "AdvertiseResp.h"
#import "ADInfo.h"

@implementation AdvertiseResp

- (id)init
{
    if (self = [super init]) {
        
        self.advertise_list = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc
{
    self.advertise_list = nil;
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary*)dic
{
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];
    
    self.advertise_num =  ISNULL([tem1 objectForKey:@"advertise_num"]) ? 0 : [[tem1 objectForKey:@"advertise_num"] integerValue];
    
    NSArray *list = [tem1 objectForKey:@"advertise_list"];
    if (!ISNULL(list) && [list isKindOfClass:[NSArray class]])
    {
        NSString *ceche = [MyUtil getCachePath];
        NSString *url = [NSString stringWithFormat:@"%@/lastAd.txt",ceche];
        BOOL suc = [list writeToFile:url atomically:YES];
//        BOOL suc = [list writeToURL:[NSURL URLWithString:url] atomically:YES];
        
        if (!suc)
        {
            NSLog(@"广告保存本地失败");
        }
        
        for (int i = 0; i < [list count]; i++)
        {
            NSDictionary *itemDic = list[i];
            if (!ISNULL(itemDic))
            {
                ADInfo *adInfo = [[[ADInfo alloc] init] autorelease];
                
                [adInfo fillFromDictionary:itemDic];
                
                [self.advertise_list addObject:adInfo];
            }
        }
    }
    
}


@end
