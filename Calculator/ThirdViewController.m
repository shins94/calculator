//
//  ThirdViewController.m
//  Calculator
//
//  Created by MF839-006 on 2016. 6. 17..
//  Copyright © 2016년 MF839-006. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeColor:(id)sender {
    NSLog(@"ThirdView Change color");
    
    changeMainBackColor([UIColor blueColor]);
}



- (void) changeColorFunc:(void(^)(UIColor*))myFunc {
    changeMainBackColor = myFunc;
}


@end
