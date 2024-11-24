import UIKit

class LoginView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        addStackView()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var idTitleLabel = makeTitleTextLabel("이메일 주소")
    public lazy var idTextField = makeTextField("ex ) harryhyunbin@naver.com")
    
    private lazy var pwdTitleLabel = makeTitleTextLabel("비밀번호")
    
    public lazy var pwdTextField = makeTextField("비밀번호를 입력해주세요")
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo.pdf")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    //로그인 버튼 어차피 나중에 또 쓸꺼니까 하나의 로그인 버튼 폼을 만들기
    public lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        btn.setTitleColor(UIColor.white,for: .normal)
        btn.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1 )
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    // 카카오 로그인 버튼
    public lazy var kakaoBtn: UIButton = makeSocialBtn(image: "kakao.png", title:"카카오로 로그인")
    private lazy var appleBtn: UIButton = makeSocialBtn(image: "apple.png", title: "APPlE로 로그인")
    private lazy var idStackView: UIStackView = makeStackView(spacing : 8)
    private lazy var pwdStackView: UIStackView = makeStackView(spacing: 8)

     private lazy var topUserLoginStackView: UIStackView = makeStackView(spacing: 17)
    private lazy var bottomSocialStackView: UIStackView = makeStackView(spacing: 22)
    
    // 버튼 타이틀 텍스트 스타일 지정
    private lazy var attributeContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    private lazy var placeholderContainer: [NSAttributedString.Key: Any] = {
        var value = [NSAttributedString.Key:Any]()
        value[.foregroundColor] = UIColor.gray
        value[.font] = UIFont.systemFont(ofSize: 12)
        return value
    }()
    
    // 중복되는 부분 UItextlabel 함수로 만들기
    private func makeTitleTextLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:12,weight : .regular)
        label.textColor = UIColor.black
        label.text = text
        return label
    }
    //MARK: - Function
    // 아이디 비밀번호 넣을 텍스트 필드 생성
    // UITextField 객체 생성해서 리턴하기
    //
    private func makeTextField(_ placeholder: String) -> UITextField{
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderContainer)
        field.textColor = .black
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
                field.leftViewMode = .always
                field.layer.borderColor =  UIColor(red: 0.635, green: 0.635, blue: 0.635, alpha: 1).cgColor
                field.clipsToBounds = true
                field.layer.cornerRadius = 15
                field.layer.borderWidth = 1
                field.layer.borderColor = UIColor.gray.cgColor
                return field
    }
    //소셜 uibutton 생성하기
    // 로고 이미지 이름이랑 타이틀 받아서 uibutton 리턴하기
    private func makeSocialBtn(image: String, title: String) -> UIButton {
            let btn = UIButton()
            var configuration = UIButton.Configuration.plain()
            
            configuration.image = UIImage(named: image)
            configuration.imagePlacement = .leading
            configuration.imagePadding = 69
            
            configuration.attributedTitle = AttributedString(title, attributes: attributeContainer)
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 17, bottom: 13, trailing: 102)
            btn.configuration = configuration
            
            btn.clipsToBounds = true
            btn.layer.cornerRadius = 10
            btn.layer.borderColor = UIColor.gray.cgColor
            btn.layer.borderWidth = 1
            
            return btn
        }
    // 스택뷰도 만들기
    // 간격을 파라미터로 받아서 스택뷰 리턴하기
    private func makeStackView(spacing: CGFloat) -> UIStackView {
           let stackView = UIStackView()
           stackView.axis = .vertical
           stackView.spacing = spacing
           stackView.distribution = .equalSpacing
           return stackView
       }
    // 스택뷰 내부의 컴포넌트 함수
    private func addStackView() {
           [idTitleLabel, idTextField].forEach{ idStackView.addArrangedSubview($0) }
           [pwdTitleLabel, pwdTextField].forEach{ pwdStackView.addArrangedSubview($0) }
           [idStackView, pwdStackView, loginBtn].forEach{ topUserLoginStackView.addArrangedSubview($0) }
           [kakaoBtn, appleBtn].forEach{ bottomSocialStackView.addArrangedSubview($0) }
       }
    
    private func addComponents() {
           [logoImageView, topUserLoginStackView, bottomSocialStackView].forEach{ self.addSubview($0)}
       }
    // 오토레이아웃 지정하는 부분
    private func constraints() {
           
           idTextField.snp.makeConstraints {
               $0.height.equalTo(34)
           }
           
           pwdTextField.snp.makeConstraints {
               $0.height.equalTo(34)
           }
           
           loginBtn.snp.makeConstraints {
               $0.height.equalTo(38)
           }
           
           logoImageView.snp.makeConstraints {
               $0.top.equalToSuperview().offset(126)
               $0.left.equalToSuperview().offset(53)
               $0.right.equalToSuperview().offset(-53)
           }
           
           topUserLoginStackView.snp.makeConstraints {
               $0.top.equalTo(logoImageView.snp.bottom).offset(87)
               $0.left.equalToSuperview().offset(45)
               $0.right.equalToSuperview().offset(-45)
           }
           
           bottomSocialStackView.snp.makeConstraints {
               $0.left.equalToSuperview().offset(47.5)
               $0.right.equalToSuperview().offset(-47.5)
               $0.bottom.equalToSuperview().offset(-189)
           }
       }
}

