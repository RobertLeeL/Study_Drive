//
//  SelectModelView.m
//  StudyDrive
//
//  Created by 李龙跃 on 2017/4/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SelectModelView.h"

@implementation SelectModelView
{
    SelectTouch block;
}

- (SelectModelView *)initWithFrame:(CGRect)frame addTouch:(SelectTouch)touch {
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
        block = touch;
        _model = testModel;
    }
    return self;
}

- (void)creatUI {
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    
    NSArray *array = @[@"答题模式",@"背题模式"];
    for (int i = 0; i < array.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(self.frame.size.width / 2 - 50, self.frame.size.height/ 2 - 200 + i * 130, 100, 100);
        btn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        btn.tag = 100 + i;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 8;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d11q.png",i+1]];
        [btn addSubview:image];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 80, 20)];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = array[i];
        [btn addSubview:label];
        [self addSubview:btn];
    }
}

- (void)click:(UIButton *)btn {
    if (btn.tag == 100) {
        _model = testModel;
    }else {
        _model = lookingModel;
    }
    block(_model);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
