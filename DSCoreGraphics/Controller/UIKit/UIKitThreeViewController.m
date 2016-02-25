//
//  UIKitThreeViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/2/23.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "UIKitThreeViewController.h"

@interface MyLayerDelegate : NSObject

@end

@implementation MyLayerDelegate

- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)ctx {
    
    UIGraphicsPushContext(ctx);
    
    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
    
    UIGraphicsPopContext();
}
@end


@interface UIKitThreeViewController()


@end

@implementation UIKitThreeViewController{
    
    MyLayerDelegate *_layerDeleagete;
    
    CALayer         *_layer;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    _layerDeleagete = [[MyLayerDelegate alloc] init];
    
    //1.创建自定义的layer
    _layer=[CALayer layer];
    //2.设置layer的属性
    _layer.backgroundColor= [UIColor blackColor].CGColor;
    _layer.frame=CGRectMake(100, 100, 200, 200);
    
    _layer.delegate = _layerDeleagete;
    [_layer setNeedsDisplay];
    
    //3.添加layer
    [self.view.layer addSublayer:_layer];
}

- (void)dealloc{
    
    _layer.delegate = nil;
}

@end
