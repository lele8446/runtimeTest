//
//  NSMutableDictionary+CJMutableDictionary.m
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/21.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import "NSMutableDictionary+CJMutableDictionary.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (CJMutableDictionary)

//该方法在类或者分类第一次加载内存的时候调用
+ (void)load{
    
    //swizzling应该总是在dispatch_once中执行
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
        Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(CJSetObject:forKey:));
        //交换方法
        method_exchangeImplementations(orginalMethod, newMethod);
    });
    
}

- (void)CJSetObject:(id)anObject forKey:(NSString *)aKey
{
    //这里因为已经交换了方法，如果调用setObject:forKey:会出现死循环
    if (nil != anObject) {
        [self CJSetObject:anObject forKey:aKey];
    }
    //如果值为nil，将该键值删除
    else{
        [self removeObjectForKey:aKey];
    }
}

@end
