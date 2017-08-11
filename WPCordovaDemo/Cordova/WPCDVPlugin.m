//
//  WPCDVPlugin.m
//  CordovalDemo
//
//  Created by 王鹏 on 2017/8/8.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import "WPCDVPlugin.h"

#import <UIKit/UIKit.h>
@implementation WPCDVPlugin


-(void)Add:(CDVInvokedUrlCommand*)command
{

    [self forwardToViewController:command];
}
- (void)Search:(CDVInvokedUrlCommand *)command {
    
    [self forwardToViewController:command];
}
- (void)Delect:(CDVInvokedUrlCommand *)command {
    
    [self forwardToViewController:command];
}

- (void)forwardToViewController:(CDVInvokedUrlCommand *)command {
    
    [self.commandDelegate runInBackground:^{
        [(CDVViewController *)self.viewController receiveJSEventWith:command];
    }];
}
@end
