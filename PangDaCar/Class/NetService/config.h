//
//  config.h
//  Chinatsp
//
//  Created by Bolu Lv on 13-3-22.
//  Copyright (c) 2013年 yuante.Yuan Wen. All rights reserved.
//

#ifndef Chinatsp_config_h
#define Chinatsp_config_h
#import "OpenUDID.h"



#define Nofitication_Recieve_Key @"Nofitication_Recieve_Key"

#define Production 0

#warning 每次发布续需要更改的东西                   \
   BAIDUKEY:                                                                      \
   发布版:@"CC4c7ae76a01ef96d24d4b5c0667c484"  测试版:@"A4AcQRtUmiGQ2j3YnHZGxmMd"   \
   BPushConfig.plist里面的推送Key:                                                  \
   发布版：Tfrwx05sqAjNEjoT8fGbPyrF 测试版：A4AcQRtUmiGQ2j3YnHZGxmMd                 \
   BundleID:                                                                      \
   发布版：com.yuante.changanmobile 测试版：com.yuante.tspincall                     \
   ServerURL:                                                                     \
   发布版：@"https://mapi.incall.cn" 测试版：@"https://chanaapp.chinatsp.com"

#if(Production)

#define BAIDUKEY  @"CC4c7ae76a01ef96d24d4b5c0667c484"
#define ServerURL @"https://mapi.incall.cn"
#define Build     @"Build 12.7.2.2"//

#else

#define BAIDUKEY @"A4AcQRtUmiGQ2j3YnHZGxmMd"
#define ServerURL @"https://pdobd.chinatsp.com"
#define Build     @"Build 12.6.1.1"

#endif


#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define Invoke_Name_Login [NSString stringWithFormat:@"%@/api/1.0/mp/%@/login/",ServerURL,[OpenUDID value]] //登陆，URL参数为IMEI
#define Invoke_Name_ResetPWD [NSString stringWithFormat:@"%@/api/1.0/mp/PHONE_NUMBER/reset_pwd/",ServerURL] //重置密码

#define Invoke_Name_GetAdvertise [NSString stringWithFormat:@"%@/api/1.0/mp/advertise/",ServerURL] //

#define Invoke_Name_Upgrade [NSString stringWithFormat:@"%@/api/1.0/user/soft/upgrade/0/",ServerURL] //app检查更新

#define Invoke_Name_Deals [NSString stringWithFormat:@"%@/api/1.0/user/UUID/dea/deals/",ServerURL] //获取优惠信息

#define Invoke_Name_EditPwd [NSString stringWithFormat:@"%@/api/1.0/user/UUID/change_pwd/",ServerURL] //修改密码，URL参数为

#define Invoke_Name_SecureStatus [NSString stringWithFormat:@"%@/api/1.0/user/UUID/apply/rescue/TUID/",ServerURL] //救援车的状态

#endif
