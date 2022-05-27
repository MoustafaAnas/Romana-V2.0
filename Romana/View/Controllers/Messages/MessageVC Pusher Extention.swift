import UIKit
import PusherSwift

extension MessagesVC: PusherDelegate {
    
    // MARK: - Sync Chat by Using Pusher
    
    func setupPusher(channelID : Int){
        
         let optionsWithEndpoint = PusherClientOptions(
             host : .cluster("eu"))
        
         pusher = Pusher(key: "3478a80ff3abcb791bd1", options: optionsWithEndpoint)
        
         let myChannel = pusher.subscribe("chat-\(channelID)")
        
         myChannel.bind(eventName: "NewMessageEvent" , eventCallback: { (data: PusherEvent) -> Void in
             
             if let data = self.convertToDictionary(text: data.data ?? "") {
                 print(data)
                 guard let messageCollection : [String : AnyObject] = data["message"] as? [String : AnyObject] else{return}
                 guard let user = messageCollection["user"] else { return  }
                 guard let userID : Int = user["id"] as? Int else{return}
                 guard let body : String = messageCollection["message"] as? String else{return}
                 guard let type : String = messageCollection["type"] as? String else{return}
                 let attachment : String = messageCollection["attachment"] as? String ?? ""
                 
                 let item =  ChatItem(id: userID,
                                        chatID: channelID , user: user as? UserDataClass ,
                                         message: body, type: nil,
                                         attachment: attachment,
                                         thumbnail: "", pucherType: type)
              
               
               
//               self.chatData?.append(item)
//                 let indexPath = IndexPath(row: (self.chatData?.count ?? 0)-1, section: 0)
//                 self.msgsTableView.insertRows(at: [indexPath], with: .bottom)
//                 self.msgsTableView.scrollToRow(at: indexPath, at: .none, animated: true)
                 
               
             self.msgsTableView.reloadData()
             self.msgsTableView.scrollToBottom()
             print("allMessages: \(item)")
             }
         })
         
         pusher.delegate = self
         pusher.connect()
     }
    
    // MARK: - Convertiong String to Dictionary
    func convertToDictionary(text: String) -> [String: Any]? {
            if let data = text.data(using: .utf8) {
                do {
                    return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch {
                    print(error.localizedDescription)
                }
            }
            return nil
        }
    
    // MARK: - Check if Subscribtion successfuly
    func failedToSubscribeToChannel(name: String, response: URLResponse?, data: String?, error: NSError?) {
            print(name)
            print(response ?? "nil")
            print(data ?? "nil")
            print(error?.localizedDescription ?? "nil")
        }

    // MARK: - Subscribed Channel
        func subscribedToChannel(name: String) {
            print("subscribed to : (name)")
        }
    
}



