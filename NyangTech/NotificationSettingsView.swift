import SwiftUI

struct NotificationSettingsView: View {
    @State private var isReminderOn: Bool = false
    @State private var isBudgetAlertOn: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            // 상단 타이틀
            HStack(spacing: 10) {
                Button(action: {
                    // 뒤로가기 동작
                }) {
                    Image("settings_icon_chevron")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 7.4, height: 12)
                        .scaleEffect(x: -1, y: 1)
                }

                Text("알림 설정")
                    .font(.custom("Pretendard", size: 20).weight(.semibold))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 16)
            .padding(.bottom, 32)

            // 알림 목록 카드
            VStack(spacing: 0) {
                HStack {
                    Text("소비 기록 리마인더")
                        .font(.custom("Pretendard", size: 15))
                        .foregroundColor(.black)

                    Spacer()

                    NotificationToggle(isOn: $isReminderOn)
                }
                .padding(.horizontal, 16)
                .frame(height: 77)

                DashedLine()
                    .stroke(Color(red: 0.49, green: 0.46, blue: 0.46).opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [4, 3]))
                    .frame(height: 1)

                Button(action: {
                    // 수신 시간 설정 이동 동작
                }) {
                    HStack {
                        Text("수신 시간")
                            .font(.custom("Pretendard", size: 15))
                            .foregroundColor(.black)

                        Spacer()

                        Image("settings_icon_chevron")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 7.4, height: 12)
                    }
                    .padding(.horizontal, 16)
                    .frame(height: 77)
                }

                DashedLine()
                    .stroke(Color(red: 0.49, green: 0.46, blue: 0.46).opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [4, 3]))
                    .frame(height: 1)

                HStack {
                    Text("예산 초과 알림")
                        .font(.custom("Pretendard", size: 15))
                        .foregroundColor(.black)

                    Spacer()

                    NotificationToggle(isOn: $isBudgetAlertOn)
                }
                .padding(.horizontal, 16)
                .frame(height: 77)
            }
            .background(Color.white)
            .cornerRadius(17)

            Spacer()
        }
        .padding(.horizontal, 24)
        .background(Color.appBackground.ignoresSafeArea())
    }
}

// 카드 행 사이의 점선 구분선
private struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

// 알림 on/off 토글 스위치
private struct NotificationToggle: View {
    @Binding var isOn: Bool

    var body: some View {
        Button(action: { isOn.toggle() }) {
            ZStack(alignment: isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isOn ? Color.primaryBrown : Color(red: 0.83, green: 0.82, blue: 0.80))
                    .frame(width: 44, height: 24)

                Circle()
                    .fill(Color.white)
                    .frame(width: 18, height: 18)
                    .padding(3)
                    .shadow(color: .black.opacity(0.15), radius: 1, x: 0, y: 1)
            }
        }
        .buttonStyle(.plain)
        .animation(.easeInOut(duration: 0.15), value: isOn)
    }
}

#Preview {
    NotificationSettingsView()
}
