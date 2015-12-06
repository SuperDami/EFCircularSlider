//
//  EFBasicViewController.m
//  EFCircularSlider
//
//  Created by Eliot Fowler on 12/4/13.
//  Copyright (c) 2013 Eliot Fowler. All rights reserved.
//

#import "EFBasicViewController.h"
#import "EFCircularSlider.h"

@interface EFBasicViewController ()

@end

@implementation EFBasicViewController {
    EFCircularSlider *circularSlider;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect sliderFrame = CGRectMake(60, 150, 200, 200);
    circularSlider = [[EFCircularSlider alloc] initWithFrame:sliderFrame];
    [circularSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:circularSlider];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(150, 150, 100, 100);
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button];
    
    UIView *handle = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 10.0, 10.0)];
    handle.backgroundColor = [UIColor grayColor];
    handle.layer.cornerRadius = 5.0;
    circularSlider.handleView = handle;
    handle.userInteractionEnabled = NO;
    circularSlider.minimumValue = 25;
    circularSlider.maximumValue = 35;
    circularSlider.minDegree = 90;
    circularSlider.maxDegree = 270;
    [circularSlider setCurrentValue:32.0f];
}

-(void)test {
    [circularSlider setCurrentValueAnimated:25 + arc4random() % 10];
}

-(void)valueChanged:(EFCircularSlider*)slider {
    NSLog(@"is touched: %d", slider.isTouchAction);
    NSLog(@"handle pos: %@", NSStringFromCGPoint(slider.handleView.center));
    _valueLabel.text = [NSString stringWithFormat:@"%.02f", slider.currentValue ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
