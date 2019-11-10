platform :ios, '13.1'

use_frameworks!

workspace 'Posts'

#core module
def core_pods
  pod 'Crashlytics', '3.12.0'
  
  pod 'BulletinBoard'

  pod 'SwiftLint', '0.29.0', :configurations => ['Debug']
  pod 'SwiftGen', '6.1.0', :configurations => ['Debug']
  pod 'BartyCrouch', '3.13.0', :configurations => ['Debug']

  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'

  pod 'Moya/RxSwift', '~> 13.0'

  pod 'IQKeyboardManager'
  
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
