//
//  ViewController.m
//  StarField
//
//  Created by Ngô Sỹ Trường on 4/25/16.
//  Copyright © 2016 ngotruong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *red,*violet,*brown,*green;
    CGFloat deltaX;
    CGFloat deltaY;
    CGPoint center;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawStar];
    [self animate];
    
}
-(void) drawStar {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    center = CGPointMake(mainViewSize.width * 0.5,(mainViewSize.height + statusNavigationBarHeight) * 0.5 );
    brown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown.png"]];
    brown.center = center;
    [self.view addSubview:brown];
    
    green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    green.center = center;
    [self.view addSubview:green];
    
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet.png"]];
    violet.center = center;
    [self.view addSubview:violet];
    
    red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    red.center = center;
    [self.view addSubview:red];
    
    
    
}
-(void) animate {
    deltaX = 100;
    deltaY = 100;
    [UIView animateWithDuration:5 animations:^{
        brown.center = CGPointMake(center.x - 100, center.y -100);
        red.center = CGPointMake(center.x + deltaX, center.y + deltaY);
        green.center = CGPointMake(center.x + deltaX, center.y - deltaY);
        violet.center = CGPointMake(center.x - deltaX, center.y + deltaY);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:5 animations:^{
            brown.center = CGPointMake(center.x - deltaX, center.y);
            red.center = CGPointMake(center.x + deltaX, center.y);
            green.center = CGPointMake(center.x, center.y - deltaY);
            violet.center = CGPointMake(center.x, center.y + deltaY);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:5 animations:^{
                brown.center = center;
                red.center = center;
                green.center = center;
                violet.center = center;
            } completion:^(BOOL finished) {
                [self animate];
            }];
        }];
    }];
}
@end
