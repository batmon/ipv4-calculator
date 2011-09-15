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
    NSArray *arrySubnet;
}
@property (nonatomic, retain) IBOutlet UITextField *ipField;
@property (nonatomic, retain) IBOutlet UITextField *maskField;
@property (nonatomic, retain) IBOutlet UILabel *wildcardLabel;

- (IBAction)backgroundTap:(id)sender;
- (IBAction)wildcardChanged:(id)sender;

@end
