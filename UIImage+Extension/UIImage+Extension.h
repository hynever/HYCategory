#import <UIKit/UIKit.h>


/************************对UIImage功能拓展的分类************************/
@interface UIImage (Extension)

/**
 *  按照0.5的比例拉伸图片
 *
 *  @param name 图片名字
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;

/**
 *  根据指定参数拉伸图片
 *
 *  @param name 图片名
 *  @param left 距离左边的比例
 *  @param top  距离顶部的比例
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  根据颜色返回图片
 */
+(UIImage*)imageWithColor:(UIColor*)color;


@end
