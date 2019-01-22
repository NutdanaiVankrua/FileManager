// References:
// - https://medium.com/@ji3g4kami/download-store-and-view-pdf-in-swift-af399373b451
// - https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/iPhoneOSKeys.html#//apple_ref/doc/uid/TP40009252-SW20
// - https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html

import UIKit

class ViewController: UIViewController {
  
  let browseDocumentButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.clipsToBounds = true
    button.setTitle("Browse File", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    return button
  }()
  
  let documentInteractionController = UIDocumentInteractionController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpDownloadButton()
  }
  
  private func setUpDownloadButton() {
    view.addSubview(browseDocumentButton)
    
    browseDocumentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    browseDocumentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    browseDocumentButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    browseDocumentButton.addTarget(self, action: #selector(openFileBrowser), for: .touchUpInside)
  }
  
}

extension ViewController {
  
  @objc func openFileBrowser() {
    let documentPickerViewController = UIDocumentPickerViewController(documentTypes: ["public.item"], in: .import)
    documentPickerViewController.delegate = self
    present(documentPickerViewController, animated: true) {}
  }
  
}

extension ViewController: UIDocumentPickerDelegate {
  
  func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
    
  }
  
}
