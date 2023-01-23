//
//  UIImageExtension.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 20/01/23.
//

import UIKit

extension UIImageView {

        func getImagefromStringURL(_ URLString: String, placeHolder: UIImage?) {

        self.image = nil
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in

                if error != nil {
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                       
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
