//
//  Tools.m
//  StudyDrive
//
//  Created by 李龙跃 on 2017/3/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Tools.h"

@implementation Tools

+ (NSArray *)getAnswerWithString:(NSString *)str {
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    NSArray *arr = [str componentsSeparatedByString:@"<BR>"];
    
    [array addObject:arr[0]];
    
    for (int i = 0; i < 4; i++) {
        [array addObject:[arr[i + 1] substringFromIndex:2]];
        
    }
    return array;
}

+ (CGSize)getSizeWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size {
    CGSize newSize = [str sizeWithFont:font constrainedToSize:size];
//    CGSize newSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
//    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
//    CGSize newSize = [str boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    return newSize;
}

@end
