//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Code Red on 13/07/19.
//  Copyright © 2019 particular. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBAction func gesture(_ sender: Any) {
        print("Swipe")
    }
    @IBOutlet weak var lblTipo: UILabel!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var imgImagem: UIImageView!
    var pokemon : Pokemon? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        
        nav?.topItem?.title = pokemon?.name
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        imgImagem?.dowloadFromServer(link: pokemon?.urlImage ?? "")
        lblTipo.text = pokemon?.type
        if(pokemon?.type?.localizedLowercase == "planta") {
            lblTipo.textColor = UIColor.green
        } else if(pokemon?.type?.localizedLowercase == "fogo") {
            lblTipo.textColor = UIColor.red
        }
        txtDescription.text = pokemon?.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
