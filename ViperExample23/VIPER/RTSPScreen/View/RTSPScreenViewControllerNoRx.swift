////
////  RTSPScreenViewController.swift
////  ViperExample23
////
////  Created by Maksim Ponomarev on 10/11/2023.
////  Copyright © 2023 Max. All rights reserved.
////
//
//// MARK: - NO RxSwift
//
//import UIKit
//
//class RTSPScreenViewController: UIViewController {
//    
//    var output: RTSPScreenViewOutput?
//        
//    private lazy var collectionView = makeCollectionView()
//    
//    private var dataSource: [String] = [] {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
//    
//    // MARK: Life cycle
//    override func loadView() {
//        super.loadView()
//        view.backgroundColor = UIColor().randomColor
//        commonInit()
//        setupLayout()
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        output?.viewIsReady()
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        view.backgroundColor = UIColor().randomColor
//    }
//    
//}
//
// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
//extension RTSPScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(
//        _ collectionView: UICollectionView,
//        numberOfItemsInSection section: Int
//    ) -> Int {
//       dataSource.count
//    }
//    
//    func collectionView(
//        _ collectionView: UICollectionView,
//        cellForItemAt indexPath: IndexPath
//    ) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: CameraCell.reuseIdentifier,
//            for: indexPath
//        ) as? CameraCell else {
//            return UICollectionViewCell()
//        }
//
//        guard let viewModel = prepareViewModel(indexPath: indexPath) else { return UICollectionViewCell() }
//        cell.configureView(viewModel: viewModel)
//
//        return cell
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let visibleCells = collectionView.visibleCells
//        for cell in visibleCells {
//            guard let cell = cell as? CameraCell else { return }
//            let convertedFrame = collectionView.convert(
//                cell.frame,
//                to: self.view
//            )
//            let yCenterOfScreen = UIScreen.main.bounds.midY
//
//            if convertedFrame.minY < yCenterOfScreen && convertedFrame.maxY > yCenterOfScreen {
//                cell.playVLCPlayer()
//            }
//        }
//    }
//}
//
//// MARK: - UICollectionViewDelegateFlowLayout
//extension RTSPScreenViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAt indexPath: IndexPath
//    ) -> CGSize {
//        let size = CGSizeMake(
//            collectionView.bounds.width,
//            200
//        )
//        return size
//    }
//}
//
//private
//extension RTSPScreenViewController {
//    func makeCollectionView() -> UICollectionView {
//        let flowLayout = UICollectionViewFlowLayout.init()
//        flowLayout.scrollDirection = .vertical
//        flowLayout.minimumLineSpacing = 50
//        flowLayout.minimumInteritemSpacing = 50
//        
//        let collection = UICollectionView(
//            frame: .zero,
//            collectionViewLayout: flowLayout
//        )
//        collection.isPagingEnabled = false
//        
//        collection.dataSource = self
//        collection.delegate = self
//        collection.backgroundColor = .clear
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        return collection
//    }
//    
//    func commonInit() {
//        registerCells()
//    }
//    
//    func registerCells() {
//        collectionView.register(
//            CameraCell.self,
//            forCellWithReuseIdentifier: CameraCell.reuseIdentifier
//        )
//    }
//    
//    func prepareViewModel(indexPath: IndexPath) -> CameraCellViewModel? {
//        guard let url = URL(string: dataSource[indexPath.row]) else {
//            return nil
//        }
//        let playerVM = PlayerViewModel(
//            url: url,
//            frame: CGRect(
//                origin: .zero,
//                size: .zero
//            )
//        )
//        let viewModel = CameraCellViewModel(
//            index: indexPath.row,
//            playerVM: playerVM
//        )
//        return viewModel
//    }
//    
//    func setupLayout() {
//        view.addSubview(collectionView)
//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeTopAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.safeLeadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor)
//        ])
//    }
//}
//
//// MARK: MainScreenViewInput
//extension RTSPScreenViewController: RTSPScreenViewInput {
//    func setupInitialState() {
//        
//    }
//    
//    func updateViewWithCamerasIps(ips: [String]) {
//        self.dataSource = ips
//    }
//    
//}
