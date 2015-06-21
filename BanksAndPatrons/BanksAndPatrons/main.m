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
@property (nonatomic) int acctNumber;
- (void) printBalance;
@end

@implementation BankAccount

- (void) printBalance {
    NSLog(@"Balance has: $%d \n", self.balance);
}

@end

@interface Patron : NSObject

@property (nonatomic) int pocket;
@property (nonatomic) NSMutableArray * bankAccounts;

- (void)withdraw: (BankAccount*)account :(int)amount;
- (void)deposit: (BankAccount *)account :(int)amount;
- (void)printPocket;
- (NSMutableArray *) myArray;

@end

@implementation Patron

-(NSMutableArray*) bankAccounts{
    if(!_bankAccounts){
        _bankAccounts= [[NSMutableArray alloc] init];
        
    }
    
    return _bankAccounts;
}


- (void)withdraw: (BankAccount*)account :(int)amount{
    int checker = 0;
    for (BankAccount *i in self.bankAccounts){
        if( i.acctNumber == account.acctNumber){
            checker=1;
        }
    }
    
    if(checker==1){
        if( amount <= account.balance){
            self.pocket += amount;
            account.balance -= amount;
        }
        else{
            NSLog(@"Not enough funds, no withdrawal\n");
        }
    }
    
    if(checker==0){
        NSLog(@"That is not your account. Access denied\n");
    }
}

- (void)deposit: (BankAccount *)account :(int)amount{
    int checker = 0;
    for (BankAccount *i in self.bankAccounts){
        if( i.acctNumber == account.acctNumber){
            checker=1;
        }
    }
    
    if(checker==1){
        if( amount < self.pocket){
            self.pocket -= amount;
            account.balance += amount;
        }
        else{
            NSLog(@"Not enough funds, no withdrawal\n");
        }
    }
    
    if(checker==0){
        NSLog(@"That is not your account. Access denied\n");
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
        acct1.acctNumber = 111;
        
        BankAccount *acct2 =[[BankAccount alloc] init];
        acct2.balance = 800;
        acct2.acctNumber = 222;
        
        BankAccount *acct3 =[[BankAccount alloc] init];
        acct3.balance = 100;
        acct3.acctNumber = 333;
        
        BankAccount *acct4 =[[BankAccount alloc] init];
        acct4.balance = 500;
        acct4.acctNumber = 444;
        
        BankAccount *acct5 =[[BankAccount alloc] init];
        acct5.balance = 10000;
        acct5.acctNumber = 555;
        
        Patron  *a = [[Patron alloc] init];
        Patron  *b = [[Patron alloc] init];
        Patron  *c = [[Patron alloc] init];
    
        a.pocket = 200;
        b.pocket = 150;
        c.pocket = 500;
        
        [a.bankAccounts addObject:acct1];
        
        [b.bankAccounts addObject:acct4];
        [b.bankAccounts addObject:acct2];
        [b.bankAccounts addObject:acct3];
        
        [c.bankAccounts addObject:acct1];
        [c.bankAccounts addObject:acct4];
        [c.bankAccounts addObject:acct5];
        
        
        NSLog(@"Person a: \n");
        [a deposit:acct1 :250];
        [a withdraw:acct4 :50];
        [a printPocket];
        [acct1 printBalance];
        [acct4 printBalance];
        
        NSLog(@"Person b: \n");
        [b deposit:acct4 :5];
        [b printPocket];
        [acct4 printBalance];
        
    
        [c withdraw:acct4 :5];
        [c printPocket];
        [acct1 printBalance];
    
    
    
    
        for (int i = 0; i < a.bankAccounts.count; i++) {
            NSLog(@"%@", [a.bankAccounts objectAtIndex:i]);
        }
        
        for (BankAccount *account in a.bankAccounts) {
            NSLog(@"%@", account);
        }
    
    
    
    
    
    
    
    
    }
    return 0;
}
