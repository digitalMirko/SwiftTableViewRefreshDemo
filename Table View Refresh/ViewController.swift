//
//  ViewController.swift
//  Table View Refresh
//
//  Created by Mirko Cukich on 8/17/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//
//  Swift UITableView Refresh Demo - Demo 10 of 30

import UIKit

class ViewController: UIViewController {
    
    // Table View
    @IBOutlet weak var tableView: UITableView!
    
    // Data Set
    var data = ["Bread", "Milk", "Cheese", "Mayo", "MayoMustard", "Coffee", "Green Tea",
                "Pizzelle", "Nutella", "Cottage Cheese", "Sour Cream"]

    // Refresh Control
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initializes Table View functions
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(addMoreData(_:)), for: UIControl.Event.valueChanged)
        self.refreshControl.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)   // tint color of the refresh wheel - light blue
        self.refreshControl.attributedTitle = NSAttributedString(string: "Retrieving new data...")
    }
    // adds more data when refreshed
    @objc func addMoreData(_ sender: UIRefreshControl) {
        // adds 2 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.data.append(contentsOf: ["Watermellon", "Grapes", "Bananas", "Tomatoes", "Onions",
                                    "Chocolate", "Potato Chips", "Aluminum Foil", "Sliced Chicken",
                                    "Avacado", "Slided Turkey", "Sliced Roast Beef", "Chicken Salad"])
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
}

// Table View Details: Row Count and Cell identifier
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
}
