//
//  RKViewController.m
//  RKDropDownTextField
//
//  Created by Radhakrishna Pai on 08/06/2017.
//  Copyright (c) 2017 Radhakrishna Pai. All rights reserved.
//

#import "RKViewController.h"

@interface RKViewController ()

@end

@implementation RKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.dropDownTextField.delegate = self;
    self.dropDownTextField.values = [NSMutableArray arrayWithArray:@[@"Cat", @"Dog", @"Rat", @"Pig", @"Cow", @"Horse"]];
}

- (void)dropDownTextField:(RKDropDownTextField *)dropDownTextField didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
