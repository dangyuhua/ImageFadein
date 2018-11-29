//
//  ViewController.m
//  ImageFadein
//
//  Created by 党玉华 on 2018/11/29.
//  Copyright © 2018年 dangyuhua. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 458, self.view.bounds.size.width-100, 38)];
    [btn setTitle:@"点击进入" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick{
    SecondVC *vc = [[SecondVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
