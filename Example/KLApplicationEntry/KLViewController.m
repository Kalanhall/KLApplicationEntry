//
//  KLViewController.m
//  KLApplicationEntry
//
//  Created by Kalanhall@163.com on 11/28/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLViewController.h"

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:nil forState:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KLViewController *vc = KLViewController.new;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
