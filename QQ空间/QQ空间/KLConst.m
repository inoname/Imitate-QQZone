#import <UIKit/UIKit.h>

//Dock宽度
const CGFloat KLDockMaxW=270;
const CGFloat KLDockMinW=75;

//屏幕尺寸
const CGFloat KLScreenMaxWH=1024;
const CGFloat KLScreenMinWH=768;

//Dock内部按钮高度
const CGFloat KLDockButtonH=80;

//屏幕状态
BOOL KLPortrait=YES;


// 按钮被选中的通知
NSString *const KLButtonDidSelectNotification = @"KLButtonDidSelectNotification";
// 通过这个key可以取出被选中按钮的索引
NSString *const KLSelectedButtonIndexKey = @"KLSelectedButtonIndexKey";
