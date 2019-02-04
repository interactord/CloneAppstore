platform :ios, '12.1'

target 'CloneAppstore' do

  use_frameworks!

  # ignore all warnings from all pods
  inhibit_all_warnings!

  # DI
  pod 'Swinject'

  # Network
  pod 'Himotoki'
  pod 'Alamofire'

  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxOptional'

  # Debugger
  pod 'Reveal-SDK', :configurations => ['Debug']

  target 'CloneAppstoreTests' do
    inherit! :search_paths
    
    pod 'Quick'
    pod 'Nimble'
  end

end
