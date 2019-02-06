platform :ios, '12.1'

target 'CloneAppstore' do

  use_frameworks!

  # ignore all warnings from all pods
  inhibit_all_warnings!

  # UI
  pod 'SnapKit'

  # DI
  pod 'Swinject'

  # Network
  pod 'Himotoki'
  pod 'Alamofire'

  # lint
  pod 'SwiftLint'

  # Rx
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod 'RxOptional'
  pod 'RxDataSources'
  pod 'RxFlow'


  # Debugger
  pod 'Reveal-SDK', :configurations => ['Debug']

  target 'CloneAppstoreTests' do
    inherit! :search_paths
    
    pod 'Quick'
    pod 'Nimble'
  end

end
