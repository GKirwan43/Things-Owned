//
//  previewButton.swift
//  Test
//
//  Created by Gavin M. Kirwan on 11/18/20.
//

import UIKit

protocol MainVCDelegate {
    func buttonPlusTapped()
}
class previewPage: UIViewController {

    @IBOutlet var buttonPlus: UIBarButtonItem!

    var delegate: MainVCDelegate?
    @IBAction func addData(_ sender: Any) {
        delegate?.buttonPlusTapped()
    }
}
