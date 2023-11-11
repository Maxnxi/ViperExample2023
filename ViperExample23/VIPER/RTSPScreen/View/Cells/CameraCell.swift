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
    private lazy var cameraNumberLabel = makeCameraNumberLabel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playerView.mediaPlayer?.stop()
    }
    
    func configureView(viewModel: CameraCellViewModel?) {
        guard let viewModel else {
            backgroundColor = .red
            return
        }
        playerView.configureView(model: viewModel.playerVM)
        setupLayout(size: viewModel.playerVM.frame.size)
        cameraNumberLabel.text = "Camera # " + "\(viewModel.index)"
    }
    
    func playVLCPlayer() {
        playerView.mediaPlayer?.play()
    }
    
}

private
extension CameraCell {
    func makePlayerView() -> PlayerView {
        let view = PlayerView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func makeCameraNumberLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setupLayout(size: CGSize) {
        contentView.addSubview(playerView)
        contentView.addSubview(cameraNumberLabel)
        
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: contentView.safeTopAnchor, constant: 8),
            playerView.bottomAnchor.constraint(equalTo: contentView.safeBottomAnchor, constant: -8),
            playerView.leadingAnchor.constraint(equalTo: contentView.safeLeadingAnchor, constant: 8),
            playerView.trailingAnchor.constraint(equalTo: contentView.safeTrailingAnchor, constant: -8),
            
            cameraNumberLabel.bottomAnchor.constraint(equalTo: playerView.bottomAnchor, constant: -8),
            cameraNumberLabel.leadingAnchor.constraint(equalTo: playerView.leadingAnchor, constant: 8)
        ])
    }
}
