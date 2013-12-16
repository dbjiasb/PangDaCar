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
#define ServerURL @"https://chanaapp.chinatsp.com"
#define Build     @"Build 12.6.1.1"

#endif


#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define Invoke_Name_Login [NSString stringWithFormat:@"%@/api/1.0/mp/%@/login/",ServerURL,[OpenUDID value]] //登陆，URL参数为IMEI
#define Invoke_Name_Register [NSString stringWithFormat:@"%@/api/1.0/mp/reg/",ServerURL] //注册
#define Invoke_Name_GetVerifyCode [NSString stringWithFormat:@"%@/api/1.0/mp/getverfycode/phone_number/",ServerURL] //获得验证码(注册)
#define Invoke_Name_GetSafeCode [NSString stringWithFormat:@"%@/api/1.0/user/UUID/im/account/sms/",ServerURL] //获得验证码(绑定车载)
#define Invoke_Name_BindCar [NSString stringWithFormat:@"%@/api/1.0/user/UUID/bind/tulist/TUID/",ServerURL] //绑定车载
#define Invoke_Name_ResetPWD [NSString stringWithFormat:@"%@/api/1.0/mp/PHONE_NUMBER/reset_pwd/",ServerURL] //重置密码
#define Invoke_Name_GetCarCondition [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/condition/TUID/",ServerURL] //车况查询 9514 10001009130409007731831860090191
#define Invoke_Name_GetWeather [NSString stringWithFormat:@"%@/api/1.0/Weather/GetWeather",ServerURL] //天气预报
#define Invoke_Name_GetFourSList [NSString stringWithFormat:@"%@/api/1.0/4s/4slist/SALES_TYPE/",ServerURL]//4S店列表
#define Invoke_Name_RemoteCheck [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/ori_cond_batch/TUID/",ServerURL] //远程诊断
#define Invoke_Name_CarControl [NSString stringWithFormat:@"%@/api/1.0/mp/user/UUID/im/tu/TUID/",ServerURL] //远程控制
#define Invoke_Name_GetMaintainRecordList [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/service/TUID/",ServerURL] //保养历史记录
#define Invoke_Name_MaintainSetting [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/maintenance/TUID/",ServerURL] //保养设置
#define Invoke_Name_TrackingStatus [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/tracking/status/TUID/",ServerURL] //追踪状态获取
#define Invoke_Name_TrackingPaths [NSString stringWithFormat:@"%@/api/1.0/user/UUID/lbs/stack/TUID/START_TIMESTAMP/END_TIMESTAMP/",ServerURL] //追踪轨迹
#define Invoke_Name_TrackingStatusSetting [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/tracking/TUID/",ServerURL] //开始追踪 停止追踪
#define Invoke_Name_TrackingList [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/tracking/TUID/list/",ServerURL] //追踪历史
#define Invoke_Name_GetUserPublicInfo [NSString stringWithFormat:@"%@/api/1.0/user/UUID/inf/public/",ServerURL] //获取用户的一般可公开信息
#define Invoke_Name_GetTuList [NSString stringWithFormat:@"%@/api/1.0/user/UUID/bind/tulist/",ServerURL] //获取用户所绑定的终端列表
#define Invoke_Name_GetPeccancyCars [NSString stringWithFormat:@"%@/api/1.0/user/UUID/bind/peccancy/",ServerURL] //获取用户所绑定的车辆列表|添加车辆
#define Invoke_Name_GetPeccancyRecord [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/pec/",ServerURL] //获取违章记录   VEH_NO/ 后可以加车牌号
#define Invoke_Name_GetAdvertise [NSString stringWithFormat:@"%@/api/1.0/mp/advertise/",ServerURL] //
#define Invoke_Name_CarStoreList [NSString stringWithFormat:@"%@/api/1.0/user/carstore/",ServerURL] //获取汽车商城首页
#define Invoke_Name_PswModify [NSString stringWithFormat:@"%@/api/1.0/user/UUID/change_pwd/",ServerURL] //修改密码

#define Invoke_Name_GetUserInfo [NSString stringWithFormat:@"%@/api/1.0/user/UUID/inf/protected/",ServerURL] //个人信息
#define Invoke_Name_GetCarInfo [NSString stringWithFormat:@"%@/api/1.0/user/UUID/carinfo/",ServerURL] //车辆信息
#define Invoke_Name_UpdateUserID [NSString stringWithFormat:@"%@/api/1.0/user/push/UUID/ready/IMEI/",ServerURL] //提交UserID

#define Invoke_Name_Upgrade [NSString stringWithFormat:@"%@/api/1.0/user/soft/upgrade/0/",ServerURL] //app检查更新

#define Invoke_Name_GetCarPosition [NSString stringWithFormat:@"%@/api/1.0/user/UUID/lbs/current/TUID/",ServerURL] //获取车辆位置

#define Invoke_Name_Peccancy [NSString stringWithFormat:@"%@/api/1.0/user/UUID/query_peccancy/CAR_ID/",ServerURL] //获取违章验证码

#define Invoke_Name_Limit [NSString stringWithFormat:@"%@/api/1.0/user/UUID/limit/CITYNAME/",ServerURL] //获取限号

#define Invoke_Name_UnreadMessage [NSString stringWithFormat:@"%@/api/1.0/user/UUID/push/",ServerURL] //获取未读消息

#define Invoke_Name_Deals [NSString stringWithFormat:@"%@/api/1.0/user/dea/deals/",ServerURL] //获取优惠信息

#define Invoke_Name_Invasion [NSString stringWithFormat:@"%@/api/1.0/user/UUID/veh/invasion/TUID/",ServerURL] //获取车门非法开启警告

#define Invoke_Name_Tips [NSString stringWithFormat:@"%@/api/1.0/mp/tips/",ServerURL] //获取小常识 // TIPSID  // ID
#define Invoke_Name_Feedback [NSString stringWithFormat:@"%@/api/1.0/user/UUID/fee/feedback/",ServerURL] //获取小常识 // TIPSID  // ID
#define Invoke_Name_DashBoard [NSString stringWithFormat:@"%@/api/1.0/mp/dashboard/CAR_ID/",ServerURL] //获取仪表盘 // CAR_ID  // ID
#define Invoke_Name_UserSuggest [NSString stringWithFormat:@"%@/api/1.0/user/UUID/car/proposal/",ServerURL]  //
//

#endif
