class CountriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show world_map ]

  def index
    if params[:query].present?
      @countries = Country.search_by_name(params[:query])
    else
      @countries = Country.all
    end
  end

  def world_map
    @countries = Country.all.map do |country|
      {
        name: country.name,
        id: country.id,
        popup_html: render_to_string(partial: "popup", locals: {country: country})
      }
    end
  end

  def show
    @newsdataio_country_codes = {
      "Afghanistan" =>	"af",
      "Albania"	=> "al",
      "Algeria"	=> "dz",
      "Angola" => "ao",
      "Argentina" => "ar",
      "Australia" => "au",
      "Austria"	=> "at",
      "Azerbaijan" => "az",
      "Bahrain"	=> "bh",
      "Bangladesh" => "bd",
      "Barbados" => "bb",
      "Belarus"	=> "by",
      "Belgium" => "be",
      "Bermuda"	=> "bm",
      "Bhutan" => "bt",
      "Bolivia" => "bo",
      "Bosnia and Herzegovina" => "ba",
      "Brazil" =>	"br",
      "Brunei" =>	"bn",
      "Bulgaria" =>	"bg",
      "Burkina fasco"	=> "bf",
      "Cambodia" => "kh",
      "Cameroon" =>	"cm",
      "Canada" =>	"ca",
      "Cabo Verde" =>	"cv",
      "Cayman Islands" =>	"ky",
      "Chile"	=> "cl",
      "China"	=> "cn",
      "Colombia" =>	"co",
      "Comoros"	=> "km",
      "Costa Rica" =>	"cr",
      "Côte d'Ivoire" => "ci",
      "Croatia"	=> "hr",
      "Cuba" =>	"cu",
      "Cyprus" => "cy",
      "Czech republic" =>	"cz",
      "Denmark" => "dk",
      "Djibouti" =>	"dj",
      "Dominica" =>	"dm",
      "Dominican Republic" =>	"do",
      "DR Congo" => "cd",
      "Ecuador" => "ec",
      "Egypt" => "eg",
      "El Salvador"	=> "sv",
      "Estonia" => "ee",
      "Ethiopia" => "et",
      "Fiji" =>	"fj",
      "Finland"	=> "fi",
      "France" => "fr",
      "French polynesia" =>	"pf",
      "Gabon" => "ga",
      "Georgia"	=> "ge",
      "Germany"	=> "de",
      "Ghana"	=> "gh",
      "Greece" => "gr",
      "Guatemala"	=> "gt",
      "Guinea" =>	"gn",
      "Haiti"	=> "ht",
      "Honduras" => "hn",
      "Hong kong"	=> "hk",
      "Hungary"	=> "hu",
      "Iceland"	=> "is",
      "India"	=> "in",
      "Indonesia"	=> "id",
      "Iraq" => "iq",
      "Ireland"	=> "ie",
      "Israel" => "il",
      "Italy"	=> "it",
      "Jamaica"	=> "jm",
      "Japan"	=> "jp",
      "Jordan" => "jo",
      "Kazakhstan" =>	"kz",
      "Kenya"	=> "ke",
      "Kuwait" => "kw",
      "Kyrgyzstan" => "kg",
      "Latvia" => "lv",
      "Lebanon" =>	"lb",
      "Libya"	=> "ly",
      "Lithuania"	=> "lt",
      "Luxembourg" =>	"lu",
      "Macau" => "mo",
      "Macedonia" => "mk",
      "Madagascar" => "mg",
      "Malawi" => "mw",
      "Malaysia" => "my",
      "Maldives" =>	"mv",
      "Mali" => "ml",
      "Malta"	=> "mt",
      "Mauritania" => "mr",
      "Mexico" => "mx",
      "Moldova"	=> "md",
      "Mongolia" =>	"mn",
      "Montenegro" =>	"me",
      "Morocco"	=> "ma",
      "Mozambique" => "mz",
      "Myanmar"	=> "mm",
      "Namibia"	=> "na",
      "Nepal"	=> "np",
      "Netherland" => "nl",
      "New zealand" => "nz",
      "Niger" => "ne",
      "Nigeria"	=> "ng",
      "North korea"	=> "kp",
      "Norway" =>	"no",
      "Oman" =>	"om",
      "Pakistan" => "pk",
      "Panama" =>	"pa",
      "Paraguay" => "py",
      "Peru" => "pe",
      "Philippines"	=> "ph",
      "Poland" => "pl",
      "Portugal" =>	"pt",
      "Puerto rico"	=> "pr",
      "Romania" => "ro",
      "Russia" => "ru",
      "Rwanda" => "rw",
      "Samoa"	=> "ws",
      "San Marino"	=> "sm",
      "Saudi Arabia" => "sa",
      "Senegal" => "sn",
      "Serbia" => "rs",
      "Singapore"	=> "sg",
      "Slovakia" => "sk",
      "Slovenia" => "si",
      "Solomon Islands" => "sb",
      "Somalia"	=> "so",
      "South africa" =>	"za",
      "South korea" => "kr",
      "Spain"	=> "es",
      "Sri Lanka" => "lk",
      "Sudan"	=> "sd",
      "Sweden" => "se",
      "Switzerland" => "ch",
      "Syria"	=> "sy",
      "Taiwan" => "tw",
      "Tajikistan" => "tj",
      "Tanzania" =>	"tz",
      "Thailand" => "th",
      "Tonga" => "to",
      "Tunisia" =>	"tn",
      "Turkey" =>	"tr",
      "Turkmenistan" => "tm",
      "Uganda" =>	"ug",
      "Ukraine"	=> "ua",
      "United Arab Emirates" => "ae",
      "United Kingdom" => "gb",
      "United States" => "us",
      "Uruguay"	=> "uy",
      "Uzbekistan" =>	"uz",
      "Venezuela"	=> "ve",
      "Vietnam"	=> "vi",
      "Yemen"	=> "ye",
      "Zambia" => "zm",
      "Zimbabwe" =>	"zw"
    }
    @country = Country.find(params[:id])
    country_search
  end

  def toggle_favorite
    @country = Country.find(params[:id])
    if current_user.favorited?(@country)
      current_user.unfavorite(@country)
    else
      current_user.favorite(@country)
    end
  end

  def news_dataio_secret_key
    ENV["NEWSDATAIO_API_KEY"]
  end

  def country_search
    api_data = { key: news_dataio_secret_key }
    country_query = @newsdataio_country_codes[@country.name]
    news = RestClient.get("https://newsdata.io/api/1/news?apikey=#{api_data[:key]}&country=#{country_query}")
    news_array = JSON.parse(news)["results"]

    news_array.each do |s|
      article = Article.create(title: s["title"], date: s["pubDate"], content: s["content"], url: s["link"], source: s["source_id"]["name"], description: s["description"], image_url: s["image_url"])
      Tag.create(country: @country, article: article, topic: Topic.find_by_name(s["category"].first.capitalize()))
    end
  end
end
