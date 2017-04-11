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
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIButton *playBTN;
@property (weak, nonatomic) IBOutlet UIButton *starBTN;
@property (weak, nonatomic) IBOutlet UILabel *countLBL;

@end

@implementation ViewController

int maxTaps = 0;
int currentTaps = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _inputTF.delegate = self;
    [_starBTN setHidden:YES];
    [_countLBL setHidden:YES];
}
- (IBAction)playBTN:(id)sender {
    
    if (![_inputTF.text isEqual: @""] && ![_inputTF.text isEqual:nil]) {
        [_inputTF setHidden:YES];
        [_logo setHidden:YES];
        [_playBTN setHidden:YES];
        [_starBTN setHidden:NO];
        [_countLBL setHidden:NO];
        
        maxTaps = [_inputTF.text intValue];
        currentTaps = 0;
        [self updateTapsLBL];
    }
    
}

-(void) updateTapsLBL {
    NSString *counterLBLString = [NSString stringWithFormat:@"%d Taps", currentTaps];
    _countLBL.text = counterLBLString;
}
- (IBAction)starBTNPressed:(id)sender {
    
    currentTaps ++;
    [self updateTapsLBL];
    
    if ([self isGameOver]) {
        
        [self restartGame];
    }
    
}

-(BOOL) isGameOver {
    if (currentTaps >= maxTaps) {
        return true;
    }else {
        return false;
    }
}

-(void) restartGame {
    maxTaps = 0;
    _countLBL.text = @"";
    [_countLBL setHidden:YES];
    [_logo setHidden:NO];
    [_playBTN setHidden:NO];
    [_inputTF setHidden:NO];
    [_starBTN setHidden:YES];
    _inputTF.text = @"";
    
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
