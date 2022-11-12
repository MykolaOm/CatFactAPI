//
//  ViewController.swift
//  CatfactApiLesson
//
//  Created by Nikolas Omelianov on 13.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catFactLabel: UILabel!
    @IBOutlet weak var getFactButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var catNetwork: CatFactNetworking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        catNetwork = CatFactNetworking()
    }
    
    @IBAction func getFactButtonTapped(_ sender: UIButton) {
        activityIndicator(isLoading: true)
        catNetwork?.getCatFact(with: { [weak self] catFact in
            DispatchQueue.main.async {
                self?.activityIndicator(isLoading: false)
                self?.getFactButton.setTitle("Next fact", for: .normal)
                self?.catFactLabel.text = catFact.fact
            }
            
        })
    }
    
    private func setupViews() {
        getFactButton.setTitle("Start", for: .normal)
        catFactLabel.text = "Tap Start Button\nto get a fact"
        activityIndicatorView.isHidden = true
    }
    private func activityIndicator(isLoading: Bool) {
        self.activityIndicatorView.isHidden = !isLoading
        if isLoading {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
}

