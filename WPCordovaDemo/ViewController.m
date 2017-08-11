//
//  ViewController.m
//  WPCordovaDemo
//
//  Created by 王鹏 on 2017/8/11.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import "ViewController.h"
#import "WPWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonDidClick:(id)sender {
    WPWebViewController *web = [[WPWebViewController alloc] init];
    [self.navigationController pushViewController:web animated:YES];

}


@end
