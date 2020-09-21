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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PartnerExpandableTableViewCell
        cell.delegate = self
        
        if indexPath.row == 0 {
            let partner = Partner(image: #imageLiteral(resourceName: "246x0w"), name: "First Partner", genre: "First Genre", details: "Aliquam et lectus eu ante condimentum vulputate. Vivamus nec congue metus, in placerat ex. Sed placerat cursus ante ac luctus. Phasellus in erat placerat, fringilla lorem ut, condimentum tortor. Maecenas pellentesque tempus tempus. Duis dapibus augue lacinia elit consequat, id cursus lorem aliquam. Morbi malesuada gravida neque eu molestie. Maecenas fringilla varius interdum. Ut dolor lectus, iaculis vitae augue nec, semper laoreet mauris. Curabitur rutrum a diam et ultrices. Pellentesque risus mi, tincidunt eu vulputate non, aliquet vel quam. Ut varius ante id imperdiet rhoncus. Praesent malesuada urna sed tellus congue, quis suscipit tellus malesuada. Pellentesque dictum lorem in leo sagittis blandit. Mauris non urna viverra, sodales neque id, imperdiet odio. ")
             cell.configureCell(withPartner: partner)
        }
        else if indexPath.row == 1{
           let partner = Partner(image: #imageLiteral(resourceName: "246x0w"), name: "Second Partner", genre: "Music", details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam in dui ipsum. Vivamus a bibendum augue, ac lobortis lacus. Integer laoreet, diam at venenatis faucibus, enim arcu tempor ligula, ac imperdiet arcu enim vel risus. Vivamus in sollicitudin lorem, non dignissim libero. Nullam id dui justo. Nunc fringilla non libero et blandit. Nullam luctus consectetur augue, vel porta dui sodales ut. Nunc vel bibendum tortor. Phasellus tempor ipsum eu odio molestie laoreet ac a metus. Nam vehicula varius orci id eleifend. Curabitur mollis augue ac consequat bibendum. Nunc mauris ex, pulvinar vitae cursus eget, finibus a nibh. Etiam blandit vehicula nulla in vehicula. Vivamus id dui elit")
             cell.configureCell(withPartner: partner)
        }
        else if indexPath.row == 2{
           let partner = Partner(image: #imageLiteral(resourceName: "246x0w"), name: "Third Partner", genre: "Dummy Genre", details: "Aliquam at fermentum neque, at convallis nibh. Suspendisse luctus aliquet est in tristique. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis et vestibulum erat. Nulla facilisi. Sed rhoncus volutpat cursus. Mauris laoreet dignissim condimentum. Maecenas quis venenatis quam. Suspendisse a lectus mi. Ut rhoncus, quam eget feugiat elementum, elit ante tempor dui, ac malesuada libero magna ut risus. Cras rhoncus urna orci, vitae pulvinar ligula maximus aliquam. Duis pharetra rhoncus elit at ullamcorper. Donec iaculis ex et elit venenatis pulvinar. Curabitur porttitor varius nibh eu ornare. Cras a sagittis libero, et egestas metus.")
             cell.configureCell(withPartner: partner)
        }

           

        
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndicies.contains(indexPath.row){
            return 80 + PartnerExpandableTableViewCell.cellsHeights[indexPath.row]
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
            cell.hideDownArrow()
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)

    }


}

extension ViewController : ExpandableCellDelegate {
    func subscribe(partnerId: String) {
         print("Subscribed to \(partnerId)")
    }

    
}

