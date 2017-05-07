//
//  SelectModelView.h
//  StudyDrive
//
//  Created by 李龙跃 on 2017/4/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    testModel,
    lookingModel
}SelectModel;

typedef void (^SelectTouch)(SelectModel model);

@interface SelectModelView : UIView

@property (nonatomic,assign)SelectModel model;

- (SelectModelView *)initWithFrame:(CGRect)frame addTouch:(SelectTouch)touch;
@end
