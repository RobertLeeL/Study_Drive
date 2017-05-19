//
//  AnswerViewController.h
//  StudyDrive
//
//  Created by 李龙跃 on 2017/3/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SheetView.h"

@interface AnswerViewController : UIViewController<SheetViewDelegate>

@property (nonatomic,assign)int number;
//type= 1章节 type= 2顺序练习  type= 3 随机练习
@property (nonatomic,assign)int type;

- (void)SheetViewClick:(int)index;
@end
