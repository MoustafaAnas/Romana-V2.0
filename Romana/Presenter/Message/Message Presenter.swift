import UIKit

// MARK: - Message Protocol
protocol MessageView: AnyObject {
    func reloadMsgs()
    func sendMsgSuccessfully()
}

// MARK: - Message Cell Protocol
protocol MessageCellView {
    func setMessage (msg: String)
    func setProfileImg (img: String)

}

// MARK: - Message Presenter
class MessagePresenter {
    
    // Create delegate Variable
    private weak var delegate: MessageView?
    
    // Create Array object from ChatItem
    var chatData: [ChatItem]?
    
    // Setup Delegate
    init(delegate: MessageView) {
        self.delegate = delegate
    }
    
    // Getting Messages API Func
    func getMessagesApi(Url: String) {

        API.chatCodeNetwork(Url: Url) { error, success, data  in
            if success {
            self.chatData = data.data.items.reversed()
            self.delegate?.reloadMsgs()
            //self.cellItems?.data.paginate = data.data.paginate
                }
            }
        }
    
    // Sending Messages API Func
    func sendMessagesApi(chatID: Int, Msg: String)  {
    API.sendMsgCodeNetwork(Url: "\(URLs.chat_Url)/\(chatID)", msg: Msg) { error, success in
        if success {
            self.delegate?.sendMsgSuccessfully()
            }
        }
    }
    
    // Configure Cell
    func configureCell(cell: MessageCellView, for index: Int) {
        guard let Item = chatData?[index] else {return}
        cell.setMessage(msg: Item.message ?? "")
        cell.setProfileImg(img: Item.user?.image ?? "")
    }
    
    // Get Count of Messages
    func getItemsCount() -> Int {
        return chatData?.count ?? 0
    }
    
    // Get Chat ID
    func getChatID() -> Int {
        return chatData?[0].chatID ?? 0
    }
    
    // Get Message Sender ID
    func getUserID(index: Int) -> Int {
        return chatData?[index].user?.id ?? 0
    }
}




