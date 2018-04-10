//
//  ViewController.m
//  Study_runtime_001
//
//  Created by YjjTT on 2018/4/10.
//  Copyright © 2018年 YjjTT. All rights reserved.
//

#import "ViewController.h"
//#import "Person.h"
//#import <objc/message.h>
#import "PersonMethod.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // C语言 编译的时候，我就知道你等下要调用哪个函数！！
    // OC   编译的时候, 其实不知道你要调用哪个方法!!
    // OC 动态语言 运行时 alloc init 代码写错了不报错 运行报错 底层消息发送机制
    // 懒加载的方法!!
    
//    Person *p = [[Person alloc] init];
//    [p run]; OC方法
    
    // 给p发送一个消息
//    objc_msgSend(<#id  _Nullable self#>, <#SEL  _Nonnull op, ...#>)
    // Xcode5.0 以后 苹果不建议使用底层函数 msg 关闭检测
//    objc_msgSend(p, @selector(run));
    
//    NSLog(<#NSString * _Nonnull format, ...#>) 一样 可扩展参数 
//    objc_msgSend(p, @selector(eatWithFooter:), @"香蕉");
    
    // OC 调用类方法  Class类型也是一个特殊的对象
//    [Person run];
    
    // 获取Person Class类型
//    Class personClass = [Person class];
    //
//    [personClass performSelector:@selector(run)];
    // 运行时
//    objc_msgSend(personClass, @selector(run));
    
    
    // 创建URL 如此的简单!! But!! Nslog有可能为空
    // 如果字符串有中文, 这个url就创建不成功, 发送请求会出错!!
    // 不知道错误什么时候发生 OC 砸电脑就是这么来的 毫无征兆的错误
    // OC中没有对url为空的检测机制!! swift里面有可选项!
    // 我需要给 URLWithString 添加一个检测是否为空的功能!!
//    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
//    NSURL *url = [NSURL URLWithString:@"www.baidu.com/中文"];
//    NSLog(@"%@", url);
    
    // 降低加载一个类的消耗, 对属性进行懒加载的方法
    // OC中属性的懒加载用过么? 方法的懒加载用过么? 懵逼了!!
    // 懒加载方法
    PersonMethod *p = [[PersonMethod alloc] init];
    // 懒加载, 用到的时候在加载方法 项目编辑不报错, 运行崩溃
    [p performSelector:@selector(eat)];
    [p performSelector:@selector(eat:) withObject:@"肉"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
