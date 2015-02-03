//
//  ViewController.m
//  QQ空间
//
//  Created by kouliang on 15/2/2.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

//1.设置按钮中图片和文字对齐的步骤
//  分别固定imageView和titleLabel的frame，再设置imageView的内容模式
//  titleLabel默认为文字左对齐。

//2.按钮取消高亮状态的方法为重写- (void)setHighlighted:(BOOL)highlighted {}

//3.[UIScreen mainScreen].bounds.size在横屏和竖屏状态下取得的size不同

//4.在启动图片中 Portrait(竖屏)   Landscape(横屏)

//5.默认情况下，所有控制器view的autoresizingMask属性中都包含了下面2个值：UIViewAutoresizingFlexibleWidth  UIViewAutoresizingFlexibleHeight,会导致控制器view的frame不受代码控制。
//  这时需要设置view.autoresizingMask = UIViewAutoresizingNone;


//6.layoutSubviews方法会在view的frame发生改变时调用。




#import "ViewController.h"
#import <UIView+AutoLayout.h>
#import "KLDock.h"
#import "KLTableViewController.h"

@interface ViewController ()
@property(nonatomic,weak)UIView *dock;
@property(nonatomic,weak)UIView *contentView;
@property(nonatomic,weak)UIViewController *currentShowingVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDock];
    [self setupContentView];
    [self setupChildVces];
    [self setupNotes];
}

#pragma mark - 注册通知
- (void)setupNotes
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarDidSelect:) name:KLButtonDidSelectNotification object:nil];
}

#pragma mark - 移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - setupDock
-(void)setupDock{
    KLDock *dock=[[KLDock alloc]init];
    [self.view addSubview:dock];
    self.dock=dock;
    
#warning 横屏和竖屏得到的size不同
    [self viewWillTransitionToSize:[UIScreen mainScreen].bounds.size withTransitionCoordinator:nil];
}

#pragma mark - setupContentView
-(void)setupContentView{
    UIView *contentView=[[UIView alloc]init];
    [self.view addSubview:contentView];
#warning  先添加到父控件才能添加约束
    //添加自动布局约束
    [contentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeLeft];
    [contentView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.dock];
    
    self.contentView=contentView;
}


#pragma mark - setupChildVces
- (void)setupChildVces
{
    KLTableViewController *test01 = [[KLTableViewController alloc] init];
    test01.title = @"全部动态";
    [self addChildViewController:test01];
    
    KLTableViewController *test02 = [[KLTableViewController alloc] init];
    test02.title = @"与我相关";
    [self addChildViewController:test02];
    
    KLTableViewController *test03 = [[KLTableViewController alloc] init];
    test03.title = @"照片墙";
    [self addChildViewController:test03];
    
    KLTableViewController *test04 = [[KLTableViewController alloc] init];
    test04.title = @"电子相框";
    [self addChildViewController:test04];
    
    KLTableViewController *test05 = [[KLTableViewController alloc] init];
    test05.title = @"好友";
    [self addChildViewController:test05];
    
    KLTableViewController *test06 = [[KLTableViewController alloc] init];
    test06.title = @"更多";
    [self addChildViewController:test06];
}

#pragma mark - 通知的监听方法
- (void)tabBarDidSelect:(NSNotification *)note
{
    int index = [note.userInfo[KLSelectedButtonIndexKey] intValue];
    KLTableViewController *vc=self.childViewControllers[index];
    [self switchToVC:vc withAnimationType:@"moveIn"];
}
/**
 *  切换控制器
 *
 *  @param viewController 目标控制器
 *  @param type           转场动画类型
 *
 *  type可选类型： Defaults to `fade'.
 *  fade
 *  moveIn
 *  push
 *  reveal
 *  pageCurl        向上翻一页
 *  pageUnCurl      向下翻一页
 *  rippleEffect    滴水效果
 *  suckEffect      收缩效果，如一块布被抽走
 *  cube            立方体效果
 *  oglFlip         上下翻转效果
 */
-(void)switchToVC:(UIViewController *)newVC withAnimationType:(NSString *)type{
    
    if (self.currentShowingVC==newVC) return;
    
    //1.移除当前正在显示的子控制器view
    [_currentShowingVC.view removeFromSuperview];
    
    //2.添加新控制器的view
    newVC.view.frame=self.contentView.bounds;
    [self.contentView addSubview:newVC.view];
    
    //3.获取控制器索引
    NSInteger oldIndex=[self.childViewControllers indexOfObject:_currentShowingVC];
    //NSInteger newIndex=[self.childViewControllers indexOfObject:newVC];
    
    //4.更新_currentVC
    _currentShowingVC=newVC;
    
    if (oldIndex == NSNotFound) return;
    //5.设置切换view的转场动画
    CATransition *animation=[CATransition animation];
    //5.1 动画类型
    animation.type=type;
    //5.2 动画时长
    animation.duration=0.3;
    //5.3 动画方向
    animation.subtype=@"fromRight";
//    animation.subtype=@"fromLeft";
    //4.4 添加动画
    [self.contentView.layer addAnimation:animation forKey:nil];
}
#pragma mark - 监听屏幕旋转(IOS8.0)
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    NSTimeInterval duration=[coordinator transitionDuration];
    [UIView animateWithDuration:duration animations:^{
        self.dock.height=size.height;
        if (size.height>size.width) {  //竖屏
            self.dock.width=KLDockMinW;
        }else{
            self.dock.width=KLDockMaxW;
        }
    }];
}
#warning 旧的监听方法，新方法实现后就不会再调用
/**
 *  屏幕即将旋转的时候调用
 *
 *  @param toInterfaceOrientation 旋转之后的屏幕方向
 *  @param duration               旋转动画的持续时间
 */
//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    NSLog(@"willRotateToInterfaceOrientation - %d", toInterfaceOrientation);
//}
/**
 *  屏幕旋转完毕的时候调用
 *
 *  @param fromInterfaceOrientation 旋转之前的屏幕方向
 */
//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//    NSLog(@"didRotateFromInterfaceOrientation - %d", fromInterfaceOrientation);
//}
@end
