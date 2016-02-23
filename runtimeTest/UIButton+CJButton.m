//
//  UIButton+CJButton.m
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/21.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import "UIButton+CJButton.h"
#import <objc/runtime.h>

@implementation UIButton (CJButton)

static char linkStrKey;

- (void)setLinkStr:(NSString *)linkStr{
    //OBJC_ASSOCIATION_COPY_NONATOMIC跟属性声明中的retain、assign、copy是一样
    objc_setAssociatedObject(self, &linkStrKey, linkStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)linkStr{
    return objc_getAssociatedObject(self, &linkStrKey);
}
@end
