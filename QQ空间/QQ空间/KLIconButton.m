//
//  KLIconButton.m
//  QQ空间
//
//  Created by kouliang on 15/2/2.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "KLIconButton.h"

@implementation KLIconButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setImage:[UIImage imageNamed:@"login_default_avatar"] forState:UIControlStateNormal];
        [self setTitle:@"你还好吗" forState:UIControlStateNormal];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    if (KLScreenIsPortrait) {
        self.imageView.frame=self.bounds;
        self.titleLabel.width=-1;
    }else{
        self.imageView.frame=CGRectMake(0, 0, self.width, self.width);
        self.titleLabel.x=0;
        self.titleLabel.y=self.imageView.height;
        self.titleLabel.width=self.width;
        self.titleLabel.height=self.height-self.imageView.height;
    }
}
@end
