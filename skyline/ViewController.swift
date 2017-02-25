//
//  ViewController.swift
//  skyline
//
//  Created by Keisei Saito on 2017/2/25.
//  Copyright © 2017年 keisei_1092. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var textView: UITextView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setNeedsStatusBarAppearanceUpdate()
		registerForKeyboardNotifications()
		navigationController?.isToolbarHidden = false
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		refreshTextAttributes()
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

	func registerForKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShown), name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillBeHidden), name: .UIKeyboardWillHide, object: nil)
	}

	func keyboardWillShown(notification: Notification) {
		guard let info = notification.userInfo else {
			print("No notification info for keyboard")
			return
		}

		guard let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size else {
			print("No keyboard size")
			return
		}

		scrollView.contentOffset.y = keyboardSize.height
	}

	func keyboardWillBeHidden(notification: Notification) {
		scrollView.contentOffset.y = 0
	}

	private func refreshTextAttributes() {
		textView.font = TextAttributesManager.shared.font
	}

}

extension ViewController: UIScrollViewDelegate {

	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
		textView.resignFirstResponder()
	}

}

