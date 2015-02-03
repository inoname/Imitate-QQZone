//
//  KLBottomBar.m
//  QQ空间
//
//  Created by kouliang on 15/2/2.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "KLBottomBar.h"

@implementation KLBottomBar
#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupButton:@"tabbar_mood" action:@selector(moodClick)];
        [self setupButton:@"tabbar_blog" action:@selector(blogClick)];
        [self setupButton:@"tabbar_photo" action:@selector(photoClick)];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    for (int i = 0; i < count; ++i) {
        UIButton *button = self.subviews[i];
        button.height = KLDockButtonH;
        if (KLScreenIsPortrait) { // 竖屏
            button.x = 0;
            button.y = i * button.height;
            button.width=self.width;
        } else { // 横屏
            button.x = i * button.width;
            button.y = 0;
            button.width=self.width/count;
        }
    }
}

#pragma mark - 创建按钮
/**
 *  创建按钮
 *
 *  @param image  按钮的图片
 *  @param action 点击按钮会调用的方法
 */
- (void)setupButton:(NSString *)image action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

#pragma mark - 监听按钮点击
- (void)moodClick
{
    NSLog(@"moodClick");
}

- (void)blogClick
{
    NSLog(@"blogClick");
}

- (void)photoClick
{
    NSLog(@"photoClick");
}
@end
