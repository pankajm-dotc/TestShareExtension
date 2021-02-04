import UIKit
import Social
import Firebase

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        FirebaseApp.configure();
                
        let databaseRef: DatabaseReference!
        databaseRef = Database.database().reference();
                
        let objetc: [String: Any] = [
            "name": "Test",
            "value": "Test Project"
        ];
        databaseRef.child("users/posts").setValue(objetc);
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
