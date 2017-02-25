//
//  TextAttributesManager.swift
//  skyline
//
//  Created by Keisei Saito on 2017/2/25.
//  Copyright © 2017年 keisei_1092. All rights reserved.
//

import UIKit

class TextAttributesManager {

	static let shared = TextAttributesManager()

	var face = "Helvetica"
	var size: CGFloat = 20

	var font: UIFont {
		return UIFont(name: face, size: size)!
	}

	private init() {

	}

}
