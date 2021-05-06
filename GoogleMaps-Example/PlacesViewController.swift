//
//  PlacesViewController.swift
//  GoogleMaps-Example
//
//  Created by Long Nguyễn on 06/05/2021.
//

import UIKit
import GooglePlaces

class PlacesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var likelyPlaces: [GMSPlace] = []
    var selectedPlace: GMSPlace? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToMain" {
            if let vc = segue.destination as? ViewController {
                vc.selectedPlace = selectedPlace
            }
        }
    }
}

extension PlacesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlace = likelyPlaces[indexPath.row]
        
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.size.height/5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == tableView.numberOfSections - 1 {
            return 1
        }
        
        return 0
    }
}

extension PlacesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likelyPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        let collectionItem = likelyPlaces[indexPath.row]
        
        cell.textLabel?.text = collectionItem.name
        
        return cell
    }
    
    
}
 
