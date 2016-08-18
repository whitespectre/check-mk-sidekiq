Gem::Specification.new do |s|
  s.name = 'check-mk-sidekiq'
  s.version = '0.1.0'
  s.licenses = ['MIT']
  s.summary = 'CheckMK agent to watch for Sidekiq stats'
  s.summary = 'CheckMK agent to watch for Sidekiq stats'
  s.authors = ['Whitespectre', 'Timur Batyrshin']
  s.email = 'timur@whitespectre.com'
  s.homepage = 'https://github.com/whitespectre/check-mk-sidekiq'
  s.files = Dir[ 'lib/**/*.rb', 'bin/*' ]
  s.add_dependency 'sidekiq'
  s.executables = 'check-mk-sidekiq'
end
