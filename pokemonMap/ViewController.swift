//
//  ViewController.swift
//  pokemonMap
//
//  Created by Antony Sebastian Cueva Fajardo on 11/6/19.
//  Copyright © 2019 Antony Sebastian Cueva Fajardo. All rights reserved.
//

//[Imports]
import UIKit
import MapKit

class ViewController: UIViewController ,CLLocationManagerDelegate{

    //[Vars]
    var ubication = CLLocationManager()
    
    var contadorActualizaciones = 0
    //[Oultet Connections]
    @IBOutlet weak var mapView: MKMapView!
    //[Action Connections]
    @IBAction func centerTapped(_ sender: Any) {
        tapForCenter()
    }
    
    override func viewDidLoad() {
        //[ViewDidLoad]
        super.viewDidLoad()
        //[Funcs]
        authoritationManager()
    }
    
    //[Center Tapped]
    func tapForCenter(){
        if let coord = ubication.location?.coordinate{
            let region = MKCoordinateRegion(center: ubication.location!.coordinate,latitudinalMeters: 1000,longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            contadorActualizaciones += 1
        }
    }
    //[Authoritation Function]
    func authoritationManager(){
        ubication.delegate = self
                //Conditional for verify the authoritation of GPS
                if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
                    //[If Authoritatio is true active the ubication user and the manager active the listener updating]
                    //[MkMapView]
                           mapView.showsUserLocation = true
                    //[CLLocationManager]
                    ubication.startUpdatingLocation()
                    //[Pines for the routes]
                    Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {(timer) in if let coord =  self.ubication.location?.coordinate{
                        let pin = MKPointAnnotation()
                        pin.coordinate = coord
                        //[Latitud and Longitud]
                        let randomLat = (Double(arc4random_uniform(200))-100.0)/5000.0
                        let randomLon = (Double(arc4random_uniform(200))-100.0)/5000.0
                        
                        pin.coordinate.longitude += randomLon
                        pin.coordinate.latitude += randomLat
                        
                        self.mapView.addAnnotation(pin)
                        }})
                }else{
                    //[Active menssage of authoritation]
                    //[CLLocationManager]
                ubication.requestWhenInUseAuthorization()
                }
    }
    //[CLLLocationManager]
        
    
    
    //[Location Manager Functions Configs]
        //[CLLocation Manager / This function is for the locationManager dector any changes , but in this case is an didUpdateLocations]
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            //[Mensagge of Ubication is updated]
            print("Ubication is updated")
            //Conditional for MKCoordinateRegion y val is change then set the new locacion coordenade if else stop
            if (contadorActualizaciones < 1 ){
                let region = MKCoordinateRegion(center: ubication.location!.coordinate,latitudinalMeters: 1000,longitudinalMeters: 1000)
                mapView.setRegion(region,animated: true)
                contadorActualizaciones += 1
            }else{
                ubication.stopUpdatingLocation()
            }
        }

}

