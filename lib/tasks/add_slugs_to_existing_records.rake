desc "Add slugs to existing records"
task add_slugs_to_exising_records: :environment do
  [Book, List, Author].each do |klass|
    klass.find_each(&:save)
  end
end
