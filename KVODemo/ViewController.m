//
//  ViewController.m
//  KVODemo
//
//  Created by YZY on 2017/6/30.
//  Copyright © 2017年 YZY. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView *_tableView;
    
    CGFloat _currentPrice;
    
    NSArray *_modelArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [_tableView registerNib: [UINib nibWithNibName: @"TableViewCell" bundle: [NSBundle mainBundle]] forCellReuseIdentifier: @"TableViewCell"];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i <= 10; i ++) {
        
        CellModel *model = [[CellModel alloc] init];
        
        model.price = [NSString stringWithFormat: @"%d",arc4random() % 100];
        
        [tempArray addObject: model];
    }
    
    _modelArray = [NSArray arrayWithArray: tempArray];
    
    [_tableView reloadData];
    
    [NSTimer scheduledTimerWithTimeInterval: 1 repeats: YES block:^(NSTimer * _Nonnull timer) {

        for (CellModel *model in _modelArray) {
            model.price = [NSString stringWithFormat: @"%ld",([model.price integerValue] + 1)];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"TableViewCell"];
    
    cell.model = _modelArray[indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
