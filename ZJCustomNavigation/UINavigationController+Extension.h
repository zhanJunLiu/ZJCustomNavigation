//
//  UINavigationController+Extension.h
//  ZJCustomNavigation
//
//  Created by 刘战军 on 16/6/8.
//  Copyright © 2016年 LiuZhanJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Extension)

/**
 *  封装自定义navigationBar方法
 *
 *  @param color      需要的颜色
 *  @param alpha      透明度
 *  @param scrollView 需要滚动的控件
 */
- (void)setColor:(UIColor *)color andAlpha:(CGFloat)alpha andScrollView:(UIScrollView *)scrollView;


@end
