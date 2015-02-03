//
//  KLDock.m
//  QQ空间
//
//  Created by kouliang on 15/2/2.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "KLDock.h"
#import "KLBottomBar.h"
#import "KLTabBar.h"
#import "KLIconButton.h"

@interface KLDock ()
@property(nonatomic,weak)KLIconButton *iconButton;
@property(nonatomic,weak)KLTabBar *tabBar;
@property(nonatomic,weak)KLBottomBar *bottomBar;
@end

@implementation KLDock
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor=KLRGBColor(50, 50, 50);
        
        KLBottomBar *bottomBar=[[KLBottomBar alloc]init];
        self.bottomBar=bottomBar;
        
        
        KLTabBar *tabBar=[[KLTabBar alloc]init];
        self.tabBar=tabBar;
        
        
        KLIconButton *iconButton=[[KLIconButton alloc]init];
        self.iconButton=iconButton;
        
        
        [self addSubview:bottomBar];
        [self addSubview:tabBar];
        [self addSubview:iconButton];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    //设置bottonBar
    self.bottomBar.x=0;
    self.bottomBar.width=self.width;
    if (KLScreenIsPortrait) {
        self.bottomBar.height=KLDockButtonH*self.bottomBar.subviews.count;
    }else{
        self.bottomBar.height=KLDockButtonH;
    }
    self.bottomBar.y=self.height-self.bottomBar.height;
    
    //设置tabBar
    self.tabBar.width=self.width;
    self.tabBar.height=KLDockButtonH*6;
    self.tabBar.x=0;
    self.tabBar.y=self.bottomBar.y-self.tabBar.height;
    
    //设置iconButton
    if (KLScreenIsPortrait) {
        self.iconButton.width=self.width*0.8;
        self.iconButton.y=64;
        self.iconButton.height=self.iconButton.width;
    }else{
        self.iconButton.width=self.width*0.4;
        self.iconButton.y=44;
        self.iconButton.height=self.iconButton.width+30;
    }
    self.iconButton.x=(self.width-self.iconButton.width)*0.5;
    
}
@end
