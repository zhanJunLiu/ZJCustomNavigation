//
//  ViewController.m
//  ZJCustomNavigation
//
//  Created by 刘战军 on 16/6/8.
//  Copyright © 2016年 LiuZhanJun. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+Extension.h"
#import "ZJTestViewController.h"

static NSString *const ID = @"cell";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 调用自定义navigationBar */
    [self.navigationController.navigationBar setColor:[UIColor redColor] andAlpha:0.0 andScrollView:self.tableView];
    
   
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSString *string = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    cell.textLabel.text = string;
    
    return cell;
}

- (IBAction)didClickItemButton:(UIBarButtonItem *)sender {
    
    ZJTestViewController *test = [[ZJTestViewController alloc] init];
    
    [self.navigationController pushViewController:test animated:YES];
}
@end
