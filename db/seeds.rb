require 'net/http'
require 'json'

puts "Creating seeds"

puts "Making Users"

user = User.create(username: "coolio", email: "coolio@coolio.com", password: "coolio")

puts "Made user #{user.email}"

puts "Destroying all countries"
Country.destroy_all
puts "Next Countries"
countries = "Afghanistan,
  Albania,
  Algeria,
  Andorra,
  Angola,
  Antigua and Barbuda,
  Argentina,
  Armenia,
  Australia,
  Austria,
  Azerbaijan,
  The Bahamas,
  Bahrain,
  Bangladesh,
  Barbados,
  Belarus,
  Belgium,
  Belize,
  Benin,
  Bhutan,
  Bolivia,
  Bosnia and Herzegovina,
  Botswana,
  Brazil,
  Brunei,
  Bulgaria,
  Burkina Faso,
  Burundi,
  Cape Verde,
  Cambodia,
  Cameroon,
  Canada,
  Central African Republic,
  Chad,
  Chile,
  China,
  Colombia,
  Comoros,
  Democratic Republic of the Congo,
  Congo,
  Costa Rica,
  Ivory Coast,
  Croatia,
  Cuba,
  Cyprus,
  Czech Republic,
  Denmark,
  Djibouti,
  Dominica,
  Dominican Republic,
  East Timor,
  Ecuador,
  Egypt,
  El Salvador,
  Equatorial Guinea,
  Eritrea,
  Estonia,
  Eswatini,
  Ethiopia,
  Fiji,
  Finland,
  France,
  Gabon,
  The Gambia,
  Georgia,
  Germany,
  Ghana,
  Greece,
  Grenada,
  Guatemala,
  Guinea,
  Guinea-Bissau,
  Guyana,
  Haiti,
  Honduras,
  Hungary,
  Iceland,
  India,
  Indonesia,
  Iran,
  Iraq,
  Ireland,
  Israel,
  Italy,
  Jamaica,
  Japan,
  Jordan,
  Kazakhstan,
  Kenya,
  Kiribati,
  North Korea,
  South Korea,
  Kosovo,
  Kuwait,
  Kyrgyzstan,
  Laos,
  Latvia,
  Lebanon,
  Lesotho,
  Liberia,
  Libya,
  Liechtenstein,
  Lithuania,
  Luxembourg,
  Madagascar,
  Malawi,
  Malaysia,
  Maldives,
  Mali,
  Malta,
  Marshall Islands,
  Mauritania,
  Mauritius,
  Mexico,
  Federated States of Micronesia,
  Moldova,
  Monaco,
  Mongolia,
  Montenegro,
  Morocco,
  Mozambique,
  Myanmar,
  Namibia,
  Nauru,
  Nepal,
  Netherlands,
  New Zealand,
  Nicaragua,
  Niger,
  Nigeria,
  North Macedonia,
  Norway,
  Oman,
  Pakistan,
  Palau,
  Panama,
  Papua New Guinea,
  Paraguay,
  Peru,
  Philippines,
  Poland,
  Portugal,
  Qatar,
  Romania,
  Russia,
  Rwanda,
  Saint Kitts and Nevis,
  Saint Lucia,
  Saint Vincent and the Grenadines,
  Samoa,
  San Marino,
  Sao Tome and Principe,
  Saudi Arabia,
  Senegal,
  Serbia,
  Seychelles,
  Sierra Leone,
  Singapore,
  Slovakia,
  Slovenia,
  Solomon Islands,
  Somalia,
  South Africa,
  Spain,
  Sri Lanka,
  Sudan,
  South Sudan,
  Suriname,
  Sweden,
  Switzerland,
  Syria,
  Taiwan,
  Tajikistan,
  Tanzania,
  Thailand,
  Togo,
  Tonga,
  Trinidad and Tobago,
  Tunisia,
  Turkey,
  Turkmenistan,
  Tuvalu,
  Uganda,
  Ukraine,
  United Arab Emirates,
  United Kingdom,
  United States,
  Uruguay,
  Uzbekistan,
  Vanuatu,
  Vatican City,
  Venezuela,
  Vietnam,
  Yemen,
  Zambia,
  Zimbabwe".split(",")
countries.each do |country|
  # Wikipedia API endpoint
  base_url = "https://en.wikipedia.org/w/api.php"

  params = {
    action: "query",
    format: "json",  # Response format
    titles: country.strip, # Replace with the title you're searching for
    prop: "pageimages", # Get images
    pithumbsize: 300,   # Thumbnail size (adjust as needed)
    piperpage: true
  }

  # Build the URL with parameters
  url = URI("#{base_url}?#{URI.encode_www_form(params)}")

  response = Net::HTTP.get_response(url)

  data = JSON.parse(response.body)

  page_id = data["query"]["pages"].keys.first
  if data["query"]["pages"][page_id].key?("thumbnail")
    country_flag = data["query"]["pages"][page_id]["thumbnail"]["source"]
  else
    country_flag = nil
  end

  if country_flag.nil? == false
    place = Country.create(name: country.gsub("\n", "").strip, flag_url: country_flag)
  else
    place = Country.create(name: country.gsub("\n", "").strip)
  end
  p "created country #{place.name} with id #{place.id} about #{place.country_info}"
end

puts "finished making countries"

# next topics
puts "Destroying all topics"
Topic.destroy_all
puts "Making categories"
categories = ["business", "entertainment", "environment", "food", "health", "politics", "science", "sports", "technology", "top", "tourism", "world"]

categories.each do |t|
  topic = Topic.create!(name: t)
  p "created #{topic.name} with id #{topic.id}"
end

puts "finished making categories"
puts "Connecting categories to countries. This takes some time. Please wait."

Country.all.each do |country|
  Topic.all.each do |category|
    Tag.create!(country: country, topic: category)
  end
end

p "Finished"
