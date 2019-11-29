platform :ios, '11.0'

use_frameworks!

workspace 'Posts'

#core module
def core_pods
  pod 'Crashlytics', '3.14.0'
  pod 'BulletinBoard'
  pod 'SwiftLint', '0.37.0', :configurations => ['Debug']
  pod 'SwiftGen', '6.1.0', :configurations => ['Debug']
  pod 'BartyCrouch', '3.13.0', :configurations => ['Debug']
  pod 'RxSwift',    '~> 5.0'
   pod 'Moya/RxSwift', '~> 14.0.0-beta.5'
  pod 'IQKeyboardManager'
  pod 'RxRequester/Moya', '~> 0.4.0'

end

target 'Core' do
    project 'Core/Core.project'
    core_pods
end

#presentation module
def presentation_pods
    core_pods
    
    pod 'SwiftMessages', '6.0.1'
    pod 'SDWebImage', '4.4.2'
    pod 'SnapKit', '~> 4.0'
    pod 'FLEX', '2.4', :configurations => ['Debug']
    pod 'Layout', '~> 0.6'
    
end

target 'Presentation' do
    project 'Presentation/Presentation.project'
    presentation_pods
end

#data module
def data_pods
    core_pods
end

target 'Data' do
    project 'Data/Data.project'
    data_pods
end

#app module
def app_pods
    core_pods
end

target 'App' do
    project 'App/App.project'
    app_pods
    presentation_pods
end

#home feature module
def home_pods
    core_pods
end

target 'Home' do
    project 'Home/Home.project'
    home_pods
end

#PostDetail feature module
def postDetail_pods
    core_pods
end

target 'PostDetail' do
    project 'PostDetail/PostDetail.project'
    postDetail_pods
end

#PostDetail feature module
def dependencies_pods
end

target 'Dependencies' do
    project 'Dependencies/Dependencies.project'
    dependencies_pods
end


