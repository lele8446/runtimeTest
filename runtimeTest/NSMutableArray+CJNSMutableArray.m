//
//  NSMutableArray+CJNSMutableArray.m
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/21.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import "NSMutableArray+CJNSMutableArray.h"
#import <objc/runtime.h>

@implementation NSMutableArray (CJNSMutableArray)

//该方法在类或者分类第一次加载内存的时候调用
+ (void)load {
    //NSMutableArray真正的类名应该是__NSArrayM
    Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(CJAddObject:));
    //交换方法
    method_exchangeImplementations(orginalMethod, newMethod);
}

- (void)CJAddObject:(id)anObject {
    //这里因为已经交换了方法，如果调用addObject:会出现死循环
    if (nil != anObject) {
        [self CJAddObject:anObject];
    }
}

@end
