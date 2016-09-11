//
//  DrawFiveViewController.m
//  DSCoreGraphics
//
//  Created by 童玉龙 on 16/9/11.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DrawFiveViewController.h"

@implementation DrawFiveViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200,200), NO, 0);

    CGContextRef context = UIGraphicsGetCurrentContext();

    //DrawingRect
    CGRect strokeRect = CGRectMake(0, 85, 200, 60);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 2.0f);
    CGContextStrokeRect(context, strokeRect);

    UIColor *clearRed = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.2];
    CGContextSetFillColorWithColor(context, clearRed.CGColor);
    CGContextFillRect(context, strokeRect);

    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();


    /*---------------------------------*/
    UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 250, 200)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setImage:im];
    [self.view addSubview:imageView];
}

@end
