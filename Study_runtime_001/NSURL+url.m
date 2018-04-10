//
//  NSURL+url.m
//  Study_runtime_001
//
//  Created by YjjTT on 2018/4/10.
//  Copyright © 2018年 YjjTT. All rights reserved.
//

#import "NSURL+url.h"
#import <objc/message.h>

@implementation NSURL (url)
// 重写方法
// 不能用下面的方法 必须得创建url 不能不创建
//+ (instancetype)URLWithString:(NSString *)URLString{
//
//}

// 只要源文件参与编译,就会加载这个类的load方法
// 不引入头文件也可以
+ (void)load{
    NSLog(@"%s", __func__);
    // 1. 拿到两个方法, 苹果原来的URLWithString 和JT_URLWithString
    // class_getClassMethod 获取类方法
    // class_getInstanceMethod 获取对象方法
    // 2.1 类类型
    // 2.2 方法编号
    Method mURLWithStr = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method mJT_URLWithStr = class_getClassMethod([NSURL class], @selector(JT_URLWithString:));
    
//    class_getInstanceMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>)
    // 2. 交换这两个方法! (你调用A, 哥们会执行B)
    method_exchangeImplementations(mURLWithStr, mJT_URLWithStr);
}

// 定义一个其他的方法
+ (instancetype)JT_URLWithString:(NSString *)URLString{
    // 死循环发生了!!! URLWithString 对应的是JT_URLWithString 交换方法后 调用A 执行B
    // 这么写明明是个递归?
//    NSURL *url =  [NSURL URLWithString:URLString];
    NSURL *url = [NSURL JT_URLWithString:URLString]; // 会找 URLWithstring这个方法 先去类里找该方法声明 然后去找方法实现
    if (url == nil) {
        NSLog(@"哥们是一个空的url");
    }
    return url;
}
@end
