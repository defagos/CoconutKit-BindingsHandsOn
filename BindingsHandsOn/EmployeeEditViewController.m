//
//  EmployeeEditViewController.m
//  BindingsHandsOn
//
//  Created by Samuel Defago on 19/11/14.
//  Copyright (c) 2014 Samuel Défago. All rights reserved.
//

#import "EmployeeEditViewController.h"

@implementation EmployeeEditViewController

- (void)boundView:(UIView *)boundView checkDidSucceedWithObject:(id)object
{
    boundView.backgroundColor = [UIColor clearColor];
}

- (void)boundView:(UIView *)boundView checkDidFailWithObject:(id)object error:(NSError *)error
{
    boundView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.4f];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender
{
    if (! [self checkBoundViewHierarchyWithError:NULL]) {
        return;
    }
    
    [self.delegate employeeEditViewController:self didSaveEmployee:self.employee];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
