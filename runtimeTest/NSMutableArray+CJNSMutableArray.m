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

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
        Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(CJAddObject:));
        method_exchangeImplementations(orginalMethod, newMethod);
    });
}

- (void)CJAddObject:(id)anObject
{
    if (nil != anObject) {
        [self CJAddObject:anObject];
    }
}

@end
