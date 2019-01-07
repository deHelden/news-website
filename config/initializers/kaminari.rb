# Needed for active admin and will paginate to co-exist
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end
