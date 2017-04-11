//
//  ViewController.m
//  Tapper Xtreme
//
//  Created by Nadeem Ansari on 4/11/17.
//  Copyright © 2017 Nadeem Ansari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputTF;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _inputTF.delegate = self;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

@end
