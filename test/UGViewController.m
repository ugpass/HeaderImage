//
//  UGViewController.m
//  test
//
//  Created by FWJ on 17/1/19.
//  Copyright © 2017年 lc. All rights reserved.
//

#import "UGViewController.h"
#import "HMObjcSugar.h"
//@import AFNetworking;
#import "YYWebImage.h"

#define kHEADERHEIGHT 200

static NSString *identifier = @"cellID";
@interface UGViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation UGViewController
{
    UIView              *_headerView;
    UIImageView         *_headerImageView;
}

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
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), kHEADERHEIGHT)];
    _headerView.backgroundColor = [UIColor hm_colorWithHex:0xF9F9F9];
    [self.view addSubview:_headerView];
    
    _headerImageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    _headerView.backgroundColor = [UIColor hm_colorWithHex:0x000033];
    [_headerView addSubview:_headerImageView];
    
    
    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    _headerImageView.clipsToBounds = YES;
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.who.int/campaigns/immunization-week/2015/large-web-banner.jpg?ua=1"];
    //AFN加载图片
//    [headerImageView setImageWithURL:url];
    
    //YYWebImage加载图片
    [_headerImageView yy_setImageWithURL:url options:YYWebImageOptionShowNetworkActivity];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentInset.top + scrollView.contentOffset.y;
    if (offset <= 0) {
        //放大
        _headerView.hm_y = 0;
        _headerView.hm_height = kHEADERHEIGHT - offset;
        _headerImageView.hm_height = _headerView.hm_height;
    }else{
        //整体上移
        _headerView.hm_height = kHEADERHEIGHT;
        _headerImageView.hm_height = _headerView.hm_height;
        //设置headerView 最小y值
        CGFloat min = kHEADERHEIGHT - 64;
        
        _headerView.hm_y = -MIN(min, offset);
        //设置透明度
        CGFloat progress = 1 - offset / min;
        _headerImageView.alpha = progress;
        
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
