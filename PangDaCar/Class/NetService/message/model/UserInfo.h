//
//  UserInfo.h
//  Chinatsp
//
//  Created by chinatsp on 13-10-11.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic, copy) NSString *real_name; //真实姓名
@property (nonatomic, copy) NSString *gender; //性别F
@property (nonatomic, copy) NSString *mobile_phone; //移动电话
@property (nonatomic, copy) NSString *birthday; //生日
@property (nonatomic, copy) NSString *email; //电子邮件
@property (nonatomic, copy) NSString *emergency_name; //紧急情况时的第二联系人姓名
@property (nonatomic, copy) NSString *emergency_phone; //紧急情况时的第二联系人电话
@property (nonatomic, copy) NSString *address; //常住地址

@property (nonatomic, copy) NSString *certificate_type; //证件类型
@property (nonatomic, copy) NSString *certificate_num; //证件号

@property (nonatomic, copy) NSString *urgency_contact_phone_two; //第二紧急联系电话

@property (nonatomic, assign) NSInteger user_type; //用户类型
@property (nonatomic, copy) NSString *postal_code; //邮编
@property (nonatomic, copy) NSString *home_phone; //家庭电话
@property (nonatomic, copy) NSString *company_phone; //公司电话
@property (nonatomic, copy) NSString *remarks; //备注


@property (nonatomic, copy) NSString *vendor_code;//车厂

- (void) fillFromDictionary:(NSDictionary *)dic;
- (NSDictionary *)dictionary;

@end
