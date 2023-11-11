//
//  RTSPScreenViewController.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import UIKit

class RTSPScreenViewController: UIViewController, RTSPScreenViewInput {
    
    enum Cameras {
        static let routes: [String] = [
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/"
        ]
    }
    
    var output: RTSPScreenViewOutput?
    
    private lazy var collectionView = makeCollectionView()

    // MARK: Life cycle
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor().randomColor
        commonInit()
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = UIColor().randomColor
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
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CameraCell.reuseIdentifier,
            for: indexPath
        ) as? CameraCell else {
            return UICollectionViewCell()
        }
        
        guard let url = URL(string: Cameras.routes[indexPath.row]) else {
            return UICollectionViewCell()
        }
        let playerVM = PlayerViewModel(
            url: url,
            frame: CGRect(
                origin: .zero,
                size: CGSize(width: 200, height: 200)
            )
        )
        let viewModel = CameraCellViewModel(
            index: indexPath.row,
            playerVM: playerVM
        )
        cell.configureView(viewModel: viewModel)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RTSPScreenViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        insetForSectionAt section: Int
//    ) -> UIEdgeInsets {
//        return
//    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let size = CGSizeMake(collectionView.bounds.width, 200)
        
        return size
    }
}

private
extension RTSPScreenViewController {
    func makeCollectionView() -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 50
        flowLayout.minimumInteritemSpacing = 50
        
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        collection.isPagingEnabled = true
        
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }
    
    func commonInit() {
        registerCells()
    }
    
    func registerCells() {
        collectionView.register(
            CameraCell.self,
            forCellWithReuseIdentifier: CameraCell.reuseIdentifier
        )
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor)
        ])
    }
}
