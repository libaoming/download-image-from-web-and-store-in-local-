//
//  ViewController.swift
//  Download image from web
//
//  Created by 李宝明 on 16/8/25.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bachImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFileImage()
        
        
}
    
    func loadFileImage(){
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if documentPath.count > 0 {
            
            let documentDir = documentPath[0]
            
            let restorePath = documentDir + "/bach.jpg"
            
            bachImage.image = UIImage(contentsOfFile: restorePath)
            
            
        
        }

        
    }

    func loadImage(){
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Johann_Sebastian_Bach.jpg/260px-Johann_Sebastian_Bach.jpg")
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) {
            data,response,error in
            
            if error != nil {
                print(error)
            }else {
                
                if let dataTemp = data {
                    
                    self.bachImage.image = UIImage(data: dataTemp)
                    
                    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                    
                    if documentPath.count > 0 {
                        
                        let documentDir = documentPath[0]
                        
                        let savePath = documentDir + "/bach.jpg"
                        
                        do {
                            
                            try UIImageJPEGRepresentation(self.bachImage.image!, 1)?.write(to: URL(fileURLWithPath: savePath))
                        } catch {
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                
            }
            
        }
        task.resume()
        
    }
    

}
