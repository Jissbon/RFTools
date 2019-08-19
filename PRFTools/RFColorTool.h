//
//  RFColorTool.h
//  RFDemo
//
//  Created by 庞日富 on 2019/8/19.
//  Copyright © 2019 庞日富. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RFColorTool : NSObject


/**
 从十六进制字符串获取颜色，
 color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 
 @param hexString 16进制的颜色参数
 @param alpha 透明度
 @return 直接转换成颜色;
 */
+(UIColor*)colorWithHexString:(NSString*)hexString alpha:(CGFloat)alpha;



@end

NS_ASSUME_NONNULL_END
