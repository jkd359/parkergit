//
//  SearchViewController.h
//  parker
//
//  Created by Joel on 6/11/13.
//  Copyright (c) 2013 Joel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UITableViewController
@property (nonatomic, strong) UITableView *sampleTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@end
