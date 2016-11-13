//
//  SecondViewController.m
//  NSNotification & KVO
//
//  Created by carmen cheng on 2016-11-12.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SecondViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _countLabel = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressed:) name:@"stepperPressed" object:nil];
}

-(void)pressed:(NSNotification *)notification{
    NSDictionary *dictionary = [notification userInfo];
    NSString *grabbed = [NSString stringWithFormat:@"%@",[dictionary objectForKey:@"foo"]];
    self.countLabel.text = grabbed;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
