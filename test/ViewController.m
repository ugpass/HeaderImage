//
//  ViewController.m
//  test
//
//  Created by FWJ on 17/1/19.
//  Copyright © 2017年 lc. All rights reserved.
//

#import "ViewController.h"
#import "HMObjcSugar.h"
#import "UGViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)clickBtn:(id)sender {
    UGViewController *vc = [[UGViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
