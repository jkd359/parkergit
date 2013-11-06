//
//  ViewController.m
//  parker
//
//  Created by Joel on 5/11/13.
//  Copyright (c) 2013 Joel. All rights reserved.
//

#import "SWRevealViewController.h"

#import "ViewController.h"
#import <MapBox/MapBox.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet RMMapView *mapView;

@end

@implementation ViewController
@synthesize mapView;

- (void)viewDidLoad
{
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.2f alpha:0.96f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

//________________Break between Revealcontroller code and mapbox code______________________//
    
    [super viewDidLoad];
    
    self.title = @"Parker";
	// Do any additional setup after loading the view, typically from a nib.
//    RMMapBoxSource *tileSource = [[RMMapBoxSource alloc] initWithMapID:@"jkd359.g6pohm4e"];

    self.mapView = [[RMMapView alloc] initWithFrame:self.view.bounds];
    
    
    [mapView addTileSource:[[RMMapBoxSource alloc] initWithMapID:@"jkd359.g6pohm4e"enablingDataOnMapView:self.mapView]];
    

    
    [self.view addSubview:mapView];
    
    mapView.showsUserLocation = YES;
        
    mapView.hideAttribution = YES;
    
        self.navigationItem.rightBarButtonItem = [[RMUserTrackingBarButtonItem alloc] initWithMapView:self.mapView];
    
}

#pragma mark -

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
//    if (annotation.isUserLocationAnnotation)
//        return nil;
    
    RMMarker *marker = [[RMMarker alloc] initWithMapBoxMarkerImage:[annotation.userInfo objectForKey:@"marker-symbol"]
                                                      tintColorHex:[annotation.userInfo objectForKey:@"marker-color"]
                                                        sizeString:[annotation.userInfo objectForKey:@"marker-size"]];
    
    marker.canShowCallout = YES;
    
    marker.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
//    if (self.activeFilterTypes)
//        marker.hidden = ! [self.activeFilterTypes containsObject:[annotation.userInfo objectForKey:@"marker-symbol"]];
    
    return marker;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.mapView.userTrackingMode = RMUserTrackingModeFollow;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait || [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
