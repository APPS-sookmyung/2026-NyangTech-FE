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
                .foregroundColor(.black)
                .padding(.top, 20)
                .padding(.bottom, 44)

            // 메인 헤드라인 및 안내 문구
            VStack(alignment: .leading, spacing: 24) {
                Text("당신의 고양이를 만나보세요")
                    .font(.custom("Pretendard", size: 25).weight(.semibold))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)

                Text("‘냥테크’ 속 반려묘와 함께\n즐거운 소비 관리를 시작해볼까요?")
                    .font(.custom("Pretendard", size: 15))
                    .foregroundColor(.subText)
                    .lineSpacing(5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 52)

            // 입력 폼 AREA
            VStack(alignment: .leading, spacing: 40) {
                // 아이디 입력 (라벨 + 입력줄 + 중복 확인)
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .bottom, spacing: 12) {
                        Text("아이디")
                            .font(.custom("Pretendard", size: 12).weight(.semibold))
                            .foregroundColor(.black)

                        VStack(spacing: 6) {
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
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.duplicateCheckBg)
                                .cornerRadius(30)
                        }
                        .fixedSize()
                    }

                    Text("영문, 숫자, 특수기호 ‘_’ 사용 가능, 4~20자")
                        .font(.custom("Pretendard", size: 12))
                        .foregroundColor(.subText)
                        .padding(.leading, 48)
                }

                // 비밀번호 입력
                HStack(alignment: .bottom, spacing: 12) {
                    Text("비밀번호")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.black)

                    VStack(spacing: 6) {
                        SecureField("", text: $passwordText)

                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.borderLine)
                    }
                }

                // 비밀번호 확인 입력
                HStack(alignment: .bottom, spacing: 12) {
                    Text("비밀번호 확인")
                        .font(.custom("Pretendard", size: 12).weight(.semibold))
                        .foregroundColor(.black)

                    VStack(spacing: 6) {
                        SecureField("", text: $confirmPasswordText)

                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.borderLine)
                    }
                }
            }

            Spacer()

            // 하단 버튼 AREA
            VStack(spacing: 16) {
                // 계정 생성 버튼
                Button(action: {
                    // 계정 생성 동작
                }) {
                    Text("계정 생성")
                        .font(.custom("Pretendard", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 64)
                        .background(Color.primaryBrown)
                        .cornerRadius(40)
                }

                // Google 계정으로 시작 버튼
                Button(action: {
                    // Google 회원가입 동작
                }) {
                    HStack(spacing: 12) {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)

                        Text("Google 계정으로 시작")
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
            .padding(.bottom, 34)
        }
        .padding(.horizontal, 24)
        .background(Color.appBackground.ignoresSafeArea())
    }
}

#Preview {
    SignUpView()
}
