//
//  UIKitFourViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/2/25.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "UIKitFourViewController.h"

@implementation UIKitFourViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100), NO, 0);
    
    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    /*---------------------------------*/
    UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imageView setImage:im];
    [self.view addSubview:imageView];
}


@end
