//
//  AssociatedViewController.h
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/21.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssociatedViewController : UIViewController
@property(nonatomic, weak)IBOutlet UIButton *button;

- (IBAction)click:(id)sender;
@end
