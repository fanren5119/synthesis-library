//
//  ViewController.m
//  Test
//
//  Created by 王磊 on 2017/9/12.
//  Copyright © 2017年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "LibOne.h"
#import "LibTwo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LibOne *one = [[LibOne alloc] init];
    [one testOne];
    
    LibTwo *two = [[LibTwo alloc] init];
    [two testTwo];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
