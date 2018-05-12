//
//  HomeController.swift
//  contact
//
//  Created by christophe milliere on 12/05/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit
import CoreData

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let cellId = "HomeCell"
    
    var companies = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCompanies()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return companies.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let employees = companies[section].employee?.allObjects as? [Personn] {
            return employees.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return companies[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let employees = companies[indexPath.section].employee?.allObjects as? [Personn] {
            let employeesCell = employees[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? HomeCell {
                cell.setupCell(personn: employeesCell)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            if let personnDelete = companies[indexPath.section].employee?.allObjects[indexPath.row] as? Personn {
                context?.delete(personnDelete)
                
                do{
                    try context?.save()
                }catch{
                    print(error.localizedDescription)
                }
                
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default: break
        }
    }
    
    
    func fetchCompanies() {
        let request: NSFetchRequest<Company> = Company.fetchRequest()
        let tri = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [tri]
        do {
            companies = (try context?.fetch(request))!
            tableView.reloadData()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    
}
