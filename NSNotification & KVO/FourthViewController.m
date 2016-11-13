//
//  FourthViewController.m
//  NSNotification & KVO
//
//  Created by carmen cheng on 2016-11-12.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "FourthViewController.h"
#import "whiteView.h"

@interface FourthViewController ()
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panWhiteView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet whiteView *whiteView;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
}

- (IBAction)panInWhiteView:(UIPanGestureRecognizer*)sender {
    CGPoint currentPoint = [sender locationInView:self.whiteView];
    
    self.yellowView.center = currentPoint;
}


-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"point"]) {
        id value = change [NSKeyValueChangeNewKey];
        NSValue *valueCast = (NSValue *)value;
        CGPoint point = valueCast.CGPointValue;
        
        CGFloat yellowX = self.yellowView.center.x;
        CGFloat yellowY = self.yellowView.center.y;
        
        yellowX += point.x;
        yellowY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowX, yellowY);
        self.yellowView.center = newCenter;
    }
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self forKeyPath:@"point" context:nil];
}

@end
