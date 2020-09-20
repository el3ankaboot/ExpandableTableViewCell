//
//  ViewController.swift
//  ExpandYourCell
//
//  Created by Gamal Mostafa on 9/20/20.
//  Copyright © 2020 Orange. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    let identifier = "ExpandableCell"
    
    //MARK:- Instance Variables
    var selectedIndicies : [Int] = []
    var currentLabelHeightOnRefresh : CGFloat = 7.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PartnerExpandableTableViewCell
        cell.delegate = self
        
            let partner = Partner(image: #imageLiteral(resourceName: "246x0w"), name: "My Partner", genre: "Genre", details: "So if on advanced addition absolute received replying throwing he. Delighted consisted newspaper of unfeeling as neglected so. Tell size come hard mrs and four fond are. Of in commanded earnestly resources it. At quitting in strictly up wandered of relation answered felicity. Side need at in what dear ever upon if. Same down want joy neat ask pain help she. Alone three stuff use law walls fat asked. Near do that he help. Now eldest new tastes plenty mother called misery get. Longer excuse for county nor except met its things. Narrow enough sex moment desire are. Hold who what come that seen read age its. Contained or estimable earnestly so perceived. Imprudence he in sufficient cultivated. Delighted promotion improving acuteness an newspaper offending he. Misery in am secure theirs giving an. Design on longer thrown oppose am. ")

            cell.configureCell(withPartner: partner)

        
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndicies.contains(indexPath.row){
            return 80 + currentLabelHeightOnRefresh
        }
        else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PartnerExpandableTableViewCell
        let row = indexPath.row
        if selectedIndicies.contains(row){
            selectedIndicies = selectedIndicies.filter(){$0 != row}
            cell.showDownArrow()
        }
        else{
            selectedIndicies.append(row)
            self.currentLabelHeightOnRefresh = cell.constraintLblDetailsHeight.constant
            cell.hideDownArrow()
        }

        tableView.reloadRows(at: [indexPath], with: .automatic)

    }


}

extension ViewController : ExpandableCellDelegate {
    func subscribe(partnerId: String) {
         print("Subscribed to \(partnerId)")
    }

    
}

