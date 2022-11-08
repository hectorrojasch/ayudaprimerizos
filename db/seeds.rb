require 'csv'

puts 'Importing brands 8...'
CSV.foreach(Rails.root.join('db/seeds/csv/brands.csv'), headers: true) do |row|
  Brand.create! do |brand|
    brand.id = row[0]
    brand.name = row[1]
    brand.available = row[2]
  end
end

puts 'Importing products 50...'
a = %w[active inactive discontinued]
50.times do
  product = Product.new(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    brand_id: rand(1..8),
    status: a.sample
  )
  product.save!
end