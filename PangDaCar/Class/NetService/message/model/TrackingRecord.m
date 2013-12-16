//
//  TrackingRecord.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TrackingRecord.h"

@implementation TrackingRecord


- (void)dealloc
{
    self.veh_tracking_id = nil;
    self.start_address = nil;
    self.end_address = nil;
    self.start_time = nil;
    self.end_time = nil;
    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    self.veh_tracking_id = ISNULL([dic objectForKey:@"veh_tracking_id"]) ? @"0" : [dic objectForKey:@"veh_tracking_id"] ;
    self.start_address = ISNULL([dic objectForKey:@"start_address"]) ? @"" : [dic objectForKey:@"start_address"] ;
    self.end_address = ISNULL([dic objectForKey:@"end_address"]) ? @"" : [dic objectForKey:@"end_address"] ;
    self.start_time = ISNULL([dic objectForKey:@"start_time"]) ? @"" : [dic objectForKey:@"start_time"] ;
    self.end_time = ISNULL([dic objectForKey:@"end_time"]) ? @"" : [dic objectForKey:@"end_time"] ;
    
    if (self.start_time.length == [@"2013-10-29 21:03:12.0" length] ) {
        self.start_time = [self.start_time substringToIndex:self.start_time.length - 2];
    }
    if (self.end_time.length == [@"2013-10-29 21:03:12.0" length] ) {
        self.end_time = [self.end_time substringToIndex:self.end_time.length - 2];
    }

    NSTimeInterval start = [[MyUtil getDateFromString:self.start_time] timeIntervalSince1970];
    
    NSTimeInterval end = [[MyUtil getDateFromString:self.end_time] timeIntervalSince1970];
    
    int hour = (end - start) / 60 / 60;
    int minute = ((int)((end - start) / 60)) % 60;
    int sec = ((int)(end - start)) % 60;
    
//    NSLog(@"%d,%d,%d",hour,minute,sec);
    
    NSString *use = @"";
    
    if (hour > 0) {
        use = [NSString stringWithFormat:@"%d小时",hour];
    }
    if (minute>0) {
        use = [NSString stringWithFormat:@"%@%d分钟",use,minute];
    }
    if (use.length == 0) {
        use = [NSString stringWithFormat:@"%d秒",sec];
    }
    
    self.useTime = use;//[NSString stringWithFormat:@"%d小时%d分钟",hour,minute];
}



@end
