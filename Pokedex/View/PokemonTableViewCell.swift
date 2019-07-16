//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Code Red on 13/07/19.
//  Copyright © 2019 particular. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
   
    @IBOutlet weak var imgImagem: UIImageView!
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblTipo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
