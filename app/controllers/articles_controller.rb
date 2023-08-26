class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    if @article.topics.count == 1
      @topics = topic_gen.map do |topic_name|
        topic = Topic.create!(name: topic_name)
        tag = Tag.new
        tag.topic = topic
        tag.article = @article
        tag.save!
      end
    end
    @related_articles = []
    @related_articles_sorted = []
    related_articles_api_call
    related_articles_array_create
    raise
  end

  def refresh_pins
    sleep 0.1
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "shared/sidebar", formats: [:html] }
    end
  end

  private

  def topic_gen
    ChatgptService.call(@article.title + " " + @article.content)
  end

  def news_dataio_secret_key
    ENV["NEWSDATAIO_API_KEY"]
  end

  def related_articles_api_call
    api_data = { key: news_dataio_secret_key }
    query = @article.topics.first.name
    news = RestClient.get("https://newsdata.io/api/1/news?apikey=#{api_data[:key]}&q=#{query}")
    news_array = JSON.parse(news)["results"]
    news_array.each do |s|
      article = Article.create(title: s["title"], date: s["pubDate"], content: s["content"], url: s["link"], source: s["source_id"]["name"], description: s["description"], image_url: s["image_url"])
      country_api_name = s["country"].split(" ").each.first(2).join(" ")
      # Create a conditional for nil country
      country_api_name = capitalize_words(country_api_name)
      assigned_country = Country.find_by(name: country_api_name)
        if !assigned_country.nil?
          tag = Tag.create(country: assigned_country, article: article, topic: Topic.find_by_name(s["category"].first))
          @related_articles << article
        end
      end
  end

  def related_articles_array_create
    @related_articles_sorted = @related_articles.map do |article|
      !article.countries.first.name.nil? && (article.countries.first.name == !@article.countries.first.name)
    end
  end


  newsdataio_country_codes = {
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
    "Saudi arabia" => "sa",
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
    "United arab emirates" => "ae",
    "United kingdom" => "gb",
    "United States" => "us",
    "Uruguay"	=> "uy",
    "Uzbekistan" =>	"uz",
    "Venezuela"	=> "ve",
    "Vietnam"	=> "vi",
    "Yemen"	=> "ye",
    "Zambia" => "zm",
    "Zimbabwe" =>	"zw"
  }

  def capitalize_words(string)
    string.split.map(&:capitalize).join(' ')
  end
end
