//
//  RKDropDownTextField.m
//
//  Created by Radhakrishna Pai on 06/08/17.
//  Copyright © 2017 Radhakrishna Pai. All rights reserved.
//

#import "RKDropDownTextField.h"

#define MAX_NO_OF_ROWS 5

@interface RKDropDownTextField ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *overlayView;
@property (strong, nonatomic) IBOutlet UIView *tableContainerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RKDropDownTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textField.delegate = self;
    if (self.maxNumberOfRows == 0) {
        self.maxNumberOfRows = MAX_NO_OF_ROWS;
    }
    if (self.height == 0) {
        self.height = self.textField.frame.size.height;
    }
    self.tableContainerView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.tableContainerView.layer.borderWidth = 0.5;
    self.tableContainerView.layer.shadowOffset = CGSizeMake(0, 0);
    self.tableContainerView.layer.shadowRadius = 5;
    self.tableContainerView.layer.shadowOpacity = 0.5;
    self.tableContainerView.layer.masksToBounds = NO;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setUpView];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self setUpView];
    return self;
}

- (void)setUpView {
    UIView *view = [self viewFromNibForClass];
    view.frame = self.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self addSubview:view];
}

- (UIView *)viewFromNibForClass {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:@"RKDropDownTextField" bundle:bundle];
    UIView *view = (UIView *)[nib instantiateWithOwner:self options:nil].firstObject;
    return view;
}

- (IBAction)overlayTapped:(id)sender {
    [self dismissTableView];
}

- (void)didSelectDropDownAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedValue = [self.values objectAtIndex:indexPath.row];
    self.textField.text = selectedValue;
    [self.delegate dropDownTextField:self didSelectRowAtIndexPath:indexPath];
}

#pragma mark Getter/Setter Methods

- (void)setText:(NSString *)text {
    self.textField.text = text;
}

- (NSString *)text {
    return self.textField.text;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.textField.placeholder = placeholder;
}

- (void)setHeight:(CGFloat)height {
    _height = height;
    self.tableView.rowHeight = height;
}

- (void)setValues:(NSMutableArray *)values {
    _values = [NSMutableArray arrayWithArray:values];
    if (_canBeEmpty) {
        [_values insertObject:@"---" atIndex:0];
    }
    [self.tableView reloadData];
}

- (void)setTag:(NSInteger)tag {
    self.textField.tag = tag;
}

- (void)setTableFooterView:(UIView *)tableFooterView {
    _tableFooterView = tableFooterView;
    [self.tableView setTableFooterView:tableFooterView];
    self.tableView.tableFooterView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    [self.tableView reloadData];
}

#pragma mark Tapped On DropDownField

- (void)toggleListView {
    if (self.tableContainerView.hidden == YES) {
        self.tableContainerView.hidden = NO;
        
        CGRect newFrame = [self convertRect:self.bounds toView:nil];
        CGFloat height = MIN(self.height * self.maxNumberOfRows, self.values.count * self.height) + _tableFooterView.frame.size.height;
        CGFloat y = newFrame.origin.y > ([UIScreen mainScreen].bounds.size.height/2) ? newFrame.origin.y - height: newFrame.origin.y + newFrame.size.height;
        
        self.tableContainerView.frame = CGRectMake(newFrame.origin.x, y, newFrame.size.width, height);
        self.overlayView.frame = [UIScreen mainScreen].bounds;
        [self.window addSubview:self.overlayView];
        [self.window addSubview:self.tableContainerView];
    } else {
        [self dismissTableView];
    }
}

- (void)showListView {
    if (self.tableContainerView.hidden == YES) {
        self.tableContainerView.hidden = NO;
        
        CGRect newFrame = [self convertRect:self.bounds toView:nil];
        CGFloat height = MIN(self.height * self.maxNumberOfRows, self.values.count * self.height) + _tableFooterView.frame.size.height;
        CGFloat y = newFrame.origin.y > ([UIScreen mainScreen].bounds.size.height/2) ? newFrame.origin.y - height: newFrame.origin.y + newFrame.size.height;
        
        self.tableContainerView.frame = CGRectMake(newFrame.origin.x, y, newFrame.size.width, height);
        self.overlayView.frame = [UIScreen mainScreen].bounds;
        [self.window addSubview:self.overlayView];
        [self.window addSubview:self.tableContainerView];
    } else {
        CGRect newFrame = [self convertRect:self.bounds toView:nil];
        CGFloat height = MIN(self.height * self.maxNumberOfRows, self.values.count * self.height) + _tableFooterView.frame.size.height;
        CGFloat y = newFrame.origin.y > ([UIScreen mainScreen].bounds.size.height/2) ? newFrame.origin.y - height: newFrame.origin.y + newFrame.size.height;
        
        self.tableContainerView.frame = CGRectMake(newFrame.origin.x, y, newFrame.size.width, height);
    }
}

- (void)hideListView {
    [self dismissTableView];
}

#pragma mark Dismiss View

- (void)dismissTableView {
    [self.overlayView removeFromSuperview];
    self.tableContainerView.hidden = YES;
    [self.tableContainerView removeFromSuperview];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.values.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RKDropDownTextField"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RKDropDownTextField"];
    }
    
    cell.textLabel.text = [self.values objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"ArialMT" size:10.0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissTableView];
    if (_canBeEmpty) {
        if (indexPath.row == 0) {
            self.textField.text = @"";
        } else {
            [self didSelectDropDownAtIndexPath:indexPath];
        }
    } else {
        [self didSelectDropDownAtIndexPath:indexPath];
    }
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField  {
    if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [self.delegate textFieldShouldReturn:textField];
    } else {
        return NO;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    } else {
        return NO;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.delegate textFieldShouldBeginEditing:textField];
    } else {
        [self showListView];
        return NO;
    }
}

- (BOOL)becomeFirstResponder {
    return [self.textField becomeFirstResponder];
}

@end
