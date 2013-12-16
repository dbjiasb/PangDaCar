//
//  ADInfo.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-31.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "ADInfo.h"

@implementation ADInfo

- (void)dealloc
{
    self.advertise_id = nil;
    
    self.advertise_title = nil;
    
    self.advertise_img_url = nil;
    
    self.advertise_url = nil;
    
    self.description = nil;
    

    [super dealloc];
}


- (void)fillFromDictionary:(NSDictionary *)dic
{
    self.advertise_id = ISNULL([dic objectForKey:@"advertise_id"]) ? @"0" : [dic objectForKey:@"advertise_id"] ;
    self.advertise_title = ISNULL([dic objectForKey:@"advertise_title"]) ? @"0" : [dic objectForKey:@"advertise_title"] ;
    self.advertise_img_url = ISNULL([dic objectForKey:@"advertise_img_url"]) ? @"0" : [dic objectForKey:@"advertise_img_url"] ;
    self.advertise_url = ISNULL([dic objectForKey:@"advertise_url"]) ? @"0" : [dic objectForKey:@"advertise_url"] ;
    self.description = ISNULL([dic objectForKey:@"description"]) ? @"0" : [dic objectForKey:@"description"] ;

}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic addEntriesFromDictionary:[self dictionaryWithValuesForKeys:@[@"advertise_id",@"advertise_title",@"advertise_img_url",@"advertise_url",@"description"]]];
    
    return dic;
}
@end
