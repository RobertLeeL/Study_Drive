//
//  FirstViewController.m
//  StudyDrive
//
//  Created by RobertLeeL on 2017/3/20.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "TestSelectViewController.h"
#import "MyDataManager.h"

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_dataArray;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTabView];
    [self creatView];
    
}

- (void)creatTabView {
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _dataArray = @[@"章节练习",@"顺序练习",@"随机练习",@"专项练习",@"仿真模拟考试"];
    
}

- (void)creatView {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 150, self.view.frame.size.height - 64 -140, 300, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"-----------我的考试分析-----------";
    [self.view addSubview:label];
    NSArray *arr = @[@"我的错题",@"我的收藏",@"我的成绩",@"练习统计"];
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(self.view.frame.size.width / 4 * i + self.view.frame.size.width / 4 / 2 - 30,self.view.frame.size.height - 164, 60, 60);
        
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i + 12]] forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 4 * i + self.view.frame.size.width / 4 / 2 - 30, self.view.frame.size.height - 64 - 35, 60, 20)];
        
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:13];
        lab.text = arr[i];
        [self.view addSubview:lab];
    }
    
}

#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"FirstTableViewCell";
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
    }
    cell.myImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row + 7]];
    cell.myLabel.text = _dataArray[indexPath.row];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0://章节练习
        {
            TestSelectViewController *con = [[TestSelectViewController alloc]init];
            con.dateArray = [MyDataManager getData:chapter];
            con.myTitle = @"章节练习";
            UIBarButtonItem *barItem = [[UIBarButtonItem alloc]init];
            barItem.title = @"";
            self.navigationItem.backBarButtonItem = barItem;
            [self.navigationController pushViewController:con animated:YES];
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
