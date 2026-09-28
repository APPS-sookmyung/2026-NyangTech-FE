import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // 상단 타이틀
                Text("설정")
                    .font(.custom("Pretendard", size: 20).weight(.semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 24)
                    .padding(.bottom, 32)

                // 프로필 섹션
                VStack(spacing: 16) {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.avatarPlaceholder)
                            .frame(width: 96, height: 96)

                        Button(action: {
                            // 프로필 사진 편집 동작
                        }) {
                            Image("settings_icon_edit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 13.5, height: 13.5)
                                .padding(6)
                                .background(Color.black)
                                .clipShape(Circle())
                        }
                        .offset(x: 7.5, y: 5.2)
                    }

                    VStack(spacing: 4) {
                        Text("김집사")
                            .font(.custom("Pretendard", size: 24).weight(.semibold))
                            .foregroundColor(.settingsTitleText)

                        Text("butler_kim@meow.com")
                            .font(.custom("Pretendard", size: 15))
                            .foregroundColor(.subText)
                    }
                }
                .padding(.bottom, 32)

                // Bento Settings Grid
                VStack(spacing: 20) {
                    SettingsCategorySection(title: "Profile") {
                        SettingsRow(iconName: "settings_icon_profile", iconWidth: 22, iconHeight: 21, title: "프로필 설정", titleFontSize: 15)
                        SettingsRow(iconName: "settings_icon_pet", iconWidth: 24, iconHeight: 20, title: "반려묘 정보 관리", titleFontSize: 15, showDivider: false)
                    }

                    SettingsCategorySection(title: "Preference") {
                        SettingsRow(iconName: "settings_icon_bell", iconWidth: 25, iconHeight: 20, title: "알림 설정", titleFontSize: 16)
                        SettingsRow(iconName: "settings_icon_wallet", iconWidth: 23, iconHeight: 20, title: "예산 목표 설정", titleFontSize: 16)
                        SettingsRow(iconName: "settings_icon_lock", iconWidth: 23, iconHeight: 21, title: "보안 및 잠금", titleFontSize: 16, showDivider: false)
                    }

                    SettingsCategorySection(title: "Support") {
                        SettingsRow(iconName: "settings_icon_info", iconWidth: 28, iconHeight: 20, title: "기타", titleFontSize: 16)
                        SettingsRow(iconName: "settings_icon_question", iconWidth: 28, iconHeight: 20, title: "고객 센터", titleFontSize: 16, showDivider: false)
                    }

                    // 로그아웃 버튼
                    Button(action: {
                        // 로그아웃 동작
                    }) {
                        Text("로그아웃")
                            .font(.custom("Pretendard", size: 20).weight(.semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.primaryBrown)
                            .cornerRadius(30)
                    }
                    .padding(.top, 12)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
}

// 설정 카테고리 섹션 (라벨 + 흰색 카드)
private struct SettingsCategorySection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.custom("Pretendard", size: 12))
                .foregroundColor(.subText)
                .tracking(1)
                .padding(.horizontal, 4)

            VStack(spacing: 0) {
                content
            }
            .background(Color.white)
            .cornerRadius(17)
        }
    }
}

// 설정 카드 내부의 개별 행 (아이콘 + 라벨 + 화살표)
private struct SettingsRow: View {
    let iconName: String
    let iconWidth: CGFloat
    let iconHeight: CGFloat
    let title: String
    let titleFontSize: CGFloat
    var showDivider: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                // 설정 항목 이동 동작
            }) {
                HStack(spacing: 12) {
                    Image(iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconWidth, height: iconHeight)

                    Text(title)
                        .font(.custom("Pretendard", size: titleFontSize))
                        .foregroundColor(.settingsTitleText)

                    Spacer()

                    Image("settings_icon_chevron")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.4, height: 12)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }

            if showDivider {
                Rectangle()
                    .fill(Color.settingsCardDivider)
                    .frame(height: 1)
            }
        }
    }
}

#Preview {
    SettingsView()
}
