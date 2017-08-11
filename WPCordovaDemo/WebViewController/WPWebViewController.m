//
//  WPWebViewController.m
//  CordovalDemo
//
//  Created by 王鹏 on 2017/8/8.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#import "WPWebViewController.h"


@interface WPWebViewController ()

@end

@implementation WPWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - WPCordovaDelegate
- (void)receiveJSEventWith:(CDVInvokedUrlCommand *)command {
    NSLog(@"methodName:%@\nclassName:%@\ncallbackId:%@\narguments:%@",command.methodName,command.className,command.callbackId,command.arguments);
    // 分发事件
    if ([command.methodName isEqualToString:JSAddEvent]) {
        [self Add:command];
    } else if([command.methodName isEqualToString:JSSearchEvent]) {
        [self Search:command];
    } else if ([command.methodName isEqualToString:JSDeleteEvent]) {
        [self Delete:command];
    }
}
#pragma mark - JS Event Handler
- (void)Add:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSString *message = [command.arguments objectAtIndex:0];
    // 根据参数判断是否成功！
    if (message != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Arg have message"];
        pluginResult.keepCallback = @1;
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)Search:(CDVInvokedUrlCommand *)command {
    // 收到H5的事件 提示！
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"原生提示"
                                                                   message:@"收到H5搜索事件！"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action= [UIAlertAction actionWithTitle:@"确定"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action)
                            {
                                // 回调H5事件 回调结果为成功！
                                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                                                  messageAsString:@"搜索成功！"];
                                [self.commandDelegate sendPluginResult:pluginResult
                                                            callbackId:command.callbackId];
                                
                            }];
    [alert addAction:action];
    [self showAlertView:alert];
    
}

- (void)Delete:(CDVInvokedUrlCommand *)command {
    // 收到H5的事件 提示！
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"原生提示"
                                                                   message:@"收到H5删除事件！"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action= [UIAlertAction actionWithTitle:@"确定"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action)
                            {
                                // 回调H5事件 回调结果为失败！
                                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                                                  messageAsString:@"删除失败！"];
                                [self.commandDelegate sendPluginResult:pluginResult
                                                            callbackId:command.callbackId];
                                
                            }];
    [alert addAction:action];
    [self showAlertView:alert];

}
#pragma mark - 主线程中提示
- (void)showAlertView:(UIAlertController *)alert {
   
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    });
}
@end
