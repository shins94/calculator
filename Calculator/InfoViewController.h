//
//  InfoViewController.h
//  Calculator
//
//  Created by MF839-006 on 2016. 6. 16..
//  Copyright © 2016년 MF839-006. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol InfoViewProtocol <NSObject>

- (void) ChangeColor: (UIColor*) newColor;

@end


@interface InfoViewController : UIViewController

@property (nonatomic, weak) NSString *myString;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (nonatomic,strong) id <InfoViewProtocol> delegate;

- (IBAction)close:(id)sender;

- (IBAction)changeColor:(id)sender;

@end
