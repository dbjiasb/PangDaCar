//
//  PathPoint.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-23.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathPoint : NSObject

@property (nonatomic, assign) float lng;
@property (nonatomic, assign) float lat;
@property (nonatomic, assign) float speed;
@property (nonatomic, assign) NSTimeInterval record_timestamp;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *trackingID;

- (void)fillFromDictionary:(NSDictionary *)dic;

@end
