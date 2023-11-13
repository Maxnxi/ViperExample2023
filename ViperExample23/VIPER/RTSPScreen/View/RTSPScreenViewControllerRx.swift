//
//  RTSPScreenViewController.swift
//  ViperExample23
//
//  Created by Maksim Ponomarev on 10/11/2023.
//  Copyright © 2023 Max. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RTSPScreenViewController: UIViewController {
    
    var output: RTSPScreenViewOutput?
    
    private lazy var collectionView = makeCollectionView()
    
    private let dataSource = PublishSubject<[String]>()
    private let disposeBag = DisposeBag()
    
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
        setupCollectionRx()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = UIColor().randomColor
    }
    
    func setupCollectionRx() {
        dataSource.bind(to: collectionView.rx.items(cellIdentifier: CameraCell.reuseIdentifier)) { (row, urlString: String, cell: CameraCell) in
            let viewModel = self.prepareViewModel(
                urlString: urlString,
                row: row
            )
            cell.configureView(viewModel: viewModel)
        }.disposed(by: disposeBag)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RTSPScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let size = CGSizeMake(
            collectionView.bounds.width,
            200
        )
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
        collection.isPagingEnabled = false
        
        collection.delegate = self
        collection.backgroundColor = .clear
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
    
    func prepareViewModel(
        urlString: String,
        row: Int
    ) -> CameraCellViewModel? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        let playerVM = PlayerViewModel(
            url: url,
            frame: CGRect(
                origin: .zero,
                size: .zero
            )
        )
        let viewModel = CameraCellViewModel(
            index: row,
            playerVM: playerVM
        )
        return viewModel
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

// MARK: MainScreenViewInput
extension RTSPScreenViewController: RTSPScreenViewInput {
    func setupInitialState() {
        
    }
    
    func updateViewWithCamerasIps(ips: [String]) {
        dataSource.onNext(ips)
    }
}
