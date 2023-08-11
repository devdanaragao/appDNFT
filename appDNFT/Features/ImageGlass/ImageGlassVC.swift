//
//  ImageGlassVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 21/06/2023.
//

import UIKit
import AlamofireImage

class ImageGlassVC: UIViewController {

    private var screen: ImageGlassScreen?
    
    private var urlImage: String
    
    override func loadView() {
        screen = ImageGlassScreen()
        view = screen
    }
    
    required init(urlImage: String) {
        self.urlImage = urlImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        configImage()
    }
    
    private func configImage() {
        guard let url = URL(string: urlImage) else { return }
        screen?.nftImage.af.setImage(withURL: url)
    }
    
}

extension ImageGlassVC: ImageGlassScreenProtocol {
    func pressBackButton() {
        dismiss(animated: true)
    }
    
    
}
