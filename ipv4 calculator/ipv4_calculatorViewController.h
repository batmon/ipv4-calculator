//
//  ipv4_calculatorViewController.h
//  ipv4 calculator
//
//  Created by Mon Yang on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ipv4_calculatorViewController : UIViewController {
    UITextField *ipField;
    UITextField *maskField;
    UILabel *wildcardLabel;
    UITextField *networkField;
    UITextField *hostField;
    NSArray *arrySubnet;
    NSArray *arryNetwork;
    NSArray *arryHost;
    NSArray *arryIP;
}
@property (nonatomic, retain) IBOutlet UITextField *ipField;
@property (nonatomic, retain) IBOutlet UITextField *maskField;
@property (nonatomic, retain) IBOutlet UILabel *wildcardLabel;
@property (nonatomic, retain) IBOutlet UITextField *networkField;
@property (nonatomic, retain) IBOutlet UITextField *hostField;

- (IBAction)backgroundTap:(id)sender;
- (IBAction)wildcardChanged:(id)sender;

@end
