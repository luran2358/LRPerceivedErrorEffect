//
//  ViewController.m
//  LRPerceivedErrorEffect
//
//  Created by 卢然 on 16/7/5.
//  Copyright © 2016年 scorpio. All rights reserved.
//

#import "ViewController.h"
#import "LRPerceivedErrorCell.h"

#define LRRowHeight 200

#define LRCount 10

#define LRGetImage(row) [UIImage imageNamed:[NSString stringWithFormat:@"%zd",row]]

@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UIScrollViewDelegate
>

@property (nonatomic, weak)UITableView *perceivedErrorTableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
}


- (void)setupTableView
{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.rowHeight = LRRowHeight;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor blackColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.perceivedErrorTableView = tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return LRCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    LRPerceivedErrorCell *cell = [LRPerceivedErrorCell perceicedErrorCellFromXib:tableView];
    
    cell.backgroundImage.image = LRGetImage(indexPath.row + 1);
    
    return cell;
}


//滚动监听
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获取表视图的可见单元格。(可见的视图)
    NSArray *visibleCells = [self.perceivedErrorTableView visibleCells];
    
    for (LRPerceivedErrorCell *cell in visibleCells) {
        //可见视图设置->背景图片y值
        [cell cellOnTableView:self.perceivedErrorTableView didScrollView:self.view];
    }
    
}

//视图加载完在调用scrollViewDidScroll方法
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self scrollViewDidScroll:[[UIScrollView alloc]init]];
    
}

@end
