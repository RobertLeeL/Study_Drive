//
//  MyDataManager.h
//  StudyDrive
//
//  Created by 李龙跃 on 2017/3/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    chapter, //章节练习数据
    answer,  //答题数据
    subChapter//专项练习
}DataType;

@interface MyDataManager : NSObject

+ (NSArray *)getData:(DataType)type;


@end
