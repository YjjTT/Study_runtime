//
//  PersonMethod.m
//  Study_runtime_001
//
//  Created by YjjTT on 2018/4/10.
//  Copyright © 2018年 YjjTT. All rights reserved.
//

#import "PersonMethod.h"
#import <objc/message.h>

@implementation PersonMethod

// 一切都是C语言的
// 所有的C语言函数里面! 都有这两个隐式参数! 只要调用, 系统都会传递进来!
void eat(id self, SEL _cmd){
    NSLog(@"调用了%@对象的%@方法", self, NSStringFromSelector(_cmd));
    NSLog(@"哥们吃了");
}
void eat1(id self, SEL _cmd, id obj){
    NSLog(@"今晚吃%@",  obj);
}
// 处理类方法
//+ (BOOL)resolveClassMethod:(SEL)sel

// 处理对象方法
// 当这个类被调用了没有实现的方法! 就会来到这里, 比如外面的eat
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"你没有实现这个方法%@",NSStringFromSelector(sel));
    if (sel == @selector(eat)) {
        /*
         1. cls : 类类型
         2. name : 方法编号
         3. imp: 方法实现, 函数指针! 函数指针不要括号
         4. types: 函数类型 C字符串(代码) void === "v"
         */
        // 官方文档
        class_addMethod([PersonMethod class], sel, (IMP)eat, "v@:");
    }else if (sel == @selector(eat:)){
        class_addMethod([PersonMethod class], sel, (IMP)eat1, "v@:@");
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
