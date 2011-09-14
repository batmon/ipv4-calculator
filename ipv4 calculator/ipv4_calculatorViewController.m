//
//  ipv4_calculatorViewController.m
//  ipv4 calculator
//
//  Created by Mon Yang on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ipv4_calculatorViewController.h"

@implementation ipv4_calculatorViewController
@synthesize maskField;
@synthesize wildcardLabel;
@synthesize ipField;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    arrySubnet ==[[NSArray alloc] initWithObjects:@"0.0.0.0",@"255.0.0.0",@"255.128.0.0",@"255.192.0.0",@"255.224.0.0",@"255.240.0.0",@"255.248.0.0",@"255.252.0.0",@"255.254.0.0",@"255.255.0.0",@"255.255.128.0",@"255.255.128.0",@"255.255.192.0",@"255.255.224.0",@"255.255.240.0",@"255.255.248.0",@"255.255.252.0",@"255.255.254.0",@"255.255.255.0",@"255.255.255.128",@"255.255.255.192",@"255.255.255.224",@"255.255.255.240",@"255.255.255.248",@"255.255.255.252",@"255.255.255.254",@"255.255.255.255",nil];
}

- (void)viewDidUnload
{
    [self setIpField:nil];
    [self setMaskField:nil];
    [self setWildcardLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [ipField release];
    [maskField release];
    [wildcardLabel release];
    [super dealloc];
}
- (IBAction)wildcardChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
    wildcardLabel.text = newText;
    if ([newText compare:@"16"] == NSOrderedSame) {
        maskField.text = @"255.255.0.0";
    } else {
        maskField.text = @"hello";
    }
    [newText release];
}
@end
