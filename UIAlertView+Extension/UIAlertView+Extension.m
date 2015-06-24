//
//  UIAlertView+Extension.m
//  jimustock
//
//  Created by jimubox on 15/5/22.
//  Copyright (c) 2015年 jimubox. All rights reserved.
//

#import "UIAlertView+Extension.h"
#import <objc/runtime.h>

static char kAlertViewBindKey;

@implementation UIAlertView (Extension)

#pragma mark - 工厂方法
#pragma mark 展示一个带有message的提示AlertView的工厂方法
+(void)showPromptAlertViewWithMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

#pragma mark 展示可定制title和message以及button的AlertView的工厂方法
+(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle completeBlock:(JMSAlertViewCompleteBlock)completeBlock
{
    //这个方法只能展示两个button
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle, nil];
    [alertView showAlertViewWithCompleteBlock:completeBlock];
}

#pragma mark - 对象方法
#pragma mark 展示一个带有block的UIAlertView
-(void)showAlertViewWithCompleteBlock:(JMSAlertViewCompleteBlock)completeBlock
{
    if (completeBlock) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &kAlertViewBindKey, completeBlock, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
        [self show];
    }
}

#pragma mark - UIAlertView的代理方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    JMSAlertViewCompleteBlock completeBlock = objc_getAssociatedObject(self,&kAlertViewBindKey);
    if (completeBlock && self == alertView) {
        completeBlock(buttonIndex);
        //移除绑定
        objc_removeAssociatedObjects(self);
    }
}


@end
