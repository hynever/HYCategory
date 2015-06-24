#import "UIImage+Extension.h"

@implementation UIImage (Extension)


#pragma mark 默认比例因子是0.5的拉伸方法
+ (UIImage *)resizedImageWithName:(NSString *)name{
     return [self resizedImageWithName:name left:0.5 top:0.5];
}


#pragma mark 带需要比例因子的拉伸方法
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

#pragma makr 根据颜色返回图片
+(UIImage*)imageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



@end
