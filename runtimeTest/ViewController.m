//
//  ViewController.m
//  runtimeTest
//
//  Created by C.K.Lian on 16/2/19.
//  Copyright © 2016年 C.K.Lian. All rights reserved.
//

#import "ViewController.h"
#import "TraversalViewController.h"
#import "ExchangeViewController.h"
#import "AssociatedViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak)IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *tableArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableArray = @[@"遍历成员变量",@"交换方法(Method Swizzling)",@"关联对象(Associated Object)"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableCell = @"tableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:tableCell];
    }
    
    cell.textLabel.text = self.tableArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            //由storyboard根据myView的storyBoardID来获取我们要切换的视图
            TraversalViewController *tViewCtr = [story instantiateViewControllerWithIdentifier:@"TraversalViewController"];
            [self.navigationController pushViewController:tViewCtr animated:YES];
            break;
        }
        case 1:
        {
            ExchangeViewController *eViewCtr = [[ExchangeViewController alloc]init];
            [self.navigationController pushViewController:eViewCtr animated:YES];
            break;
        }
        case 2:
        {
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            //由storyboard根据myView的storyBoardID来获取我们要切换的视图
            AssociatedViewController *aViewCtr = [story instantiateViewControllerWithIdentifier:@"AssociatedViewController"];
            [self.navigationController pushViewController:aViewCtr animated:YES];
            break;
        }
            
        default:
            break;
    }
}



@end
