//
//  ViewController.swift
//  Maps
//
//  Created by James Leach on 11/22/16.
//  Copyright © 2016 Dadio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{



    @IBOutlet weak var map: MKMapView!



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let latitude: CLLocationDegrees = 35.045823

        let longitude: CLLocationDegrees = -90.0230479

        let latDelta: CLLocationDegrees = 0.05

        let lonDelta: CLLocationDegrees = 0.05

        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)

        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)

        map.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()

        annotation.title = "Graceland"

        annotation.subtitle = "Like to go back"

        annotation.coordinate = coordinates

        map.addAnnotation(annotation)

        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))

        uilpgr.minimumPressDuration = 2

        map.addGestureRecognizer(uilpgr)






    }


    func longpress(gestureRecognizer: UIGestureRecognizer){

        let touchPoint = gestureRecognizer.location(in:self.map)

        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)

        let annotation = MKPointAnnotation()

        annotation.coordinate = coordinate

        annotation.title = "New Place"

        annotation.subtitle = "Maybe I'll go here too..."

        map.addAnnotation(annotation)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

