//
//  ExchangeViewController.m
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/21.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import "ExchangeViewController.h"
#import "NSMutableDictionary+CJMutableDictionary.h"
#import "NSMutableArray+CJNSMutableArray.h"

@implementation ExchangeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:3];
    [dic setObject:@"value" forKey:@"key"];
    NSLog(@"dic = %@",dic);
    [dic setObject:nil forKey:@"key"];
    NSLog(@"dic = %@",dic);
    
    NSMutableArray *arry = [NSMutableArray arrayWithCapacity:2];
    [arry addObject:@"1"];
    [arry addObject:nil];
    [arry addObject:@"2"];
    NSLog(@"arry = %@",arry);
    
}
@end
