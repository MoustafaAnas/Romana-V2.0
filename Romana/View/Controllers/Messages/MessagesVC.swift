import UIKit
import AVFoundation
import PusherSwift

class MessagesVC: UIViewController {
    
    @IBOutlet weak var msgsTableView: UITableView!
    @IBOutlet weak var msgContentTxtField: UITextField!
    @IBOutlet weak var btnContainerView: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBOutlet weak var sendBtnWidthConst: NSLayoutConstraint!
    @IBOutlet weak var containerWidthConst: NSLayoutConstraint!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    @IBOutlet weak var recoredViewBottomConst: NSLayoutConstraint!
    @IBOutlet weak var cencelRecoredBtn: UIButton!
    @IBOutlet weak var recoredView: UIView!
    
    @IBOutlet var recordingTimeLabel: UILabel!
    @IBOutlet var recordBtn: UIButton!
    @IBOutlet var playBtn: UIButton!
    @IBOutlet weak var sendRecordBtn: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer : AVAudioPlayer!
    var meterTimer:Timer!
    var isAudioRecordingGranted: Bool!
    var isRecording = false
    var isPlaying = false
    
    var presenter: MessagePresenter!
    var chatID: Int?
    var pusher : Pusher!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Chat"
        navigationItem.backButtonTitle = ""

        checkRecordPermission()
        
        msgContentTxtField.setPadding()
        
        setupTableView()
        
        setupPresenter()
        
        setupTextField()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        presenter.getMessagesApi(Url: URLs.chat_Url)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(true)
          NotificationCenter.default.removeObserver(self)
      }
    
    // MARK: - Send Message Button
    @IBAction func sendBtnPressed(_ sender: Any) {
        
        if msgContentTxtField.text != "" {
            presenter.sendMessagesApi(chatID: presenter.getChatID(), Msg: msgContentTxtField.text!)
        }
        else {
            print("no msg")
            self.msgContentTxtField.endEditing(true)
        }
    }
    
    // MARK: - Click Media Button
    @IBAction func sendMediaBtnPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            
            if(isRecording)
              {
                finishAudioRecording(success: true)
                recordBtn.setImage(UIImage(systemName: "mic.fill"), for: .normal)
                playBtn.isEnabled = true
                isRecording = false
                sendRecordBtn.isEnabled = true
                print("Stop Recording")
              }
              else
              {
                  setupRecorder()
                  cancelRecoredView(hideView: false)
                  
                  audioRecorder.record()
                  meterTimer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector:#selector(self.updateAudioMeter(timer:)), userInfo:nil, repeats:true)
                  recordBtn.setImage(UIImage(systemName: "stop.fill"), for: .normal)
                  playBtn.isEnabled = false
                  sendRecordBtn.isEnabled = false
                  isRecording = true
              }
          
            
            print("start rec")
            }
          else {
            getPhoto(type: .photoLibrary)
        }
    }
    
    // MARK: - Send Recored Button
    @IBAction func sendRecoredBtnPressed(_ sender: Any) {
        cancelRecoredView(hideView: true)
    }
    
    // MARK: - Play Audio Button
    @IBAction func playBtn(_ sender: Any) {
        if(isPlaying)
           {
               audioPlayer.stop()
               recordBtn.isEnabled = true
               playBtn.setImage(UIImage(systemName: "play.fill"), for: .normal)
               isPlaying = false
               print("play rec")
           }
           else
           {
               if FileManager.default.fileExists(atPath: getFileUrl().path)
               {
                 recordBtn.isEnabled = false
                   playBtn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                   prepare_play()
                   audioPlayer.play()
                   isPlaying = true
               }
               else
               {
                   print("Audio file is missing.")
               }
           }
        
    }
    
    // MARK: - Cancel Recored Button
    @IBAction func cancelRecordBtnPressed(_ sender: Any) {
        cancelRecoredView(hideView: true)
        if(isRecording)
          {
            finishAudioRecording(success: true)
            recordBtn.setImage(UIImage(systemName: "mic.fill"), for: .normal)
            isRecording = false
            print("Cancel Recording")
          }
    }
    
    // Close RecoredView Action
    func cancelRecoredView(hideView: Bool) {
        if hideView {
            UIView.animate(withDuration: 0.7) {
                self.recoredViewBottomConst.constant = -40
                self.recoredView.alpha = 0
                self.cencelRecoredBtn.alpha = 0
                self.view.layoutIfNeeded()
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.recoredViewBottomConst.constant = 40
                self.cencelRecoredBtn.alpha = 1
                self.recoredView.alpha = 1
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    // MARK: - Action After Showing Keyboard
    @objc func keyboardWillShow(_ notification: Notification) {
    let keyboardHeight = getKeyboardHeight(notification: notification)
        print("\(keyboardHeight)")
        
        UIView.animate(withDuration: 0.5) {
            self.bottomConst.constant = keyboardHeight - 10
            self.view.layoutIfNeeded()
        }
       
    }
    
    // MARK: - Getting Keyboard Height
    private func getKeyboardHeight(notification: Notification) -> CGFloat {
        guard let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else {return 0}
        return keyboardHeight
    }
    

    
}
