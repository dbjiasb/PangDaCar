//
//  UserInfo.m
//  Chinatsp
//
//  Created by chinatsp on 13-10-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

- (void)dealloc
{
    self.real_name = nil;
    self.mobile_phone = nil;
    self.birthday = nil;
    self.email = nil;
    self.emergency_name = nil;
    self.emergency_phone = nil;
    self.address = nil;
    self.certificate_type = nil;
    self.certificate_num = nil;
    self.urgency_contact_phone_two = nil;
    self.postal_code = nil;
    self.home_phone = nil;
    self.company_phone = nil;
    self.remarks = nil;
    self.gender = @"男";
    
    [super dealloc];
}

- (void) fillFromDictionary:(NSDictionary *)dic
{
    self.real_name = !ISNULL([dic objectForKey:@"real_name"]) ? [dic objectForKey:@"real_name"] : @"";
    self.mobile_phone = !ISNULL([dic objectForKey:@"mobile_phone"]) ? [dic objectForKey:@"mobile_phone"] : @"";
    self.birthday = !ISNULL([dic objectForKey:@"birthday"]) ? [dic objectForKey:@"birthday"] : @"";
    self.email = !ISNULL([dic objectForKey:@"email"]) ? [dic objectForKey:@"email"] : @"";
    self.emergency_name = !ISNULL([dic objectForKey:@"emergency_name"]) ? [dic objectForKey:@"emergency_name"] : @"non-emergency";
    self.emergency_phone = !ISNULL([dic objectForKey:@"emergency_phone"]) ? [dic objectForKey:@"emergency_phone"] : @"non-emergency";
    self.address = !ISNULL([dic objectForKey:@"address"]) ? [dic objectForKey:@"address"] : @"";
    self.certificate_type = !ISNULL([dic objectForKey:@"certificate_type"]) ? [dic objectForKey:@"certificate_type"] : @"";
    self.certificate_num = !ISNULL([dic objectForKey:@"certificate_num"]) ? [dic objectForKey:@"certificate_num"] : @"";
    self.urgency_contact_phone_two = !ISNULL([dic objectForKey:@"urgency_contact_phone_two"]) ? [dic objectForKey:@"urgency_contact_phone_two"] : @"";
    self.postal_code = !ISNULL([dic objectForKey:@"postal_code"]) ? [dic objectForKey:@"postal_code"] : @"";
    self.home_phone = !ISNULL([dic objectForKey:@"home_phone"]) ? [dic objectForKey:@"home_phone"] : @"";
    self.company_phone = !ISNULL([dic objectForKey:@"company_phone"]) ? [dic objectForKey:@"company_phone"] : @"";
    self.remarks = !ISNULL([dic objectForKey:@"remarks"]) ? [dic objectForKey:@"remarks"] : @"";
    
    self.user_type = !ISNULL([dic objectForKey:@"user_type"]) ? [[dic objectForKey:@"user_type"] integerValue]: 0;
    self.gender = [[dic objectForKey:@"gender"] isEqualToString:@"F"] ? @"女" : @"男";
    self.vendor_code = !ISNULL([dic objectForKey:@"init_vendor_code"]) ? [dic objectForKey:@"init_vendor_code"] : @"";

}


- (NSDictionary *)dictionary
{
    NSMutableDictionary * ret = [[[NSMutableDictionary alloc] init] autorelease];
    
    [ret addEntriesFromDictionary:[self dictionaryWithValuesForKeys:[NSArray arrayWithObjects:@"real_name",@"mobile_phone",@"birthday",@"email",/*@"emergency_name",@"emergency_phone",*/@"address",@"certificate_type",@"certificate_num",@"urgency_contact_phone_two",@"user_type",@"postal_code",@"home_phone",@"company_phone",@"remarks",nil]]];
    
    NSString *sex = [self.gender isEqualToString:@"男"] ? @"M" : @"F";
    [ret setObject:sex forKey:@"gender"];
   /* [ret setObject:self.vendor_code forKey:@"init_vendor_code"];*/
    
    return ret;

}

@end
