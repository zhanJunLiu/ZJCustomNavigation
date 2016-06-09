//
//  UINavigationController+Extension.m
//  ZJCustomNavigation
//
//  Created by 刘战军 on 16/6/8.
//  Copyright © 2016年 LiuZhanJun. All rights reserved.
//

#import "UINavigationController+Extension.h"
#import <objc/runtime.h>

static NSString *const customNavkey = @"";

@interface UINavigationBar () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *alphaView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIColor *navBarColor;

@end

@implementation UINavigationBar (Extension)

-(UIView *)alphaView {
    
    return objc_getAssociatedObject(self, @selector(alphaView));
}

-(void)setAlphaView:(UIView *)alphaView {
    objc_setAssociatedObject(self, @selector(alphaView), alphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)scrollView {
    return objc_getAssociatedObject(self, @selector(scrollView));
}

-(void)setScrollView:(UIScrollView *)scrollView {
    /**
     *  使用runtime创建分类属性
     *
     *  @param self       给哪个对象设置属性
        @Selector         这里可以使用_cmd  也可以自定义Key 和使用下面这种方式
     *  @param scrollView 给属性设置的值
     */
    objc_setAssociatedObject(self, @selector(scrollView), scrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)navBarColor {
    return objc_getAssociatedObject(self, @selector(navBarColor));
}

- (void)setNavBarColor:(UIColor *)navBarColor {
    objc_setAssociatedObject(self, @selector(navBarColor), navBarColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setColor:(UIColor *)color andAlpha:(CGFloat)alpha andScrollView:(UIScrollView *)scrollView {
    
    self.navBarColor = color;
    
    self.scrollView = scrollView;
    
    self.scrollView.delegate = self;
    
    if (self.alphaView) {
        self.alphaView.alpha = alpha;
    }else {
        
        UIImage *image = [UIImage new];
        
        [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
        UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        
        alphaView.alpha = alpha;
        
        alphaView.backgroundColor = color;
        
        [self setAlphaView:alphaView];
        
        [self insertSubview:alphaView atIndex:0];
        
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat alpha = offsetY / 380;
    
//    [self setColor:self.navBarColor andAlpha:alpha andScrollView:scrollView];
    
    if (offsetY <= 380) {
        
        //        self.navBarView.alpha = alpha;
//        self.alphaView.backgroundColor = [UIColor colorWithRed:255.0/255 green:51.0/255 blue:51.0/255 alpha:alpha];
        
        self.alphaView.alpha = alpha;
        
    }else {
        
        self.alphaView.alpha = 0.8;
//        self.alphaView.backgroundColor = [UIColor colorWithRed:255.0/255 green:51.0/255 blue:51.0/255 alpha:0.8];
    }
    
    NSLog(@"%lf", offsetY);
    
    if (offsetY < 0) {
        
        self.transform = CGAffineTransformMakeTranslation(0, offsetY);
        
    }
}



@end
