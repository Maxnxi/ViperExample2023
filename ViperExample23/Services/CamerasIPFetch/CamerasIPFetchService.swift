//
//  CamerasIPFetchService.swift
//  ViperExample23
//
//  Created by Ponomarev Maksim on 11/11/2566 BE.
//

import Foundation

enum NetworkError: Error {
    case noCamerasIPs
}


protocol CamerasIPFetchService {
    func fetchCamerasIPs(completion: @escaping((Result<[String], Error>) -> ()))
    
}


class CamerasIPFetchServiceImp: CamerasIPFetchService {
    
    enum Cameras {
        static let routes4: [String] = [
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/"
            ]
        
        static let routesMany: [String] = [
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
            
            "rtsp://178.141.83.23:60555/ajUc3JQx_s/",
            "rtsp://178.141.83.23:60555/Rrxy9uhI_s/",
            "rtsp://178.141.83.23:60555/KZNvfCCS_s/",
            "rtsp://admin:12345@217.9.151.201:555/wwxFTFxX_s/",
        ]
    }
    
    func fetchCamerasIPs(completion: @escaping((Result<[String], Error>) -> ())) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            if !Cameras.routesMany.isEmpty {
                completion(.success(Cameras.routesMany))
            } else {
                completion(.failure(NetworkError.noCamerasIPs))
            }
        }
    }
}
