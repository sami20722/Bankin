//
//  HomeCell.swift
//  Bankin
//
//  Created by ben lassoued sami on 17/01/2022.
//

import UIKit
class HomeCell : UITableViewCell {

    var bank : ParenBanks? {
        didSet {
            if let logoUrl = bank?.logoUrl{
                bankImage.load(urlString: logoUrl)
            }
            bankNameLabel.text = bank?.name
        }
    }
    private let bankNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    

    
    private let bankImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bankImage)
        addSubview(bankNameLabel)
        
        bankImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        
        bankNameLabel.anchor(top: topAnchor, left: bankImage.rightAnchor, bottom: nil, right: nil, paddingTop: frame.size.height / 2, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width - bankImage.frame.width, height: 0, enableInsets: false)
        addSubview(bankImage)
        addSubview(bankNameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.bankImage.image = nil
    }
}
