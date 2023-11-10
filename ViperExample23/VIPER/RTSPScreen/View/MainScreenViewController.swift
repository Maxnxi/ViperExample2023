//
//  RTSPScreenViewController.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import UIKit

class RTSPScreenViewController: UIViewController, MainScreenViewInput {
    
    enum Cameras {
        static let routes: [String] = [
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/"
        ]
    }
    
    var output: RTSPScreenViewOutput!
    
    private lazy var collectionView = makeCollectionView()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: MainScreenViewInput
    func setupInitialState() {
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension RTSPScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        Cameras.routes.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
    }
}

private
extension RTSPScreenViewController {
    func makeCollectionView() -> UICollectionView {
        let collection = UICollectionView()
        
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }
}
