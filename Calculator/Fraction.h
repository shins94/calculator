//
//  Fraction.h
//  ObjC
//
//  Created by MF839-006 on 2016. 6. 13..
//  Copyright © 2016년 MF839-006. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Fraction :NSObject

@property int numerator;
@property int denominator;

- (void) print;
- (double) convertToNum;
- (NSString*) convertToString ;


- (void) setTo:(int) n over: (int)d;
//- (Fraction *) add:(Fraction *) f;
- (void) reduce;
-(Fraction*) add :(Fraction*) f;
-(Fraction*) mul :(Fraction*) f;
-(Fraction*) sub :(Fraction*) f;
-(Fraction*) div :(Fraction*) f;
@end

