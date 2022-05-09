//
//  ViewController.m
//  objcTester
//
//  Created by Inmanage LTD on 12/08/2021.
//

#import "ViewController.h"

@interface ViewController () <MeshulamDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[Meshulam shared] createPaymentProcessWithPageCode:@"e439ab93f4b2" apiKey:@"" userId:@"24002fc104f101c0fef" fullName:@"Amit Azulay" phoneNumber:@"0542533691" sum:@"1" email:@"amita@inmanage.net" description:@"" delegate:self];
}

- (void)createPaymentProccesSuccess:(NSString * _Nonnull)processId :(NSString * _Nonnull)processToken {
    
}

- (void)getPaymentProcessInfoSuccessWithResponse:(NSString * _Nonnull)response {
    
}

- (void)onCancel {
    
}

- (void)onFailure:(NSString * _Nonnull)error {
    
}

- (void)setBitPaymentSuccess:(NSString * _Nonnull)transactionId {
    
}

- (void)settleSuspendedTransactionSuccessWithResponse:(NSString * _Nonnull)response {
    
}

@end
