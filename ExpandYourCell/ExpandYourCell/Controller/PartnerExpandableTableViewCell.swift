//
//  PartnerExpandableTableViewCell.swift
//  ExpandYourCell
//
//  Created by Gamal Mostafa on 9/20/20.
//  Copyright © 2020 Orange. All rights reserved.
//

import UIKit

class PartnerExpandableTableViewCell: UITableViewCell {
    
    //MARK:- Instance Variables
    @IBOutlet weak private var imageViewPartnerImage: UIImageView!
    @IBOutlet weak private var lblPartnerName: UILabel!
    @IBOutlet weak private var lblGenre: UILabel!
    @IBOutlet weak private var btnSubscribe: UIButton!
    @IBOutlet weak private var lblDetails: UILabel!
    @IBOutlet weak var btnDownArrow: UIButton!
    @IBOutlet weak var btnUpArrow: UIButton!
    @IBOutlet weak var constraintLblDetailsHeight: NSLayoutConstraint!
    
    //MARK:- Instance variable
    var delegate : ExpandableCellDelegate?
    var partner: Partner?
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        btnSubscribe.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        btnUpArrow.isHidden = true
        self.textLabel?.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    //MARK:- Configure Cell
    func configureCell(withPartner partner: Partner){
        self.partner = partner
        self.imageViewPartnerImage.image = partner.image
        self.lblPartnerName.text = partner.name
        self.lblGenre.text = partner.genre
        self.lblDetails.text = partner.details
        var maximumLabelSize: CGSize = CGSize(width: 280, height: 9999)
        var expectedLabelSize: CGSize = lblDetails.sizeThatFits(maximumLabelSize)
        var newFrame: CGRect = lblDetails.frame
        newFrame.size.height = expectedLabelSize.height
        constraintLblDetailsHeight.constant = (expectedLabelSize.height)
        lblDetails.frame = newFrame
    }
    
    //MARK:- show/hide down arrow
    func showDownArrow(){
        btnDownArrow.isHidden = false
        btnUpArrow.isHidden = true
    }
    func hideDownArrow(){
        btnDownArrow.isHidden = true
        btnUpArrow.isHidden = false
    }
    
    
    //MARK:- IBAction
    @IBAction func didPressSubscribe(_ sender: Any) {
        delegate?.subscribe(partnerId: partner?.name ?? "" )
    }

    
}

protocol ExpandableCellDelegate {
    func subscribe(partnerId: String)
}

