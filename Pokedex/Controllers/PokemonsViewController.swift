//
//  PokemonsViewController.swift
//  Pokedex
//
//  Created by Code Red on 13/07/19.
//  Copyright © 2019 particular. All rights reserved.
//

import UIKit
import Alamofire

class PokemonsViewController: UIViewController {

    @IBOutlet weak var tblPokemons: UITableView!
    
    var pokemons : Array<Pokemon> = []
    var pokemonSelecionado : Pokemon? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        
        nav?.topItem?.title = "Pokémons"
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        carregasDados()
    }
    
    
    func carregasDados() {
        AF.request("http://localhost:3001/pokemons", method: .get).responseDecodable{ (response : DataResponse<ApiResponse>) in
            if(response.result.isSuccess) {
                self.pokemons = (response.result.value?.pokemons)!
                self.tblPokemons.reloadData()
            }
            
        }
    }


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "seguePokemonDetalhes") {
            let destino = segue.destination as! PokemonViewController
            destino.pokemon = pokemonSelecionado
        }
    }
 

}

extension PokemonsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cellPokemon") as! PokemonTableViewCell
        let pokemon = self.pokemons[indexPath.row]
        
        celula.lblNome.text = pokemon.name
        celula.lblTipo.text = pokemon.type
        if(pokemon.type?.localizedLowercase == "planta") {
            celula.lblTipo.textColor = UIColor.green
        } else if(pokemon.type?.localizedLowercase == "fogo") {
            celula.lblTipo.textColor = UIColor.red
        }
        celula.imgImagem.dowloadFromServer(link: pokemon.urlImage ?? "")
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.pokemonSelecionado = self.pokemons[indexPath.row]
        
        performSegue(withIdentifier: "seguePokemonDetalhes", sender: self)
    }
}
