//
//  CGFourViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/2/25.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "CGFourViewController.h"

@implementation CGFourViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100), NO, 0);
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(con, CGRectMake(0,0,100,100));
    
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    
    CGContextFillPath(con);
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    /*---------------------------------*/
    UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imageView setImage:im];
    [self.view addSubview:imageView];
}


@end
