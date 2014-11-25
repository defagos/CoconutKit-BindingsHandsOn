//
//  EmployeesViewController.m
//  BindingsHandsOn
//
//  Created by Samuel Defago on 19/11/14.
//  Copyright (c) 2014 Samuel Défago. All rights reserved.
//

#import "EmployeesViewController.h"

#import "Employee.h"
#import "EmployeeTableViewCell.h"

@interface EmployeesViewController ()

@property (nonatomic, strong) NSArray *employees;

@end

@implementation EmployeesViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EmployeeEditViewController *employeeEditViewController = segue.destinationViewController;
    employeeEditViewController.delegate = self;
    
    if ([segue.identifier isEqualToString:@"addEmployee"]) {
        employeeEditViewController.employee = [[Employee alloc] init];
    }
    else if ([segue.identifier isEqualToString:@"editEmployee"]) {
        EmployeeTableViewCell *employeeCell = sender;
        employeeEditViewController.employee = employeeCell.employee;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:@"EmployeeTableViewCell"];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    EmployeeTableViewCell *employeeCell = (EmployeeTableViewCell *)cell;
    employeeCell.employee = self.employees[indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    EmployeeTableViewCell *employeeCell = (EmployeeTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"editEmployee" sender:employeeCell];
}

- (void)employeeEditViewController:(EmployeeEditViewController *)employeeEditViewController didSaveEmployee:(Employee *)employee
{
    if (! [self.employees containsObject:employee]) {
        self.employees = self.employees ? [self.employees arrayByAddingObject:employee] : @[employee];
        [self.tableView reloadData];
    }
}

@end
