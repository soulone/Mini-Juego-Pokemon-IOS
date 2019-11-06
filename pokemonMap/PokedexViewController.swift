//
//  PokedexViewController.swift
//  pokemonMap
//
//  Created by Antony Sebastian Cueva Fajardo on 11/6/19.
//  Copyright © 2019 Antony Sebastian Cueva Fajardo. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    //[Outlet Connections]
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func mapTapped(_ sender: Any) {
        backToMap()
    }
    override func viewDidLoad() {
        //[viewDidLoad]
        super.viewDidLoad()
        //[Functions]
        
    }
    
    
    //[Functions]
    
    func backToMap(){
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
