namespace :rgb do
  desc "Add random color into the queue"
  task :add_color => :environment do
    Queues::InMemory.enqueue Color.get_random
  end
end
