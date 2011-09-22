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
@synthesize networkField;
@synthesize hostField;
@synthesize iprangeField;
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
    arrySubnet = [[NSArray alloc] initWithObjects:@"0.0.0.0",@"128.0.0.0",@"192.0.0.0",@"224.0.0.0",@"240.0.0.0",@"248.0.0.0",@"252.0.0.0",@"254.0.0.0",@"255.0.0.0",@"255.128.0.0",@"255.192.0.0",@"255.224.0.0",@"255.240.0.0",@"255.248.0.0",@"255.252.0.0",@"255.254.0.0",@"255.255.0.0",@"255.255.128.0",@"255.255.192.0",@"255.255.224.0",@"255.255.240.0",@"255.255.248.0",@"255.255.252.0",@"255.255.254.0",@"255.255.255.0",@"255.255.255.128",@"255.255.255.192",@"255.255.255.224",@"255.255.255.240",@"255.255.255.248",@"255.255.255.252",@"255.255.255.254",@"255.255.255.255",nil];
    arryNetwork = [[NSArray alloc] initWithObjects:@"1",@"2",@"4",@"8",@"16",@"32",@"64",@"128",@"256",@"512",@"1024",@"2048",@"4096",@"8192",@"16384",@"32768",@"65536",@"131072",@"262144",@"524288",@"1048576",@"2097152",@"4194304",@"8388608",@"16777216",@"33554432",@"67108864",@"134217728",@"268435456",@"536870912",@"1073741824",@"2147483648",@"4294967296", nil]; 
    arryHost = [[NSArray alloc] initWithObjects:@"4294967296",@"2147483648",@"1073741824",@"536870912",@"268435456",@"134217728",@"67108864",@"33554432",@"16777216",@"8388608",@"4194304",@"2097152",@"1048576",@"524288",@"262144",@"131072",@"65536",@"32768",@"16384",@"8192",@"4096",@"2048",@"1024",@"512",@"256",@"128",@"64",@"32",@"16",@"8",@"4",@"2",@"1", nil];
    ipField.keyboardType = UIKeyboardTypeDecimalPad;
    maskField.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void)viewDidUnload
{
    [self setIpField:nil];
    [self setMaskField:nil];
    [self setWildcardLabel:nil];
    [self setNetworkField:nil];
    [self setHostField:nil];
    [self setIprangeField:nil];
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
    [networkField release];
    [hostField release];
    [iprangeField release];
    [super dealloc];
}

- (IBAction)backgroundTap:(id)sender {
    [ipField resignFirstResponder];
    NSArray *arryIP = [ipField.text componentsSeparatedByString: @"."];
    if ([arryIP count] != 4) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"IP addree has to be in num.num.num.num format\n (num = between 0 to 255)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
		[alert release];
    } else {
        int ip0 = [[arryIP objectAtIndex:0] intValue];
        int ip1 = [[arryIP objectAtIndex:1] intValue];
        int ip2 = [[arryIP objectAtIndex:2] intValue];
        int ip3 = [[arryIP objectAtIndex:3] intValue];
        if (ip0 < 0 || ip0 > 255 || ip1 < 0 || ip1 > 255 || ip2 < 0 || ip2 > 255 || ip3 < 0 || ip3 > 255) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"IP addree has to be in num.num.num.num format\n (num = between 0 to 255)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            [alert release];
        }
    }    
}

- (IBAction)wildcardChanged:(id)sender {
    NSArray *arryIP = [ipField.text componentsSeparatedByString: @"."];
    int ip0 = [[arryIP objectAtIndex:0] intValue];
    int ip1 = [[arryIP objectAtIndex:1] intValue];
    int ip2 = [[arryIP objectAtIndex:2] intValue];
    int ip3 = [[arryIP objectAtIndex:3] intValue];
    if ([arryIP count] != 4) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"IP addree has to be in num.num.num.num format\n (num = between 0 to 255)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
		[alert release];
    } else {
        if (ip0 < 0 || ip0 > 255 || ip1 < 0 || ip1 > 255 || ip2 < 0 || ip2 > 255 || ip3 < 0 || ip3 > 255) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"IP addree has to be in num.num.num.num format\n (num = between 0 to 255)" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            [alert release];
        }
    }
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
    wildcardLabel.text = newText;
    maskField.text = [arrySubnet objectAtIndex:progressAsInt];
    hostField.text = [arryHost objectAtIndex:progressAsInt];
    int i, ipstart0 = 0, ipend0;
    if (progressAsInt < 8) {
        networkField.text = [arryNetwork objectAtIndex:progressAsInt];
        int subnets = [[arryNetwork objectAtIndex:progressAsInt] intValue];
        for (i = 0; i < subnets; i++) {
            if (ip0 < (256 / subnets)) {
                if (i == 0) {
                    ipstart0 = 0;
                    ipend0 = 255;
                } else {
                    ipstart0 = [[arryNetwork objectAtIndex:progressAsInt] intValue];
                    ipend0 = ipstart0 + (256 / [[arryNetwork objectAtIndex:progressAsInt] intValue]);
                }
            }
        }            
        iprangeField.text = [NSString stringWithFormat:@"%d.0.0.0 ~ %d.255.255.255", ipstart0, ipend0];
    } else if (progressAsInt < 16) {
        networkField.text = [arryNetwork objectAtIndex:progressAsInt - 8];
    } else if (progressAsInt < 24) {
        networkField.text = [arryNetwork objectAtIndex:progressAsInt - 16];
    } else {
        networkField.text = [arryNetwork objectAtIndex:progressAsInt - 24];
    }
    [newText release];
}
@end
