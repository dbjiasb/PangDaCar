//
//  CarShopItem.m
//  Chinatsp
//
//  Created by chinatsp on 13-11-1.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "CarShopItem.h"

@implementation CarShopItem
- (void)dealloc
{
    self.carId = nil;
    self.carName = nil;
    self.picUrl = nil;
    self.downloadUrl = nil;
    self.version = nil;
    [super dealloc];
}

- (void)fillFromDictionary:(NSDictionary *)dic
{
    self.carId = ISNULL([dic objectForKey:@"carId"]) ? @"0" : [[dic objectForKey:@"carId"] stringValue];
    self.carName = ISNULL([dic objectForKey:@"carName"]) ? @"0" : [dic objectForKey:@"carName"] ;
    self.picUrl = ISNULL([dic objectForKey:@"picUrl"]) ? @"0" : [dic objectForKey:@"picUrl"] ;
    self.downloadUrl = ISNULL([dic objectForKey:@"downloadUrl"]) ? @"0" : [dic objectForKey:@"downloadUrl"] ;
    self.version = ISNULL([dic objectForKey:@"version"]) ? @"0" : [dic objectForKey:@"version"] ;

    self.state = ISNULL([dic objectForKey:@"state"]) ? 0 : [[dic objectForKey:@"state"] integerValue];
    
    self.fileName = ISNULL([dic objectForKey:@"fileName"]) ? @"0" : [dic objectForKey:@"fileName"] ;
    
    self.thumbUrl = ISNULL([dic objectForKey:@"thumbUrl"]) ? @"" : [dic objectForKey:@"thumbUrl"] ;
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"carId",@"carName",@"picUrl",@"downloadUrl",@"version",@"state",nil]]];
    
    return ret;
}
@end
