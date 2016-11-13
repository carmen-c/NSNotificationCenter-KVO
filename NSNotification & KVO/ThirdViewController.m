//
//  ThirdViewController.m
//  NSNotification & KVO
//
//  Created by carmen cheng on 2016-11-12.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (nonatomic, readonly) CGFloat oldConstraint;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    _oldConstraint = self.bottomConstraint.constant;
}

-(void) keyboardDidChange:(NSNotification *)notification{
    NSValue *value = notification.userInfo [UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if (yPos == viewHeight) {
        self.bottomConstraint.constant = self.oldConstraint;
        
    }else {
        self.bottomConstraint.constant = viewHeight - yPos;
    
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)viewTapped:(id)sender {
    [self.textField resignFirstResponder];
}

@end
