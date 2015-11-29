//
//  Places.swift
//  BlocSpot
//
//  Created by Eric Chamberlin on 11/27/15.
//  Copyright © 2015 Eric Chamberlin. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import CoreData

class Places: NSObject, MKAnnotation {
    
        var title: String?
        var coordinate: CLLocationCoordinate2D
        var info: String
        
        init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
            self.title = title
            self.coordinate = coordinate
            self.info = info
        }
    }

