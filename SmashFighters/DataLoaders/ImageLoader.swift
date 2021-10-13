//
//  ImageLoader.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    private var url: String
    
    init(urlString: String, autoLoad: Bool = true) {
        self.url = urlString
        
        if autoLoad {
            load()
        }
    }
    
    func load() {
        guard let url = URL(string: self.url) else {
            print("ImageLoader: malformed URL")
            return
        }
        
        cancellable = DataLoader(url: url)
            .load()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { data in
                self.image = UIImage(data: data)
            }
    }
}
