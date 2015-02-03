//
//  KLTabBar.m
//  QQ空间
//
//  Created by kouliang on 15/2/2.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "KLTabBar.h"
#import "KLTabBarButton.h"

@interface KLTabBar ()
@property(nonatomic,weak)KLTabBarButton *selectedButton;

@end
@implementation KLTabBar


#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupButton:@"tab_bar_feed_icon" title:@"全部动态"];
        [self setupButton:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupButton:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupButton:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupButton:@"tab_bar_friend_icon" title:@"好友"];
        [self setupButton:@"tab_bar_e_more_icon" title:@"更多"];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    for (int i = 0; i < count; ++i) {
        KLTabBarButton *button = self.subviews[i];
        button.width = self.width;
        button.height = KLDockButtonH;
        button.x = 0;
        button.y = i * button.height;
    }
}

#pragma mark - 创建按钮
/**
 *  创建按钮
 *
 *  @param image  按钮的图片
 *  @param title  按钮的标题
 */
- (void)setupButton:(NSString *)image title:(NSString *)title
{
    KLTabBarButton *button = [[KLTabBarButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    button.tag=self.subviews.count;
    
    [self addSubview:button];
}

#pragma mark - 监听按钮点击
- (void)buttonClick:(KLTabBarButton *)button
{
    // 更改按钮状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:KLButtonDidSelectNotification object:nil userInfo:@{KLSelectedButtonIndexKey:@(button.tag)}];
    
}
@end
