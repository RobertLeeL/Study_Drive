//
//  SheetView.h
//  StudyDrive
//
//  Created by 李龙跃 on 2017/4/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SheetViewDelegate
@required
- (void)SheetViewClick:(int)index;

@end

@interface SheetView : UIView
{
    @public
    UIView *_backView;;
}

@property (nonatomic,assign)id<SheetViewDelegate> delegate;

-  (instancetype)initWithFrame:(CGRect)frame withSuperView: (UIView *)superView andQuesCount:(int)count;
@end
