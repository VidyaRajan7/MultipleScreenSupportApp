//
//  Monster.swift
//  MultipleScreenSupportApp
//
//  Created by Developer Admin on 08/07/20.
//  Copyright © 2020 Developer Admin. All rights reserved.
//

import UIKit

enum Weapon {
  case blowgun, ninjaStar, fire, sword, smoke

  var image: UIImage {
    switch self {
    case .blowgun:
      return UIImage(named: "cloud.png")!
    case .fire:
      return UIImage(named: "cloud.png")!
    case .ninjaStar:
      return UIImage(named: "cloud.png")!
    case .smoke:
      return UIImage(named: "cloud.png")!
    case .sword:
      return UIImage(named: "cloud.png")!
    }
  }
}

class Monster {
  let name: String
  let description: String
  let iconName: String
  let weapon: Weapon

  init(name: String, description: String, iconName: String, weapon: Weapon) {
    self.name = name
    self.description = description
    self.iconName = iconName
    self.weapon = weapon
  }

  var icon: UIImage? {
    return UIImage(named: iconName)
  }
}
