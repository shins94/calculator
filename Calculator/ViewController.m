//
//  ViewController.m
//  Calculator
//
//  Created by MF839-006 on 2016. 6. 15..
//  Copyright © 2016년 MF839-006. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumberator;
    Calculator *myCalculator;
    NSMutableString *displayString;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _display.text = @"";
    firstOperand = YES;
    isNumberator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"Segue id = %@",segue.identifier);
    
    if([segue.identifier isEqualToString:@"blueview"]) {
    
        InfoViewController *infoview = [segue destinationViewController];
    
        infoview.myString = @"Hello World";
    }
    
}


- (IBAction)openNewView:(id)sender {
//    [self performSegueWithIdentifier:@"purppleview"
    [self performSegueWithIdentifier:@"blueview"
                              sender:self];
    
    
    
}

- (IBAction)openInfoView:(id)sender {
    
    InfoViewController * infoViewController = [self.storyboard
                                               instantiateViewControllerWithIdentifier: @"infoview"];
 
    
    infoViewController.delegate = self;
    
    infoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [infoViewController setMyString:self.display.text];

    
    [self presentViewController: infoViewController
                    animated:YES
                    completion: nil];
    
}


- (IBAction)unwindToViewController:(UIStoryboardSegue*)sender{
   
    NSLog(@"unwindToViewController");
    
}

-(void) setButtonEnabled: (BOOL) val{
    
    
    for(int i = 0; i < _myButtons.count;i++){
       UIButton* btn =  [_myButtons objectAtIndex:i];
        btn.enabled = val;
    }
    
}

-(void) processDigit:(int) digit {
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:
        [NSString stringWithFormat:@"%i",digit]];
   
    _display.text = displayString;

}


- (IBAction)clickDigit:(id)sender {
    int digit = (int)((UIButton*)sender).tag;
    NSLog(@"digit is %i",digit);
    [self processDigit:digit];
}



-(void) processOp:(char) theOp {
    NSString *opStr;
    
    op = theOp;
   
    switch(theOp) {
        case '+':
            opStr = @" + ";
            
            break;
        case '-':
            opStr = @" - ";

            break;
        case '*':
            opStr = @" * ";

            break;
        case '/':
            opStr = @" / ";

            break;
            
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumberator = YES;

    [self setButtonEnabled: NO];
    
    [displayString appendString:opStr];
    _display.text = displayString;

}



-(void) storeFracPart {
    
    if(firstOperand) {
        
        if(isNumberator) {
            myCalculator.operland1.numerator = currentNumber;
            myCalculator.operland1.denominator = 1;
        }
        else
            myCalculator.operland1.denominator = currentNumber;
    }
    else if (isNumberator){
        myCalculator.operland2.numerator = currentNumber;
        myCalculator.operland2.denominator = 1;
        
    }
    else {
        myCalculator.operland2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

- (IBAction)clickOver:(id)sender {
    
    [self storeFracPart];
    isNumberator = NO;
    [displayString appendString:@"/"];
    _display.text = displayString;
    
}


- (IBAction)clickPlus:(id)sender {
    [self processOp:'+'];

}

- (IBAction)clickMinus:(id)sender {
    [self processOp:'-'];

}


- (IBAction)clickMultiply:(id)sender {
    [self processOp:'*'];

}

- (IBAction)clickDivide:(id)sender {
    [self processOp:'/'];

}


- (IBAction)clickEquals:(id)sender {

    if(firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        isNumberator = YES;
        firstOperand = YES;
        [displayString setString:@""];
        
        [self setButtonEnabled:YES];

    }
}


- (IBAction)clickClear:(id)sender {
    
    isNumberator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];

    [displayString setString:@""];
    _display.text = displayString;
    
}

- (void) ChangeColor:(UIColor *)newColor {

    NSLog(@"Change Color");
    
    [self.view setBackgroundColor:newColor];
    
    
    
}

@end
