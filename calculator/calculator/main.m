//
//  main.m
//  calculator
//
//  Created by Varindra Hart on 6/21/15.
//  Copyright (c) 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator: NSObject
@property float accumulator;

- (float)add:(float)numb;
- (float)subtract:(float)numb;
- (float)multiply:(float)numb;
- (float)divide:(float)numb;
- (float)power:(int)numb;
- (void)recipDisplay;
- (float)reciprocal;
@end

@implementation Calculator
-(float)add:(float)numb {
    return (self.accumulator+=numb);
}

-(float)subtract:(float)numb {
    return (self.accumulator-=numb);
}

-(float)multiply:(float)numb {
    return (self.accumulator*=numb);
}

-(float)divide:(float)numb {
    return (self.accumulator/=numb);
}



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Calculator *myCalc = [[Calculator alloc] init];
        [myCalc add:5];
        [myCalc subtract: 10];
    }
    return 0;
}
