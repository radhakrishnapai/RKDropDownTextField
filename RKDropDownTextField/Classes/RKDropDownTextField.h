//
//  RKDropDownTextField.h
//
//  Created by Radhakrishna Pai on 06/08/17.
//  Copyright © 2017 Radhakrishna Pai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^completionBlock)();

@class RKDropDownTextField;

@protocol RKDropDownTextFieldDelegate<NSObject>

@required
- (void)dropDownTextField:(RKDropDownTextField *)dropDownTextField didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

IB_DESIGNABLE

@interface RKDropDownTextField : UIView<UITableViewDataSource, UITableViewDelegate>

// Set to YES if the list must show an option to clear the field. Default is NO.
@property (assign, nonatomic) IBInspectable BOOL canBeEmpty;

// The array which contains the values to be shown in the dropdown list. Default is nil.
@property (strong, nonatomic) IBInspectable NSMutableArray *values;

// The text to be shown in the DropDownField. Default is empty string.
@property (strong, nonatomic) IBInspectable NSString *text;

// The UITextField used in the DropDownField.
@property (weak, nonatomic) IBOutlet UITextField *textField;

// Height of the rows in the dropdown list. Default is the dropdown view height.
@property (assign, nonatomic) IBInspectable CGFloat height;

// The placeholder text to be shown if the dropdown field is empty. Default is empty string.
@property (strong, nonatomic) IBInspectable NSString *placeholder;

// The max numberOfRows that must be shown in the list. In effect decides the height of the dropdown list view. List will scroll if more rows are present. Default value is 5.
@property (assign, nonatomic) IBInspectable NSUInteger maxNumberOfRows;

// The delegate for the dropdown field. This must be set for RKDropDownTextField to work.
@property (strong, nonatomic) id <RKDropDownTextFieldDelegate, UITextFieldDelegate> delegate;

// To set footer view for the drop down list, such as a logo. Default is nil.
@property (strong, nonatomic) UIView *tableFooterView;

// Toggle the hidden state of the dropdown list view.
- (void)toggleListView;

// Show the dropdown list view.
- (void)showListView;

// Hide the dropdown list view.
- (void)hideListView;

@end
