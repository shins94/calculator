//
//  Calculator.m
//  ObjC
//
//  Created by MF839-006 on 2016. 6. 14..
//  Copyright © 2016년 MF839-006. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(id) init {
    self = [super init];
    
    if(self) {
        _operland1 = [[Fraction alloc] init];
        _operland2 = [[Fraction alloc] init];
        _accumulator = [[Fraction alloc] init];
        
    }
    
    return self;
}

-(void) clear {
    _accumulator.numerator = 0;
    _accumulator.denominator = 0;
    
}

-(Fraction*) performOperation:(char)op {
    
    Fraction *result;
    
    switch(op) {
        case '+':
            result = [_operland1 add: _operland2];
            break;
        case '-':
            result = [_operland1 sub: _operland2];
            break;
        case '*':
            result = [_operland1 mul: _operland2];
            break;
        case '/':
            result = [_operland1 div: _operland2];
            break;
    }

    _accumulator.numerator = result.numerator;
    _accumulator.denominator = result.denominator;
    
    return _accumulator;
}

@end
