//
//  PeopleTableViewCell.swift
//  PotterReview
//
//  Created by adetokunbo babatunde on 6/23/20.
//  Copyright © 2020 adetokunbo babatunde. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personFilmLabel: UILabel!
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let person = person else { return }
        PersonController.fetchFilms(person: person) { (result) in
            switch result {
                
            case .success(let film):
                DispatchQueue.main.async {
                    self.personFilmLabel.text = "First film: \(film)"
                    self.personNameLabel.text = person.name
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
