//
//  WPCordovaDelegate.h
//  CordovaDemo
//
//  Created by 王鹏 on 2017/8/11.
//  Copyright © 2017年 王鹏. All rights reserved.
//

#ifndef WPCordovaDelegate_h
#define WPCordovaDelegate_h

#define JSAddEvent    @"Add"
#define JSSearchEvent @"Search"
#define JSDeleteEvent @"Delect"


/**
 WPCDVPlugin通过该代理将JS事件回调到控制器中
 CDVViewController准守该代理
 */
@protocol WPCordovaDelegate <NSObject>

/**
 CDVViewController的子类实现该代理，接收并分化JS事件

 @param command js事件对象
 */
- (void)receiveJSEventWith:(CDVInvokedUrlCommand *)command;

@end

#endif /* WPCordovaDelegate_h */
