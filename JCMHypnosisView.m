//
//  JCMHypnosisView.m
//  Hypnosister
//
//  Created by Xiaoming Chen on 15/10/7.
//  Copyright © 2015年 Jackchenxm. All rights reserved.
//

#import "JCMHypnosisView.h"

@interface JCMHypnosisView ()

@property (nonatomic, strong)UIColor *circleColor;

@end

@implementation JCMHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    }
    
    return self;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center = self.center;
    center.x -= self.frame.origin.x;
    
    NSLog(@"x %f, y %f, w %f, h %f, centerx %F",self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height, center.x);
    
    float radius = MAX(bounds.size.width, bounds.size.height)/2+80;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    for (float r=radius; r>0; r-=20) {
        [path moveToPoint:CGPointMake(center.x+r, center.y)];
        [path addArcWithCenter:center radius:r startAngle:0 endAngle:M_PI*2 clockwise:YES];
        path.lineWidth = 10;
        [self.circleColor setStroke];
        [path stroke];
    }
    
//    UIImage *logoImage = [UIImage imageNamed:@"JCM_logo.png"];
//    CGRect center = CGRectMake(self.center.x-54, self.center.y-22, 109, 45);
//    [logoImage drawInRect:center];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    float red = (arc4random() % 255)/255.0;
    float green = (arc4random() % 255)/255.0;
    float blue = (arc4random() % 255)/255.0;
    
    NSLog(@"%f %f %f", red, green, blue);
    
    UIColor * randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    self.circleColor = randomColor;
}

@end
