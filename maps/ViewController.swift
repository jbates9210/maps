//
//  ViewController.swift
//  maps
//
//  Created by Jared Bates on 4/24/18.
//  Copyright © 2018 jared. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Position of map in coordinates
        let latitude: CLLocationDegrees = 39.467283
        let longitude: CLLocationDegrees = -84.452800
        
        // Zoom level - lower number, closer zoom
        let latDelta: CLLocationDegrees = 0.005
        let lonDelta: CLLocationDegrees = 0.005
        
        // Span - combination of latDelta and lonDelta
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        // location - set the location using the longitude and latitude
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        // convert to region to use with map.setRegion using location and span
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        // create annotations for map
        let annotation = MKPointAnnotation()
        annotation.title = "Home"
        annotation.subtitle = "This is home"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        // let user create annotations on map
        var uiLongPressGestRec = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uiLongPressGestRec.minimumPressDuration = 2
        map.addGestureRecognizer(uiLongPressGestRec)
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Annotation"
        annotation.subtitle = "New Subtitle"
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

