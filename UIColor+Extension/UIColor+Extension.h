#import <UIKit/UIKit.h>

/************************UIColor的扩展************************/
@interface UIColor(Extension)

/**
 *  根据十六进制转换成UIColor
 *
 *  @param hex UIColor的十六进制
 *
 *  @return 转换后的结果
 */
+(UIColor *)colorWithRGBHex:(UInt32)hex;

/**
 *  产生一个随机的UIColor
 *
 *  @return 随机的UIColor
 */
+(UIColor *)randomColor;

@end
