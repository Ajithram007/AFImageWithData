//
//  AFTableViewCell.swift
//  AFGitHubIssues
//
//  Created by Ajithram on 02/12/20.
//

import UIKit

class AFTableViewCell: UITableViewCell {

    @IBOutlet weak var baseStack: UIStackView!
    @IBOutlet weak var avatharImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creationTimeLabel: UILabel!
    @IBOutlet weak var loginNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}


extension AFTableViewCell: TableViewCellDataPopulation {
    func populate(_ data: Any) {
        if let aFData = data as? AFTableViewModel {
            titleLabel.text = aFData.title
            creationTimeLabel.text = aFData.creationTime
            loginNameLabel.text = aFData.loginName
            avatharImage.image = aFData.avatherImage
        }
    }
}

class AFTableViewModel {
    var avatherImage: UIImage?
    var title: String?
    var creationTime: String?
    var loginName: String?
    
    init(avatherImage: UIImage? = UIImage(), title: String?, creationTime: String?, loginName: String?) {
        self.avatherImage = avatherImage
        self.title = title
        self.creationTime = creationTime
        self.loginName = loginName
    }
}
