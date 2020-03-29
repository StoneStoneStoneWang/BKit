//
//  ZIconConfig.h
//  BBQContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//

#import "BBQSignConfig.h"

#define BBQBackIcon "返回"

#define BBQLogoIcon "Logo"

#define BBQWelcomeImgs @[@"引导1",@"引导2"]

#define BBQAboutIcon "关于我们"

#define BBQContactUsIcon "联系我们"

#define BBQPrivacyIcon "隐私政策"

#define BBQUserInfoIcon "用户资料"

#define BBQSettingIcon "设置"

#define BBQZPhoneNum "+0314-8032560"

#define BBQPhoneIcon "手机号"

#define BBQPasswordIcon "密码"

#define BBQVCodeIcon "验证码"

#define BBQPasswordNormalIcon "闭眼"

#define BBQPasswordSelectIcon "睁眼"

#define BBQNormalIcon "未选中"

#define BBQSelectedIcon "选中"

#pragma mark ---- 圈子类型
#if BBQCONFIGURETYPECIRCLE

#define BBQCircleIcon "我的发布"

#define BBQFocusIcon "我的关注"

#define BBQMoreIcon "更多"

#define BBQWatchIcon "观看"

#define BBQCommentIcon "评论"

#define BBQFunNormalIcon "点赞未选中"

#define BBQFunSelectedIcon "点赞选中"
#pragma mark ---- 商城类型
#elif BBQCONFIGURETYPESTORE

#define BBQOrderIcon "我的订单"

#define BBQAddressIcon "我的地址"
#pragma mark ---- 游戏类型
#elif BBQCONFIGURETYPEGAME

#define BBQCharatersIcon "我的角色"
#pragma mark ---- 地图类型
#else



#endif



