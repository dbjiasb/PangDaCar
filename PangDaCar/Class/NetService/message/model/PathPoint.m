//
//  PathPoint.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "PathPoint.h"

@implementation PathPoint

- (id)init
{
    if (self = [super init]) {
        
        self.lng = 0;
        self.lat = 0;
        
        self.trackingID = @"";
        self.name = @"";
    }
    
    return self;
}

- (void)dealloc
{
    
    self.trackingID = nil;
    self.name = nil;

    
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    self.lng = ISNULL([dic objectForKey:@"lng"]) ? 0 : [[dic objectForKey:@"lng"] floatValue];
    self.lat = ISNULL([dic objectForKey:@"lat"]) ? 0 : [[dic objectForKey:@"lat"] floatValue];
    self.speed = ISNULL([dic objectForKey:@"speed"]) ? 0 : [[dic objectForKey:@"speed"] floatValue];
    self.record_timestamp = ISNULL([dic objectForKey:@"record_timestamp"]) ? 0 : [[dic objectForKey:@"record_timestamp"] doubleValue];
    
    self.name = [NSString stringWithFormat:@"%.0lf",self.record_timestamp];
}

@end
