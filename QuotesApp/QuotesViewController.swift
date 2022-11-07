//
//  QuotesViewController.swift
//  QuotesApp
//
//  Created by amtul imrana on 07/11/22.
//

import Foundation
import UIKit


class QuotesViewController : UIViewController{
    
    var  quote : String
    var  authorName : String
    
    lazy var detailsLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 17.00)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = quote
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var authorLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 15.00)
        label.textAlignment = .right
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "-\(authorName)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    func configViews() {
        view.addSubview(detailsLabel)
        view.addSubview(authorLabel)
        
        
        detailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70).isActive = true
        detailsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        
        authorLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 5).isActive = true
        authorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        authorLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
    }
    
    init(quote: String, authorName: String) {
        self.quote = quote
        self.authorName = authorName
        super.init(nibName: nil, bundle: nil)
    }
    @available (* ,unavailable)
    required init?(coder: NSCoder) {
        fatalError(" This class does not support NSCoder")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        view?.backgroundColor = .white
    }
}



