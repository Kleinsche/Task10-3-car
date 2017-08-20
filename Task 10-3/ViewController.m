//
//  ViewController.m
//  Task 10-3
//
//  Created by 🍋 on 2016/12/28.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "progressView.h"
#import "AnnotationView.h"
#import "DidSelectAnnotationView.h"

@interface ViewController ()<MKMapViewDelegate,progressDelegate>

@property (nonatomic,strong) CLLocationManager * manager;
@property (strong, nonatomic) MKMapView *mapView;
@property (nonatomic,strong) CLGeocoder * coder;
@property (nonatomic,strong) CLLocation * location;
@property (nonatomic,strong) progressView * buttomView;
@property (nonatomic,strong) DidSelectAnnotationView * selectView;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mapView];
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    }
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    [self buttomView];
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    self.location = userLocation.location;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    [self.buttomView removeFromSuperview];
    NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"DidSelectAnnotation" owner:nil options:nil];
    self.selectView = [arr firstObject];
    self.selectView.frame = self.buttomView.frame;
    self.selectView.value = self.value;
    [self.view addSubview:self.selectView];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    [self.selectView removeFromSuperview];
    [self.view addSubview:self.buttomView];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    AnnotationView * view = [[AnnotationView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    if ([annotation.title isEqualToString:@"日租大众"]) {
        view.value = 0;
        return view;
    }else if ([annotation.title isEqualToString:@"时租宝马"]){
        view.value = 1;
        return view;
    }
    return nil;
}

- (MKMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MKMapView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [self.view insertSubview:_mapView atIndex:0];
        _mapView.delegate = self;
    }
    return _mapView;
}

- (CLLocationManager*)manager {
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
    }
    return _manager;
}

- (CLGeocoder *)coder {
    if (!_coder) {
        _coder = [[CLGeocoder alloc]init];
    }
    return _coder;
}

- (progressView *)buttomView {
    if (!_buttomView) {
        _buttomView = [[progressView alloc]initWithFrame:CGRectMake(0, ScreenHeight * 9/10, ScreenWidth, ScreenHeight * 1/10)];
        _buttomView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_buttomView];
        _buttomView.delegate = self;
    }
    return _buttomView;
}

//代理传值
- (void)showView:(int)value {
//    NSLog(@"%d",value);
    self.value = value;
    [self.mapView removeAnnotations:[self.mapView annotations]];
    MyAnnotation * annotation = [[MyAnnotation alloc]init];
    if (self.value == 0) {
        NSLog(@"%f %f",self.location.coordinate.latitude, self.location.coordinate.longitude);
        annotation.coordinate = CLLocationCoordinate2DMake(self.location.coordinate.latitude, self.location.coordinate.longitude + 0.002);
        annotation.title = @"日租大众";
        [self.mapView addAnnotation:annotation];
    }else if (self.value == 1) {
        annotation.coordinate = CLLocationCoordinate2DMake(self.location.coordinate.latitude + 0.002, self.location.coordinate.longitude);
        annotation.title = @"时租宝马";
        [self.mapView addAnnotation:annotation];
    }
}

- (IBAction)reduceArea:(id)sender {
    MKCoordinateSpan span = self.mapView.region.span;
    span.latitudeDelta *= 2;
    span.longitudeDelta *= 2;
    if (span.latitudeDelta >= 128 || span.longitudeDelta >= 112) {
        span.latitudeDelta = 128;
        span.longitudeDelta = 112;
    }
    
    [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.centerCoordinate, span)];
}

- (IBAction)addArea:(id)sender {
    MKCoordinateSpan span = self.mapView.region.span;
    span.latitudeDelta *= 0.5;
    span.longitudeDelta *= 0.5;
    
    [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.centerCoordinate, span)];
}

- (IBAction)myLocation:(id)sender {
    [self.mapView setCenterCoordinate:self.location.coordinate animated:YES];
}




@end
