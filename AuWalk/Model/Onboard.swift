//
//  Onboard.swift
//  AuWalk
//
//  Created by Jose Joao Silva Nunes Alves on 23/06/20.
//  Copyright © 2020 AuWalk. All rights reserved.
//

import Foundation

struct Onboard {
    var image: String
    var subtitle: String
    var buttonTitle: String
    
    
    static func mockOnboard() -> [Onboard] {
        return [
            Onboard(
                image: "onboarding01",
                subtitle: "Bem vindo ao Auwalk, onde você cuida dos seus pets virtuais ao mesmo tempo que cuida de você.",
                buttonTitle: "Próximo"),
            Onboard(
                image: "onboarding02",
                subtitle: "Os seus passos são convertidos em pontos que farão o seu pet evoluir.",
                buttonTitle: "Próximo"),
            Onboard(
                image: "onboarding03",
                subtitle: "Ao fim, cada pet resgatado poderá ser adotado por uma nova familía e você poderá cuidar de novos pets.",
                buttonTitle: "Começar"
            )
        ]
    }
}
