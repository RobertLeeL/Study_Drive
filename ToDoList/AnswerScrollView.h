//
//  AnswerScrollView.h
//  StudyDrive
//
//  Created by 李龙跃 on 2017/3/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView : UIView
{
    @public
    UIScrollView *_scrollView;

}

@property (nonatomic,assign)int currentPage;

- (instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)dataArray;


@property (nonatomic,strong)NSMutableArray *hadAnswerArray;
@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,strong)UITableView *leftTableView;

@property (nonatomic,strong)UITableView *rightTableView;

@property (nonatomic,strong)UITableView *mainTableView;


- (void)reloadData;
//@property (nonatomic,strong)UIScrollView *scrollView;
@end
