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
- (void) printBalance;
@end

@implementation BankAccount

- (void) printBalance {
    NSLog(@"Balance has: $%d \n", self.balance);
}

@end

@interface Patron : NSObject

@property (nonatomic) int pocket;

- (void)withdraw: (BankAccount*)account :(int)amount;
- (void)deposit: (BankAccount *)account :(int)amount;
- (void)printPocket;
@end

@implementation Patron

- (void)withdraw: (BankAccount*)account :(int)amount{
    if( amount <= account.balance){
        self.pocket += amount;
        account.balance -= amount;
    }
    else{
        NSLog(@"Not enough funds, no withdrawal\n");
    }
}

- (void)deposit: (BankAccount *)account :(int)amount{
    
    if(amount<=self.pocket){
       account.balance += amount;
       self.pocket -= amount;
    }
    
    else{
        NSLog(@"Cannot deposit more than: %d\n", self.pocket);
    }
}

- (void) printPocket {
    NSLog(@"You have: $%d in your pocket", self.pocket);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    
    
        BankAccount *acct1 =[[BankAccount alloc] init];
        acct1.balance = 1000;
        
        Patron  *a = [[Patron alloc] init];
        Patron  *b = [[Patron alloc] init];
        Patron  *c = [[Patron alloc] init];
    
        a.pocket = 200;
        b.pocket = 150;
        c.pocket = 500;
    
        [a deposit:acct1 :250];
        [c printPocket];
        [acct1 printBalance];
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
    return 0;
}
