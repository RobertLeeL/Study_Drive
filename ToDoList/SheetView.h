//
//  SheetView.h
//  StudyDrive
//
//  Created by 李龙跃 on 2017/4/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SheetView : UIView
{
    @public
    UIView *_backView;;
}

-  (instancetype)initWithFrame:(CGRect)frame withSuperView: (UIView *)superView andQuesCount:(int)count;
@end
