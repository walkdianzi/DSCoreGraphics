//
//  DrawTwoViewController.m
//  DSCoreGraphics
//
//  Created by 童玉龙 on 16/9/9.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DrawTwoViewController.h"

@implementation DrawTwoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300,300), NO, 0);
    
    
    UIImage *img1 = [UIImage imageNamed:@"one"];
    UIImage *img2 = [UIImage imageNamed:@"two"];
    UIImage *img3 = [UIImage imageNamed:@"three"];
    //这里使用了混合模式，正常和透明度为50%
    [img1 drawInRect:CGRectMake(0, 0, 150, 150) blendMode:kCGBlendModeNormal alpha:.5];
    [img2 drawInRect:CGRectMake(50, 50, 150, 150)];
    [img3 drawInRect:CGRectMake(150, 150, 150, 150)];
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    /*---------------------------------*/
    UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    [imageView setImage:im];
    [self.view addSubview:imageView];
}

@end
