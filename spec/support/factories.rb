FactoryGirl.define do
  factory :artist do
    sequence :name do |n|
      "#{n}Sturgill Simpson"
    end
    image_path "http://www.sturgillsimpson.com/sites/g/files/g2000005636/f/201604/about-pic-2.jpg"
  end
end
