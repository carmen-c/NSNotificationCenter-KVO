//
//  FirstViewController.m
//  NSNotification & KVO
//
//  Created by carmen cheng on 2016-11-12.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (nonatomic) NSNumber *stepperValue;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)stepper:(id)sender {
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble: self.stepper.value], @"foo", nil];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [[NSNotification alloc]initWithName:@"stepperPressed" object:sender userInfo:dictionary];
    [notificationCenter postNotification:notification];
                                
}

@end
