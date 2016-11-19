//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Murad Hajiyev on 11/19/16.
//  Copyright © 2016 Murad Hajiyev. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!


    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImg.image = nil
        nextEvoImg.image = nil
        currentEvoImg.image = nil
        descriptionLbl.text = ""
        activityIndicator.startAnimating()
        
        
        nameLbl.text = pokemon.name.capitalized
        
        let image = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = image
        currentEvoImg.image = image
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            print("Did arrive here")
            self.updateUI()
            self.activityIndicator.stopAnimating()
        }
    }
    
    func updateUI(){
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        }else{
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
