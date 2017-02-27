Pod::Spec.new do |s|
  s.name         = "DM3Collection"
  s.version      = "0.0.1"
  s.summary      = "Collection of UI elements"
  s.description  = <<-DESC
  Simple checkmar animation.
                   DESC
  s.homepage     = "https://github.com/dmi3j/DM3Collection"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Dmitry Beloborodov" => "dmi3j@me.com" }
  s.social_media_url   = "http://twitter.com/dmi3j"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/dmi3j/DM3Collection.git", :tag => s.version.to_s }
  s.source_files = "DM3*.{h,m}"

  s.subspec 'DM3BreadcrumbsView' do |breadcrumbs|
    breadcrumbs.source_files = '**/DM3BreadcrumbsView.{h,m}'
  end

  s.subspec 'DM3CheckmarkView' do |checkmark|
    checkmark.source_files = '**/DM3CheckmarkView.{h,m}'
  end

end
