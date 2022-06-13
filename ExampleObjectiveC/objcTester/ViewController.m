//
//  ViewController.m
//  objcTester
//
//  Created by Inmanage LTD on 12/08/2021.
//

#import "ViewController.h"
#import <MeshulamSDK/MeshulamSDK-Swift.h>

@interface ViewController () <MeshulamDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[Meshulam shared] meshulamStart];
}

- (IBAction)didTapBit:(id)sender {
    [Meshulam shared].isDebugMode = NO;
    [[Meshulam shared] createPaymentProcessWithPageCode:@"535dd4248592" apiKey:@"566ac39a90e8" userId:@"b9e895139851c3c5" fullName:@"omer cohen" phoneNumber:@"0525503403" sum:@"1"  email:@"oerm@gmail.com" description:@"bdika" saveCardToken:nil companyCommission:@"0.5" delegate:self];
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

- (void)didCloseMeshulamSDK {
    
}


@end
