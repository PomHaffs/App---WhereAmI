//
//  ViewController.swift
//  WhereAmI
//
//  Created by Tomas-William Haffenden on 22/12/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if activePlace != -1 {
            
            //get details and display on map
            if places.count > activePlace {
                if let name = places[activePlace]["name"] {
                    
                    if let lat = places[activePlace]["lat"] {
                        
                        if let long = places[activePlace]["long"] {
                            
                            if let latitude = Double(lat) {
                                
                                if let longitude = Double(long) {
                                    
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    
                                    self.map.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    
                                    annotation.coordinate = coordinate
                                    
                                    annotation.title = name
                                    
                                    self.map.addAnnotation(annotation)

                                }
                            }
                        }
                    }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

