//
//  Country.swift
//  SearchController
//
//  Created by Zac Workman on 29/01/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import Foundation

struct Country {
    let continent: String
    let title: String
    
    static func getAllCountries() -> [Country] {
        return [
            Country(continent:"América", title:"Argentina"),
            Country(continent:"América", title:"Brasil"),
            Country(continent:"América", title:"Chile"),
            Country(continent:"América", title:"Estados Unidos"),
            Country(continent:"América", title:"Paraguai"),
            Country(continent:"América", title:"México"),
            
            Country(continent:"Europa", title:"Alemanha"),
            Country(continent:"Europa", title:"Bélgica"),
            Country(continent:"Europa", title:"Croácia"),
            Country(continent:"Europa", title:"Dinamarca"),
            Country(continent:"Europa", title:"Espanha"),
            Country(continent:"Europa", title:"França"),
            
            Country(continent:"Africa", title:"África do Sul"),
            Country(continent:"Africa", title:"Nigéria"),
            Country(continent:"Africa", title:"Tunísia"),
            Country(continent:"Africa", title:"Uganda"),
            Country(continent:"Africa", title:"Senegal"),
            Country(continent:"Africa", title:"Egito")
        ]
    }
}
