//
//  ViewController.swift
//  skyline
//
//  Created by Keisei Saito on 2017/2/25.
//  Copyright © 2017年 keisei_1092. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var textView: UITextView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setNeedsStatusBarAppearanceUpdate();
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		UIApplication.shared.statusBarStyle = .default
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override var prefersStatusBarHidden: Bool { // trueの場合はステータスバー非表示
		return false
	}

	override var preferredStatusBarStyle: UIStatusBarStyle { // ステータスバーを白くする
		return .lightContent;
	}

}

