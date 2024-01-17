//
//  ViewController.swift
//  PokeExamen
//
//  Created by Victor Perez on 16/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter : HomeViewToPresenter? 
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        print(presenter == nil)
        view.backgroundColor = .white
    }


}

extension HomeViewController : HomePresenterToView{
    func reloadInfo() {
        print("que show")
    }
    
    
}
