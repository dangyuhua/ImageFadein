//
//  SecondVC.m
//  ImageFadein
//
//  Created by 党玉华 on 2018/11/29.
//  Copyright © 2018年 dangyuhua. All rights reserved.
//

#import "SecondVC.h"
#import <SDWebImage.h>

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 300)];
    imageview.image = [UIImage imageNamed:@"defaultImage"];
    [self.view addSubview:imageview];
    NSString *strUrl = @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=781554239,4182824888&fm=26&gp=0.jpg";
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSString *key = [manager cacheKeyForURL:[NSURL URLWithString:strUrl]];
    SDImageCache *cache = [SDImageCache sharedImageCache];
    UIImage *image = [cache imageFromDiskCacheForKey:key];
    //先从memory中取，没有再从disk取。
    if (image) {
        imageview.image = image;
    }else{
        [imageview sd_setImageWithURL:[NSURL URLWithString:strUrl] placeholderImage:[UIImage imageNamed:@"defaultImage"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            imageview.alpha = 0.0;
            //为了让动画效果明显一点动画时间设置了1秒，可以根据自己需要设置
            [UIView transitionWithView:imageview duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                imageview.alpha = 1.0;
            }completion:NULL];
        }];
    }
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 458, self.view.bounds.size.width-100, 38)];
    [btn setTitle:@"清除缓存()" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
//清除缓存
-(void)btnClick{
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    [[SDImageCache sharedImageCache] clearMemory];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
