//
//  WPCDVPlugin.h
//  CordovalDemo
//
//  Created by 王鹏 on 2017/8/8.
//  Copyright © 2017年 王鹏. All rights reserved.
//
#import "CDV.h"
#import "CDVPlugin.h"




@interface WPCDVPlugin : CDVPlugin
- (void)Add:(CDVInvokedUrlCommand *)command;
- (void)Search:(CDVInvokedUrlCommand *)command;
- (void)Delect:(CDVInvokedUrlCommand *)command;



@end
