//
//  UGViewController.m
//  test
//
//  Created by FWJ on 17/1/19.
//  Copyright © 2017年 lc. All rights reserved.
//

#import "UGViewController.h"

#define kHEADERHEIGHT 200

static NSString *identifier = @"cellID";
@interface UGViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation UGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [self prepareTableView];
    [self prepareHeaderView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)prepareHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), kHEADERHEIGHT)];
    headerView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:headerView];
}

- (void)prepareTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];

    tableView.delegate = self;
    tableView.dataSource = self;

    [self.view addSubview:tableView];

    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];

    tableView.contentInset = UIEdgeInsetsMake(kHEADERHEIGHT, 0, 0, 0);

    tableView.scrollIndicatorInsets = tableView.contentInset;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    cell.textLabel.text = @(indexPath.row).stringValue;

    return cell;

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
