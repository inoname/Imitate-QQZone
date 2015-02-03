//
//  KLTabBarButton.m
//  QQ空间
//
//  Created by kouliang on 15/2/3.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//
#warning 设置按钮中图片和文字对齐
//分别固定imageView和titleLabel的frame，再设置imageView的内容模式
//titleLabel默认为文字左对齐。

#import "KLTabBarButton.h"

@implementation KLTabBarButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 设置背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
        // 让imageView里面的内容居中
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (KLScreenIsPortrait) { // 竖屏
        // 1.图片
        self.imageView.frame = self.bounds;
        
        // 2.文字
        self.titleLabel.width = -1;
        //self.titleLabel.hidden = YES;
    } else { // 横屏
        // 1.图片
        self.imageView.x = 0;
        self.imageView.y = 0;
        self.imageView.height = self.height;
        self.imageView.width = self.width * 0.4;
        
        // 2.文字
        self.titleLabel.y = 0;
        //self.titleLabel.hidden = NO;
        self.titleLabel.width = self.width - self.imageView.width;
        self.titleLabel.height = self.height;
        self.titleLabel.x = self.imageView.width;
    }
}


#warning 取消按钮的高亮显示
- (void)setHighlighted:(BOOL)highlighted {}
@end
