//
//  DrawOneViewController.m
//  DSCoreGraphics
//
//  Created by 童玉龙 on 16/9/9.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DrawOneViewController.h"

@implementation DrawOneViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200,200), NO, 0);
    
    
    UIFont *font = [UIFont systemFontOfSize:30];
    NSString *string = @"Core Graphics";
    [string drawAtPoint:CGPointMake(0, 0) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]}];
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    /*---------------------------------*/
    UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imageView setImage:im];
    [self.view addSubview:imageView];
}


@end
