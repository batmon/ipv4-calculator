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
    arryHost = [[NSArray alloc] initWithObjects:@"4294967294",@"2147483646",@"1073741822",@"536870910",@"268435454",@"134217726",@"67108862",@"33554430",@"16777214",@"8388606",@"4194302",@"2097150",@"1048574",@"524286",@"262142",@"131070",@"65534",@"32766",@"16382",@"8190",@"4094",@"2046",@"1022",@"510",@"254",@"126",@"62",@"30",@"14",@"6",@"2",@"2",@"1", nil];
    iprangeField.text = [NSString stringWithFormat:@"network = 192.168.1.0/24\nusable IP = 192.168.1.1 ~ 192.168.1.254\nbroadcast = 192.168.1.255"];
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
    [self wildcardChanged:nil];
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
    int i, ipStart, ipEnd;
    if (progressAsInt < 8) {
        networkField.text = [arryNetwork objectAtIndex:progressAsInt];
        int subnets = [networkField.text intValue];
        for (i = 0; i < 256; i = i + (256 / subnets)) {
            if (ip0 >= i) {
                ipStart = i;
                ipEnd = ipStart + (256 / subnets) - 1;
            }
        }            
        iprangeField.text = [NSString stringWithFormat:@"network = %d.0.0.0/%d\nusable IP = %d.0.0.1 ~ %d.255.255.254\nbroadcast = %d.255.255.255", ipStart, progressAsInt, ipStart, ipEnd, ipEnd];
    } else if (progressAsInt < 16) {
        networkField.text = [arryNetwork objectAtIndex:progressAsInt - 8];
        int subnets = [networkField.text intValue];
        for (i = 0; i < 256; i = i + (256 / subnets)) {
            if (ip1 >= i) {
                ipStart = i;
                ipEnd = ipStart + (256 / subnets) - 1;
            }
        }            
        iprangeField.text = [NSString stringWithFormat:@"network = %d.%d.0.0/%d\nusable IP = %d.%d.0.1 ~ %d.%d.255.254\nbroadcast = %d.%d.255.255", ip0, ipStart, progressAsInt, ip0, ipStart, ip0, ipEnd, ip0, ipEnd];
    } else if (progressAsInt < 24) {
        networkField.text = [arryNetwork objectAtIndex:progressAsInt - 16];
        int subnets = [networkField.text intValue];
        for (i = 0; i < 256; i = i + (256 / subnets)) {
            if (ip2 >= i) {
                ipStart = i;
                ipEnd = ipStart + (256 / subnets) - 1;
            }
        }            
        iprangeField.text = [NSString stringWithFormat:@"network = %d.%d.%d.0/%d\nusable IP = %d.%d.%d.1 ~ %d.%d.%d.254\nbroadcast = %d.%d.%d.255", ip0, ip1, ipStart, progressAsInt, ip0, ip1, ipStart, ip0, ip1, ipEnd, ip0, ip1, ipEnd];
    } else {
        networkField.text = [arryNetwork objectAtIndex:progressAsInt - 24];
        int subnets = [networkField.text intValue];
        for (i = 0; i < 256; i = i + (256 / subnets)) {
            if (ip3 >= i) {
                ipStart = i;
                ipEnd = ipStart + (256 / subnets) - 1;
                if (ipStart == 0) {
                    ipEnd -= 1;
                    if (progressAsInt < 31) {
                        iprangeField.text = [NSString stringWithFormat:@"network = %d.%d.%d.%d/%d\nusable IP = %d.%d.%d.%d ~ %d.%d.%d.%d\nbroadcast = %d.%d.%d.%d", ip0, ip1, ip2, ipStart, progressAsInt, ip0, ip1, ip2, ipStart + 1, ip0, ip1, ip2, ipEnd, ip0, ip1, ip2, ipEnd + 1];
                    } else {
                        ipEnd += 1;
                        iprangeField.text = [NSString stringWithFormat:@"network = %d.%d.%d.%d/%d\nusable IP = %d.%d.%d.%d ~ %d.%d.%d.%d\nbroadcast = n/a", ip0, ip1, ip2, ipStart, progressAsInt, ip0, ip1, ip2, ipStart, ip0, ip1, ip2, ipEnd];
                    }
                } else {
                    if (progressAsInt < 31) {
                        ipEnd = ipStart + [hostField.text intValue];
                        iprangeField.text = [NSString stringWithFormat:@"network = %d.%d.%d.%d/%d\nusable IP = %d.%d.%d.%d ~ %d.%d.%d.%d\nbroadcast = %d.%d.%d.%d", ip0, ip1, ip2, ipStart, progressAsInt, ip0, ip1, ip2, ipStart + 1, ip0, ip1, ip2, ipEnd, ip0, ip1, ip2, ipEnd + 1];
                    } else {
                        iprangeField.text = [NSString stringWithFormat:@"network = %d.%d.%d.%d/%d\nusable IP = %d.%d.%d.%d ~ %d.%d.%d.%d\nbroadcast = n/a", ip0, ip1, ip2, ipStart, progressAsInt, ip0, ip1, ip2, ipStart, ip0, ip1, ip2, ipEnd];
                    }
                }
            }
        }
    }
    [newText release];
}
@end
