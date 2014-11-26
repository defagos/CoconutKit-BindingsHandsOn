//
//  EmployeeEditViewController.h
//  BindingsHandsOn
//
//  Created by Samuel Defago on 19/11/14.
//  Copyright (c) 2014 Samuel Défago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoconutKit.h"
#import "Employee.h"

@protocol EmployeeEditViewControllerDelegate;

@interface EmployeeEditViewController : UIViewController <HLSViewBindingDelegate, UITextFieldDelegate>

@property (nonatomic, strong) Employee *employee;
@property (nonatomic, weak) id<EmployeeEditViewControllerDelegate> delegate;

@end

@protocol EmployeeEditViewControllerDelegate <NSObject>

- (void)employeeEditViewController:(EmployeeEditViewController *)employeeEditViewController didSaveEmployee:(Employee *)employee;

@end
