//
//  main.m
//  BanksAndPatrons
//
//  Created by Felicia Weathers on 6/21/15.
//  Copyright (c) 2015 Felicia Weathers. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BankAccount : NSObject

@property (nonatomic) int balance;

@end

@interface Patron : NSObject

@property (nonatomic) int pocket;

- (void)withdrawal: (BankAccount*)account  :(int)amount;

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
            }
    return 0;
}
