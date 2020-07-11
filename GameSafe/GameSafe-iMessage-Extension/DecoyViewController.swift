//
//  DecoyViewController.swift
//  GameSafe-iMessage-Extension
//
//  Created by Alex Shillingford on 7/10/20.
//  Copyright © 2020 Shillwil. All rights reserved.
//

import UIKit

class DecoyViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .orange
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        imageView.image = UIImage(named: "GamePlayWaiting")!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
