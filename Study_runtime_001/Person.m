//
//  Person.m
//  Study_runtime_001
//
//  Created by YjjTT on 2018/4/10.
//  Copyright © 2018年 YjjTT. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)run{
    NSLog(@"哥们跑起来了");
}
- (void)eatWithFooter:(NSString *)footer{
    NSLog(@"吃%@", footer);
}
+ (void)run{
    NSLog(@"类方法再跑");
}
@end
