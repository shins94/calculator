//
//  ViewController.h
//  Calculator
//
//  Created by MF839-006 on 2016. 6. 15..
//  Copyright © 2016년 MF839-006. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myButtons;

-(void) setButtonEnabled: (BOOL) val;


-(void) processDigit:(int) digit;
-(void) processOp:(char) theOp;
-(void) storeFracPart;

- (IBAction)clickDigit:(id)sender;

- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;






@end

