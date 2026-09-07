import SwiftUI

struct LoginView: View {
    @State private var idText: String = ""
    @State private var passwordText: String = ""

    var body: some View {
        VStack(spacing: 0) {
            // 상단 타이틀
            Text("로그인")
                .font(.custom("Pretendard", size: 15).weight(.semibold))
                .foregroundColor(.black)
                .padding(.top, 20)
                .padding(.bottom, 44)

            // 메인 헤드라인 및 안내 문구
            VStack(alignment: .leading, spacing: 24) {
                Text("고양이와 함께 소비 생활을 관리해요")
                    .font(.custom("Pretendard", size: 25).weight(.semibold))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)

                Text("고양이가 회원님의 알뜰한 생활을 돕기 위해\n기다리고 있어요.")
                    .font(.custom("Pretendard", size: 15))
                    .foregroundColor(.subText)
                    .lineSpacing(5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 52)

            // 입력 폼 AREA
            VStack(spacing: 40) {
                // 아이디 입력
                VStack(alignment: .leading, spacing: 8) {
                    Text("아이디")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.black)

                    TextField("", text: $idText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.borderLine)
                }

                // 비밀번호 입력
                VStack(alignment: .leading, spacing: 8) {
                    Text("비밀번호")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.black)

                    SecureField("", text: $passwordText)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.borderLine)
                }
            }
            .padding(.bottom, 56)

            // 버튼 AREA
            VStack(spacing: 16) {
                // 로그인 버튼
                Button(action: {
                    // 로그인 동작
                }) {
                    Text("로그인")
                        .font(.custom("Pretendard", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 64)
                        .background(Color.primaryBrown)
                        .cornerRadius(40)
                }

                // Google 계정으로 로그인 버튼
                Button(action: {
                    // Google 로그인 동작
                }) {
                    HStack(spacing: 12) {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)

                        Text("Google 계정으로 로그인")
                            .font(.custom("Pretendard", size: 20).weight(.semibold))
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .background(Color.googleButtonBg)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(red: 0.83, green: 0.82, blue: 0.80), lineWidth: 1)
                    )
                }
            }

            Spacer()

            // 하단 계정 정보 / 회원가입 링크
            VStack(spacing: 12) {
                Button(action: {
                    // 계정 정보 찾기 동작
                }) {
                    Text("계정 정보 찾기")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.black)
                }

                HStack(spacing: 6) {
                    Text("계정이 없으신가요?")
                        .font(.custom("Pretendard", size: 12))
                        .foregroundColor(.subText)

                    Button(action: {
                        // 회원가입 화면 전환
                    }) {
                        Text("회원가입하기")
                            .font(.custom("Pretendard", size: 12).weight(.semibold))
                            .underline()
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.bottom, 37)
        }
        .padding(.horizontal, 24)
        .background(Color.appBackground.ignoresSafeArea())
    }
}

#Preview {
    LoginView()
}
