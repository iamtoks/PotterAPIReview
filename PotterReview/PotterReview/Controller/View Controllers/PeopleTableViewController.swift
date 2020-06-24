//
//  PeopleTableViewController.swift
//  PotterReview
//
//  Created by adetokunbo babatunde on 6/23/20.
//  Copyright © 2020 adetokunbo babatunde. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {

    var people: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPeopleAndUpdateViews()
    }

    func fetchPeopleAndUpdateViews() {
        PersonController.fetchPeople { (result) in
            switch result {
                
            case .success(let people):
                self.people = people
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.errorDescription)
            }
        }
        
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as? PeopleTableViewCell else { return UITableViewCell() }

        let person = people[indexPath.row]
        cell.person = person
        
        return cell
    }
    
}
