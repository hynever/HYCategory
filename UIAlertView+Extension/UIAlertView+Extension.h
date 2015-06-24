//
//  UIAlertView+Extension.h
//  jimustock
//
//  Created by jimubox on 15/5/22.
//  Copyright (c) 2015年 jimubox. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JMSAlertViewCompleteBlock) (NSInteger buttonIndex);

@interface UIAlertView (Extension)

/**
 *  展示一个带有message的提示AlertView的工厂方法
 */
+(void)showPromptAlertViewWithMessage:(NSString *)message;

/**
 *  展示可定制title和message以及button的AlertView的工厂方法
 */
+(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle completeBlock:(JMSAlertViewCompleteBlock)completeBlock;

/**
 *  展示一个带有block的UIAlertView
 */
-(void)showAlertViewWithCompleteBlock:(JMSAlertViewCompleteBlock)completeBlock;

@end
