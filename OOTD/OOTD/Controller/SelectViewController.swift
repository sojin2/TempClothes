//
//  SelectViewController.swift
//  OOTD
//
//  Created by Jay on 2022/02/12.
//

import UIKit
import SnapKit

final class SelectViewController: UIViewController{
    
    override func viewDidLoad() {
        
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(go), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func go(){
        
        let vc = OotdViewController()
        
        self.present(vc, animated: true, completion: nil)
    }
}
