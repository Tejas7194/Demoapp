//
//  DetailView.swift
//  DemoApp
//
// Created by Tejas Todkar on 26/12/24.
//

import SwiftUI


struct ProfileDetailView: View {
    @Binding var model: ContentModel
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State var showContent: Bool = false
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            VStack(alignment: .leading) {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                    CardAysncImageView(viewModel: AsyncImageViewModel(imageAssest: model.image ?? ""))
                        .matchedGeometryEffect(id: model.image ?? "", in: namespace)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    if showContent {
                        if let isAccepted = model.isAccepted {
                            VStack(spacing: 8) {
                                Rectangle()
                                    .frame(height: 12)
                                    .opacity(0)
                                
                                Divider()
                                    .background(.white)
                                    .padding(.horizontal)
                                
                                Text(isAccepted ? "Accepted" : "Declined")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(isAccepted ? .green : .red)
                                    .padding()
                                    .background(.clear)
                                    .transition(.opacity.combined(with: .scale))
                                    .padding(.bottom)
                            }
                        } else {
                            AcceptRejectView(model: $model)
                                .padding(.horizontal)
                                .padding(.bottom)
                                .offset(y: UIScreen.main.bounds.width * 0.1)
                        }
                    }
                }
                .padding(.bottom, 16)
                Text(model.fullName ?? "")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.leading)
                
                Text(model.address ?? "")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .padding(.leading)
                
                Spacer()
                if let isAccepted = model.isAccepted {
                    VStack(spacing: 8) {
                        Divider()
                            .background(.white)
                            .padding(.horizontal)
                        
                        Text(isAccepted ? "Accepted" : "Declined")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .transition(.opacity.combined(with: .scale))
                            .padding(.bottom)
                    }
                    .background(isAccepted ? .green : .red)
                }
            }
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                        .opacity(0.5)
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24))
                        .padding()
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                show.toggle()
                            }
                        }
                }

                Spacer()
                
            }
            .padding(.top, 10)
            .padding(.horizontal, 16)
        }
        .onAppear {
            // Delay execution by 1 second
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    showContent = true
                }
            }
        }
        .background(ignoresSafeAreaEdges: .all)
    }
}

extension Animation {
    static var hero: Animation {
        .interactiveSpring(response: 0.6, dampingFraction: 0.85, blendDuration: 0.6)
    }
}
