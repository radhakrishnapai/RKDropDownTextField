//
//  RKViewController.h
//  RKDropDownTextField
//
//  Created by Radhakrishna Pai on 08/06/2017.
//  Copyright (c) 2017 Radhakrishna Pai. All rights reserved.
//

@import UIKit;
#import "RKDropDownTextField.h"

@interface RKViewController : UIViewController <RKDropDownTextFieldDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet RKDropDownTextField *dropDownTextField;

@end
