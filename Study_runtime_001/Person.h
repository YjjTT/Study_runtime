//
//  Person.h
//  Study_runtime_001
//
//  Created by YjjTT on 2018/4/10.
//  Copyright © 2018年 YjjTT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 对象方法
- (void)run;
- (void)eatWithFooter:(NSString *)footer;
// 类方法
+ (void)run;
@end
