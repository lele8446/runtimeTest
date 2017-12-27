//
//  NSMutableArray+CJNSMutableArray.m
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/21.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import "NSMutableArray+CJNSMutableArray.h"
#import "NSObject+CJExtension.h"

@implementation NSMutableArray (CJNSMutableArray)

//该方法在类或者分类第一次加载内存的时候调用
+ (void)load {
    NSLog(@"执行NSMutableArray swizzling");
    //swizzling应该总是在dispatch_once中执行
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleOriginalSEL:@selector(addObject:) withSwizzlingSEL:@selector(CJAddObject:) targetClass:NSClassFromString(@"__NSArrayM")];
    });
}

- (void)CJAddObject:(id)anObject {
    //这里因为已经交换了方法，如果调用addObject:会出现死循环
    if (nil != anObject) {
        [self CJAddObject:anObject];
    }
}

@end
