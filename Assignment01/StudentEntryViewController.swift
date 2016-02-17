//
//  StudentEntryViewController.swift
//  Assignment01
//
//  Created by James Farrington on 2/15/16.
//  Copyright © 2016 James Farrington. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class StudentEntryViewController: UIViewController, MKMapViewDelegate {

    
    var locationManager = CLLocationManager()
    
    var student1:student?

    @IBOutlet weak var FirstName: UITextView!
    
    @IBOutlet weak var LastName: UITextView!
    
    @IBOutlet weak var Hometown: UITextView!
    
    @IBOutlet weak var Emoji: UITextView!
    
    @IBOutlet weak var Birthday: UITextView!
    
    @IBOutlet weak var Classification: UITextView!
    
    @IBOutlet weak var StudentMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(student1!.First) \(student1!.Last)"
        FirstName.text = student1?.First
        LastName.text = student1?.Last
        Hometown.text = student1?.Home
        Emoji.text = student1?.emoji
        Birthday.text = student1?.birthday
        Classification.text = student1?.Classification
        
        locationManager.requestWhenInUseAuthorization()
        StudentMap.mapType = .Standard
        //Search for hometown
        
        var resultJSON : String = "" {
            didSet {
                print("setting output as \(resultJSON)")
            }
        }
        
        var longitude: CLLocationDegrees
        var latitude: CLLocationDegrees
        
        func parseJSONResponse( data : NSData ) -> Void {
            let json = JSON(data: data)
            for (_, geometry) in json["results"]["formatted_address"] {
                longitude = geometry["location"]["lng"]
                latitude = geometry["location"]["lng"]
            }
        }
        
        if let searchTerm = student1?.Home{
            
            let url = NSURL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=\(searchTerm)&key=AIzaSyCcfIlhGAkRMPZQWSxToiYOKZiG4bVz36CU")
            let request = NSMutableURLRequest(URL: url!)
            
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request){
                (data, responseText, error) -> Void in
                if error != nil {
                    print(error)
                } else {
                    let result = String(data: data!, encoding: NSASCIIStringEncoding)!
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.resultJSON = result
                        self.parseJSONResponse(data!)
                    })
                    
                }
            }
            task.resume()
            
        }
        
    }

}
