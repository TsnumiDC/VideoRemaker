//
//  Common.h
//  VideoRemaker
//
//  Created by Dylan Chen on 2018/7/5.
//  Copyright © 2018年 Dylan Chen. All rights reserved.
//

#ifndef Common_h
#define Common_h

/**
 * 设备判断
 */
#define isRetina                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) :NO)

#define ISIPHONE5                ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE_6              ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE_6Plus          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)

//以6为区分
#define FONTAUTO(SIZE)      ceilf((SIZE) * (kScreenWidth/375.0f))
#define kScreenWidthRatio  (UIScreen.mainScreen.bounds.size.width / 375.0)
#define kScreenHeightRatio (UIScreen.mainScreen.bounds.size.height / 667.0)
#define AdaptedWidth(x)     ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x)    ceilf((x) * kScreenHeightRatio)

//宽度
#define kStatusBarHeight            (kDevice_Is_iPhoneX ? 44 : 20)
#define kTopBarHeight               (44.f)
#define kNavBarHeight               (kDevice_Is_iPhoneX ? 44+44 : 44+20)
#define kBottomBarHeight            (kDevice_Is_iPhoneX ? 34+49 : 49)
#define SafeAreaTopHeight           (kDevice_Is_iPhoneX ? 88 : 64)
#define kSafeArea_Top               (kDevice_Is_iPhoneX ? 44 : 20)
#define kSafeArea_Bottom            (kDevice_Is_iPhoneX ? 34 : 0)

#define kScrollViewBeginTopInset    (kDevice_Is_iPhoneX ? 164 : 144)
#define kScrollViewBeginTopInset    (kDevice_Is_iPhoneX ? 164 : 144)

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//颜色
#define RGBColor(r,g,b)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//字体颜色色值
#define UpFontColor            [UIColor colorWithHexString:@"0x323232"]
#define MidUpFontColor         [UIColor colorWithHexString:@"0x3D4245"]
#define MidFontColor           [UIColor colorWithHexString:@"0x3C3C3C"]
#define LowFontColor           [UIColor colorWithHexString:@"0x888888"]
#define LowlowFontColor        [UIColor colorWithHexString:@"0xCCCCCC"]

//分割线色
#define CutLineColor           [UIColor colorWithHexString:@"0xE6E6E6"]
#define DarkCutLineColor       [UIColor colorWithHexString:@"0xDCDCDC"]















#endif /* Common_h */
