import SwiftUI

struct SignUpView: View {
    @State private var idText: String = ""
    @State private var passwordText: String = ""
    @State private var confirmPasswordText: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // 상단 타이틀
            Text("회원가입")
                .font(.custom("Pretendard", size: 15).weight(.semibold))
                .padding(.top, 20)
                .padding(.bottom, 40)
            
            // 메인 헤드라인 및 안내 문구
            VStack(alignment: .leading, spacing: 12) {
                Text("당신의 고양이를 만나보세요")
                    .font(.custom("Pretendard", size: 24).weight(.semibold))
                    .foregroundColor(.black)
                
                Text("‘냥테크’ 속 반려묘와 함께\n즐거운 소비 관리를 시작해볼까요?")
                    .font(.custom("Pretendard", size: 14))
                    .foregroundColor(.subText)
                    .lineSpacing(4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 36)
            
            // 입력 폼 AREA
            VStack(spacing: 20) {
                // 아이디 입력 영역 (+ 중복 확인 버튼)
                VStack(alignment: .leading, spacing: 6) {
                    Text("아이디")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.black)
                    
                    HStack(alignment: .bottom, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            TextField("", text: $idText)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.borderLine)
                        }
                        
                        Button(action: {
                            // 중복 확인 동작
                        }) {
                            Text("중복 확인")
                                .font(.custom("Pretendard", size: 12).weight(.semibold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color.duplicateCheckBg)
                                .cornerRadius(20)
                        }
                    }
                    
                    Text("영문, 숫자, 특수기호 ‘_’ 사용 가능, 4~20자")
                        .font(.custom("Pretendard", size: 11))
                        .foregroundColor(.subText)
                        .padding(.top, 2)
                }
                
                // 비밀번호 입력
                VStack(alignment: .leading, spacing: 6) {
                    Text("비밀번호")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.black)
                    
                    SecureField("", text: $passwordText)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.borderLine)
                }
                
                // 비밀번호 확인 입력
                VStack(alignment: .leading, spacing: 6) {
                    Text("비밀번호 확인")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.black)
                    
                    SecureField("", text: $confirmPasswordText)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.borderLine)
                }
            }
            
            Spacer()
            
            // 하단 버튼 AREA
            VStack(spacing: 12) {
                // 계정 생성 버튼
                Button(action: {
                    // 계정 생성 동작
                }) {
                    Text("계정 생성")
                        .font(.custom("Pretendard", size: 18).weight(.bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.primaryBrown)
                        .cornerRadius(30)
                }
                
                // Google 계정으로 시작 버튼
                Button(action: {
                    // Google 회원가입 동작
                }) {
                    HStack(spacing: 12) {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Google 계정으로 시작")
                            .font(.custom("Pretendard", size: 16).weight(.semibold))
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.googleButtonBg)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(red: 0.83, green: 0.82, blue: 0.80), lineWidth: 1)
                    )
                }
            }
            .padding(.bottom, 24)
        }
        .padding(.horizontal, 24)
        .background(Color.appBackground.ignoresSafeArea())
    }
}

#Preview {
    SignUpView()
}
