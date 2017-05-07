//
//  Tools.h
//  StudyDrive
//
//  Created by 李龙跃 on 2017/3/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject

+ (NSArray *)getAnswerWithString :(NSString *)str ;

+ (CGSize)getSizeWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size;

@end
