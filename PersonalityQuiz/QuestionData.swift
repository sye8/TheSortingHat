//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by 叶思帆 on 03/07/2017.
//  Copyright © 2017 Sifan Ye. All rights reserved.
//

import Foundation

struct Question{
    var text: String
    var answers: [Answer]
}

struct Answer{
    var text: String
    var type: House
}

enum House{
    case Hufflepuff, Slytherin, Ravenclaw, Gryffindor
    
    var definition: String{
        switch self {
            case .Hufflepuff:
                return "Hufflepuffs value hard work, patience, loyalty, and fair play. The house has produced its share of great wizards – not least Newt Scamander, author of Fantastic Beasts and Where to Find Them"
            case .Slytherin:
                return "Slytherin produces more than its share of Dark wizards, but also turns out leaders who are proud, ambitious and cunning. Merlin is one particularly famous Slytherin"
            case .Ravenclaw:
                return "Ravenclaws prize wit, learning, and wisdom. It's an ethos etched into founder Rowena Ravenclaw diadem: 'wit beyond measure is man's greatest treasure'"
            case .Gryffindor:
                return "With a lion as its crest and Professor McGonagall at its head, Gryffindor is the house which most values the virtues of courage, bravery and determination"
        }
    }
}

