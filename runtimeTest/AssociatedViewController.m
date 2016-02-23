//
//  AssociatedViewController.m
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/21.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import "AssociatedViewController.h"
#import "UIButton+CJButton.h"

@implementation AssociatedViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.button.linkStr = @"https://github.com/";
    
}

- (IBAction)click:(id)sender
{    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"点击链接" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:self.button.linkStr style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    [alert addAction:otherAction];
    [self.navigationController.topViewController presentViewController:alert animated:YES completion:nil];
}

@end
