extension MessagesVC: MessageView {
    
    // MARK: - Setting up Presenter
    func setupPresenter() {
        presenter = MessagePresenter(delegate: self)
    }
    
    // MARK: - Reload Msgs TableView action
    func reloadMsgs() {
        self.msgsTableView.reloadData()
        self.msgsTableView.scrollToBottom()
        self.setupPusher(channelID: presenter.getChatID())
        self.noDataToDisplayMsg(tableview: self.msgsTableView, tableViewDataArrCount: presenter.getItemsCount())
    }
    
    // MARK: - Send Msg Method
    func sendMsgSuccessfully() {
        self.msgContentTxtField.endEditing(true)
        self.msgContentTxtField.text = ""
        self.msgsTableView.reloadData()
    }
    
}
