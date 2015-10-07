//
//  JCMHypnosisView.m
//  Hypnosister
//
//  Created by Xiaoming Chen on 15/10/7.
//  Copyright © 2015年 Jackchenxm. All rights reserved.
//

#import "JCMHypnosisView.h"

@implementation JCMHypnosisView

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    float radius = MAX(bounds.size.width, bounds.size.height)/2+80;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    for (float r=radius; r>0; r-=20) {
        [path moveToPoint:CGPointMake(self.center.x+r, self.center.y)];
        [path addArcWithCenter:self.center radius:r startAngle:0 endAngle:M_PI*2 clockwise:YES];
        path.lineWidth = 10;
        [[UIColor colorWithRed:1 green:1 blue:0 alpha:1] setStroke];
        [path stroke];
    }
    
    UIImage *logoImage = [UIImage imageNamed:@"JCM_logo.png"];
    CGRect center = CGRectMake(self.center.x-54, self.center.y-22, 109, 45);
    [logoImage drawInRect:center];
}

@end
