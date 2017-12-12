/*
 * Author: Andreas Linde <mail@andreaslinde.de>
 *
 * Copyright (c) 2012-2014 HockeyApp, Bit Stadium GmbH.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

#import "BITSettingsViewController.h"
#import "HockeySDK.h"


@implementation BITSettingsViewController


#pragma mark - Initialization

- (void)dismissSelf {
  [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                         target:self
                                                                                         action:@selector(dismissSelf)];
  
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(__unused UITableView *)tableView {
  // Return the number of sections.
  return 1;
}


- (NSInteger)tableView:(__unused UITableView *)tableView numberOfRowsInSection:(__unused NSInteger)section {
  // Return the number of rows in the section.
  return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  // Configure the cell...
  if (indexPath.row == 0) {
    cell.textLabel.text = NSLocalizedString(@"Beta Updates", @"");
  } else {
    cell.textLabel.text = NSLocalizedString(@"Feedback", @"");
  }
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  
  return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(__unused UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 0) {
    BITUpdateViewController *updateViewController = [[BITHockeyManager sharedHockeyManager].updateManager hockeyViewController:NO];
    [self.navigationController pushViewController:updateViewController animated:YES];
  } else {
    BITFeedbackListViewController *feedbackViewController = [[BITHockeyManager sharedHockeyManager].feedbackManager feedbackListViewController:NO];
    [self.navigationController pushViewController:feedbackViewController animated:YES];
  }
}


@end
