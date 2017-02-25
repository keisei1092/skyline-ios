//
//  SecondTableViewController.swift
//  skyline
//
//  Created by Keisei Saito on 2017/2/25.
//  Copyright © 2017年 keisei_1092. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController {

	enum Sections: Int {
		case face = 0, size
	}

	var config: [String: [String]] = [
		"face": [],
		"size": [
			"10",
			"11",
			"12",
			"13",
			"14",
			"16",
			"20",
			"24",
			"32",
			"64"
		]
	]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

		view.backgroundColor = .groupTableViewBackground
		let tableFooterView = UIView(frame: CGRect.zero)
		tableView.tableFooterView = tableFooterView

		navigationController?.navigationBar.barStyle = .blackTranslucent

		UIFont.familyNames.sorted().forEach({ familyName in
			UIFont.fontNames(forFamilyName: familyName).forEach({ fontName in
				config["face"]?.append(fontName)
			})
		})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return config.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case Sections.face.rawValue:
			return config["face"]?.count ?? 0
		case Sections.size.rawValue:
			return config["size"]?.count ?? 0
		default:
			return 0
		}
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

		switch indexPath.section {
		case Sections.face.rawValue:
			let name = config["face"]?[indexPath.row] ?? ""
			let font = cell.textLabel?.font
			cell.textLabel?.text = "\(name) あア亜"
			cell.textLabel?.font = UIFont(name: name, size: font!.pointSize)
		case Sections.size.rawValue:
			cell.textLabel?.text = config["size"]?[indexPath.row] ?? ""
		default:
			break
		}

        return cell
    }

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case Sections.face.rawValue:
			return "face"
		case Sections.size.rawValue:
			return "size"
		default:
			break
		}
		return nil
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch indexPath.section {
		case Sections.face.rawValue:
			TextAttributesManager.shared.face = config["face"]?[indexPath.row] ?? ""
		case Sections.size.rawValue:
			TextAttributesManager.shared.size = CGFloat((config["size"]![indexPath.row] as NSString).doubleValue)
		default:
			break
		}
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
