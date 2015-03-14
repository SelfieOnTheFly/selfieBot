HireFire::Resource.configure do |config|
  config.dyno(:worker) do    
  	HireFire::Macro::Sidekiq.queue(:default)
  end
end