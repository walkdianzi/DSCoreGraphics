//
//  DrawEightViewController.m
//  DSCoreGraphics
//
//  Created by dasheng on 16/9/23.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DrawEightViewController.h"

@interface DrawEightView : UIView {

    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
}

@property (nonatomic) float progress;//0~1之间的数
@property (nonatomic) float progressWidth;

@end

@implementation DrawEightView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _progressLayer = [CAShapeLayer new];
        [self.layer addSublayer:_progressLayer];
        _progressLayer.fillColor = nil;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.frame = self.bounds;
        
        //默认5
        self.progressWidth = 10;
    }
    return self;
}

- (void)setProgress
{
    _progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:40 startAngle:- M_PI_2 endAngle:(M_PI * 2) * _progress - M_PI_2 clockwise:YES];
    _progressLayer.path = _progressPath.CGPath;
}


- (void)setProgressWidth:(float)progressWidth
{
    _progressWidth = progressWidth;
    _progressLayer.lineWidth = _progressWidth;
    
    [self setProgress];
}


- (void)setProgressColor:(UIColor *)progressColor
{
    _progressLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgress:(float)progress
{
    _progress = progress;
    
    [self setProgress];
}

@end



@interface DrawEightViewController (){
    
    DrawEightView  *_progessView;
}

@end

@implementation DrawEightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _progessView = [[DrawEightView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    _progessView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_progessView];
    _progessView.progressColor = [UIColor colorWithRed:101.0/255.0 green:144.0/255.0 blue:220.0/255.0 alpha:1.0];
    _progessView.progress = .0;
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerHandler:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}

-(void)timerHandler:(NSTimer*)timer
{
    if (_progessView.progress < 1) {
        _progessView.progress=_progessView.progress+0.1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
