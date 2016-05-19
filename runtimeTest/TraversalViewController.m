//
//  TraversalViewController.m
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/19.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import "TraversalViewController.h"
#import <objc/runtime.h>

@interface TraversalViewController ()
@property (nonatomic, weak)IBOutlet UITextField *textField;

@end

@implementation TraversalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    unsigned int count = 0;
    //遍历成员变量
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"%s----%s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    //需要手动释放ivars
    free(ivars);
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([UILabel class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        NSLog(@"%@*****", propertyName);
    }
    free(properties);
        
    /*
     *通过遍历结果获得删除按钮对应的成员变量为_clearButton，通过kvc得到clearButton
     */
    UIButton *button = [self.textField valueForKeyPath:@"_clearButton"];
    
    //自定义删除按钮的图片
    [button setImage:[UIImage imageNamed:@"menu_item_can"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"menu_item_h"] forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
