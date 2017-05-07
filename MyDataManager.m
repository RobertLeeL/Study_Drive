//
//  MyDataManager.m
//  StudyDrive
//
//  Created by 李龙跃 on 2017/3/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyDataManager.h"
#import "FMDatabase.h"
#import "TestSelectModel.h"
#import "AnswerModel.h"

@implementation MyDataManager


+ (NSArray *)getData:(DataType)type {
    static FMDatabase *dataBase;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    if (dataBase == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];
        dataBase = [[FMDatabase alloc]initWithPath:path];
        //把SQLite给database
//        dataBase = [FMDatabase databaseWithPath:@"/Users/apple/Desktop/sucai_0iOFpbW/素材文件/源码1-0/源码1/data.sqlite"];
    }
    if ([dataBase open]) {
        NSLog(@"open success");
    }else {
        return array;
    }
    switch (type) {
        case chapter:
        {
//            NSString *sql = @"SELECT pid,pname,pcount FROM firstlevel";
            FMResultSet *rs = [dataBase executeQuery:@"SELECT *FROM firstlevel"];
            if (rs == nil) {
                NSLog(@"rs为空");
            }
            while ([rs next]) {
                TestSelectModel *model = [[TestSelectModel alloc]init];
                model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname = [rs stringForColumn:@"pname"];
                model.pcount = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pcount"]];
                [array addObject:model];
                
            }
        }
            break;
            case answer:
            {
                FMResultSet *rs = [dataBase executeQuery:@"SELECT *FROM leaflevel"];
                if (rs == nil) {
                    NSLog(@"rs为空");
                }
                while ([rs next]) {
                    AnswerModel *model = [[AnswerModel alloc]init];
                   
                    model.mquestion = [rs stringForColumn:@"mquestion"];
                    model.mdesc = [rs stringForColumn:@"mdesc"];
                    model.pname = [rs stringForColumn:@"pname"];
                    model.manswer = [rs stringForColumn:@"manswer"];
                    model.mimage = [rs stringForColumn:@"pimage"];
                    model.sname = [rs stringForColumn:@"sname"];
                    model.mtype = [NSString stringWithFormat:@"%d",[rs intForColumn:@"mtype"]];
                    model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                    model.mid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"mid"]];
                    model.sid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"sid"]];
                    
                    
                    [array addObject:model];
            }
            }
                break;
            default:
            break;
    }
    return array;
}

@end

