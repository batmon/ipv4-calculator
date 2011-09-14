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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
    [newText release];
}
@end
