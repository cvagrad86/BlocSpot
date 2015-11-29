//
//  EnterPlaces.swift
//  BlocSpot
//
//  Created by Eric Chamberlin on 11/26/15.
//  Copyright © 2015 Eric Chamberlin. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import Foundation


class EnterPlaces: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var placeNameLabel: UITextField!
    
    @IBOutlet weak var placeDifficulty: UITextField!
    
    @IBOutlet weak var placeLocation: UITextField!
    
    @IBOutlet weak var placeLongitude: UITextField!
    
    @IBOutlet weak var placeLatitude: UITextField!
    
    @IBOutlet weak var placeDate: UITextField!
    
    @IBOutlet weak var placeNotes: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str:String = ""
        placeNameLabel.text = str
        
    }
    
    
    @IBAction func savePlacesButton(sender: AnyObject) {
        
        
    }
    
    
}







