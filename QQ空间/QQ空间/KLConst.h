#import <UIKit/UIKit.h>

//Dock宽度
UIKIT_EXTERN const CGFloat KLDockMaxW;
UIKIT_EXTERN const CGFloat KLDockMinW;

//屏幕尺寸
UIKIT_EXTERN const CGFloat KLScreenMaxWH;
UIKIT_EXTERN const CGFloat KLScreenMinWH;

//Dock内部按钮高度
UIKIT_EXTERN const CGFloat KLDockButtonH;

//屏幕状态
//UIKIT_EXTERN BOOL KLPortrait;


// 按钮被选中的通知
UIKIT_EXTERN NSString *const KLButtonDidSelectNotification;
// 通过这个key可以取出被选中按钮的索引
UIKIT_EXTERN NSString *const KLSelectedButtonIndexKey;
