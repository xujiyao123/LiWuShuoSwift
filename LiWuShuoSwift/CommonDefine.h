//
//  CommonDefine.h
//  CityGuide
//
//  Created by 徐继垚 on 15/7/14.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#ifndef ____CommonDefine_h
#define ____CommonDefine_h

#define MORE_THAN_IOS7 [UIDevice currentDevice].systemVersion.floatValue >= 7.0f
#define NaviBar_Height ((MORE_THAN_IOS7) ? 64 : 44)

#define ScreenHeight ((MORE_THAN_IOS7) ? [[UIScreen mainScreen] bounds].size.height  : [[UIScreen mainScreen] bounds].size.height-20)
#define TabbarHeight 49
#define StateHeight ((MORE_THAN_IOS7) ? 20  : 0)

#define MainColor UIColorFromRGB(0x262626)
#define NavColor UIColorFromRGB(0x1e1e1e)
#define TitleColor [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1]

//-----------------------------屏幕适配宏----------------
#define Width [UIScreen mainScreen].bounds.size.width / 320
#define Height [UIScreen mainScreen].bounds.size.height / 568


//---------------------屏幕尺寸-----------
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width



#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGB(a,b,c) [UIColor colorWithRed:a/255.0f green:b/255.0f blue:c/255.0f alpha:1.0f]



#define HTML_ERROT_TEXT @"<input type=\"hidden\" name=\"yunshenghui-error\">"
#endif
