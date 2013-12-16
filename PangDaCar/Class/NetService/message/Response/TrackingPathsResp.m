//
//  TrackingPathsResp.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "TrackingPathsResp.h"
#import "PathPoint.h"

@implementation TrackingPathsResp




- (void)fillFromDictionary:(NSDictionary *)dic {
    
    if (ISNULL(dic))
        return;
    [super fillFromDictionary:dic];
    
    NSDictionary *tem1 = [dic objectForKey:@"resp_data"];

//    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"]];
//    
//    NSDictionary *tem1  =[[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] objectForKey:@"resp_data"];

    
    NSArray *stack = [tem1 objectForKey:@"stack"];
    if (!ISNULL(stack) && [stack isKindOfClass:[NSArray class]])
    {
        if (!self.paths) {
            self.paths = [NSMutableArray array];
        }
        
        for (NSDictionary *dic in stack)
        {
         
            if (!ISNULL(dic)) {
                PathPoint *point = [[[PathPoint alloc] init] autorelease];
                [point fillFromDictionary:dic];
                
                [self.paths addObject:point];
            }
        }
        
    }

}


@end
