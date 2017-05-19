//
//  TestSelectViewController.h
//  StudyDrive
//
//  Created by 李龙跃 on 2017/3/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestSelectViewController : UIViewController

@property (nonatomic,copy) NSString *myTitle;

@property (nonatomic,copy) NSArray *dateArray;


//type== 1 章节 type==2  专项
@property (nonatomic,assign)int type;

@end
