//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Yanglin Tao on 6/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Image UI
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    // Button UI
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // Define an array of UI colors
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]

    // Main function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y:0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        // Button to generate a random photo
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    // Define layout of the button
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets
                .bottom,
            width: view.frame.size.width-60,
            height: 55
        )
    }
    
    // Define button behaviour
    @objc func didTapButton() {
        // Each tap will generate a random photo
        getRandomPhoto()
        // Each tap will generate a random background color
        view.backgroundColor = colors.randomElement()
    }
    
    // Get random photo generated from url
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600/?scenery"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

