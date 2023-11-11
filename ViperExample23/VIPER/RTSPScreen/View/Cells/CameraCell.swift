//
//  CameraCell.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 10/11/2566 BE.
//

import UIKit


struct CameraCellViewModel {
    let index: Int
    let playerVM: PlayerViewModel
}

final
class CameraCell: UICollectionViewCell {
    
    private lazy var playerView = makePlayerView()
    
    func configureView(viewModel: CameraCellViewModel) {
        playerView.configureView(model: viewModel.playerVM)
        setupLayout(size: viewModel.playerVM.frame.size)
    }
    
}

private
extension CameraCell {
    func makePlayerView() -> PlayerView {
        let view = PlayerView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func setupLayout(size: CGSize) {
        contentView.addSubview(playerView)
        
        NSLayoutConstraint.activate([
//            widthAnchor.constraint(equalToConstant: size.width),
//            heightAnchor.constraint(equalToConstant: size.height),
            
            playerView.topAnchor.constraint(equalTo: contentView.safeTopAnchor, constant: 8),
            playerView.bottomAnchor.constraint(equalTo: contentView.safeBottomAnchor, constant: -8),
            playerView.leadingAnchor.constraint(equalTo: contentView.safeLeadingAnchor, constant: 8),
            playerView.trailingAnchor.constraint(equalTo: contentView.safeTrailingAnchor, constant: -8),
        ])
    }
}
