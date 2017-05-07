//
//  AnswerViewController.m
//  StudyDrive
//
//  Created by 李龙跃 on 2017/3/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AnswerViewController.h"
#import "AnswerScrollView.h"
#import "MyDataManager.h"
#import "AnswerModel.h"
#import "SelectModelView.h"
#import "SheetView.h"

@interface AnswerViewController ()
{
    AnswerScrollView *view;
    SelectModelView *SMView;
    SheetView *_sheetView;
}
@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *arr= [MyDataManager getData:answer];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i < arr.count - 1; i++) {
        AnswerModel *model = arr[i];
        if ([model.pid intValue] == _number + 1) {
            [array addObject:model];
        }
    }
    view  = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 60)  withDataArray:array];
    [self.view addSubview:view];
    
    
    
    [self creatToolbar];
    
    [self creatModelView];
    
    [self creatSheetView];
    // Do any additional setup after loading the view.
}


- (void)creatSheetView {
    _sheetView = [[SheetView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - 150)withSuperView:self.view andQuesCount:50];
    [self.view addSubview:_sheetView];
    
    
}

- (void)creatModelView{
    SMView = [[SelectModelView alloc]initWithFrame:self.view.frame addTouch:^(SelectModel model) {
        NSLog(@"当前模式是：%d",model);
        
    }];
    [self.view addSubview:SMView];
    
    SMView.alpha = 0;
    UIBarButtonItem  *item = [[UIBarButtonItem alloc]initWithTitle:@"答题模式" style:UIBarButtonItemStylePlain target:self action:@selector(modelChange)];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)modelChange {
    [UIView animateWithDuration:1.0 animations:^{
        SMView.alpha = 1;
    }];
}

- (void)creatToolbar {
    UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 60 - 64, self.view.frame.size.width, 60)];
    
    barView.backgroundColor = [UIColor whiteColor];
    
    NSArray *arr = @[@"2333",@"查看答案",@"收藏本题"];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(self.view.frame.size.width / 3 * i + self.view.frame.size.width / 3 / 2 - 22, 2, 40, 40);
        
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i + 16]] forState:UIControlStateNormal];
        
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-2.png",i + 16]] forState:UIControlStateHighlighted];
        
        btn.tag = 666 + i;
        [btn addTarget:self action:@selector(clickToolBar:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(btn.center.x - 30, 40, 60, 18)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = arr[i];
        label.font = [UIFont systemFontOfSize:13];
        [barView addSubview:btn];
        [barView addSubview:label];
        
    }
    [self.view addSubview:barView];
}

- (void)clickToolBar:(UIButton *)btn {
    switch (btn.tag) {
        case 667://查看答案
            if ([view.hadAnswerArray[view.currentPage] intValue] != 0) {
                return;
            }else {
                AnswerModel *model = [view.dataArray objectAtIndex:view.currentPage];
                NSString * answer = model.manswer;
                char an = [answer characterAtIndex:0];
                [view.hadAnswerArray replaceObjectAtIndex:view.currentPage withObject:[NSString stringWithFormat:@"%d",an-'A'+1]];
                [view.leftTableView reloadData];
                [view.rightTableView reloadData];
                [view.mainTableView reloadData];
            }
            break;
        case 666://
        {
            [UIView animateWithDuration:0.3 animations:^{
                _sheetView.frame = CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height);
                _sheetView->_backView.alpha = 0.8;
            }];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
