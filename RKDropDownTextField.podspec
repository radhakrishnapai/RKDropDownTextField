Pod::Spec.new do |s|
  s.name             = 'RKDropDownTextField'
  s.version          = '1.0.0'
  s.summary          = 'A simple dropdown list field for iOS'
  s.description      = <<-DESC
RKDropDownTextField is a quick and easy to use dropdown list textfield which can be customized in storyboard or via code.
                       DESC

  s.homepage         = 'https://github.com/radhakrishnapai/RKDropDownTextField'
  s.screenshots     = 'https://github.com/radhakrishnapai/RKDropDownTextField/blob/master/Example/Images/RKDropDownTextField.gif'
  s.author           = { 'Radhakrishna Pai' => 'radhakrishnapai09@gmail.com' }
  s.source           = { :git => 'git@github.com:radhakrishnapai/RKDropDownTextField.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'RKDropDownTextField/Classes/**/*'
end
