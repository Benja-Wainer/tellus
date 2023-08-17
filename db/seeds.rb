require 'net/http'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating seeds"

puts "Making Users"

user = User.create(username: "coolio", email: "coolio@coolio.com", password: "coolio")

puts "Made user #{user.email}"

puts "Destroying all countries"
Country.destroy_all
puts "Next Countries"
countries = "Afghanistan,Albania,
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
  Cabo Verde,
  Cambodia,
  Cameroon,
  Canada,
  Central African Rep.,
  Chad,
  Chile,
  China,
  Colombia,
  Comoros,
  Dem. Rep. Congo,
  Congo,
  Costa Rica,
  Côte d'Ivoire,
  Croatia,
  Cuba,
  Cyprus,
  Czech Republic,
  Denmark,
  Djibouti,
  Dominica,
  Dominican Republic,
  East Timor (Timor-Leste),
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
  Myanmar (Burma),
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
  # base_url = "https://en.wikipedia.org/w/api.php"

  # params = {
  #   action: "query",
  #   format: "json",  # Response format
  #   titles: country.strip, # Replace with the title you're searching for
  #   prop: "extracts",  # Get content
  #   exintro: true,  # Only the introduction part
  #   explaintext: true,  # Plain text content
  # }

  # Build the URL with parameters
  # url = URI("#{base_url}?#{URI.encode_www_form(params)}")

  # response = Net::HTTP.get_response(url)

  # data = JSON.parse(response.body)

  # page_id = data["query"]["pages"].keys.first
  # country_info = data["query"]["pages"][page_id]["extract"]
  place = Country.create(name: country.gsub("\n", "").strip)
  p "created country #{place.name} with id #{place.id} about #{place.country_info}"
end
usa = Country.find_by(name: "United States")
usa.update(img_url: "https://res.cloudinary.com/dm54zi0ff/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1692198958/tellus/usa_nature_xajimf.jpg")

uk = Country.find_by(name: "United Kingdom")
uk.update(img_url: "https://res.cloudinary.com/dm54zi0ff/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1692198959/tellus/uk_iysxxw.webp")

uganda = Country.find_by(name: "Uganda")
uganda.update(img_url: "https://res.cloudinary.com/dm54zi0ff/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1692198979/tellus/uganda_xvqoo1.jpg")

uruguay = Country.find_by(name: "Uruguay")
uruguay.update(img_url: "https://res.cloudinary.com/dm54zi0ff/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1692198958/tellus/uruguay_lu25fb.jpg")

uzbekistan = Country.find_by(name: "Uzbekistan")
uzbekistan.update(img_url: "https://res.cloudinary.com/dm54zi0ff/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1692198958/tellus/uzbekistan_dkanh6.jpg")

uae = Country.find_by(name: "United Arab Emirates")
uae.update(img_url: "https://res.cloudinary.com/dm54zi0ff/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1692222635/uae_nature_vuxhxr.jpg")

ukraine = Country.find_by(name: "Ukraine")
ukraine.update(img_url: "https://res.cloudinary.com/dm54zi0ff/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1692198979/tellus/ukraine_iueq73.webp")

puts "finished making countries"

# next topics
puts "Destroying all topics"
Topic.destroy_all
puts "Making topics"
topics = ["United States", "Japan", "Economy", "Inflation", "Bank of Japan", "Kansas", "Newspapers", "Police", "Free speech", "Household spending", "Gas prices", "Consumer price index"]

topics.each do |t|
  topic = Topic.create(name: t)
  p "created #{topic.name} with id #{topic.id}"
end

puts "finished making topics"
# require 'net/http'

# next articles
# uri = URI('https://gnews.io/api/v4/top-headlines?country=us&category=general&apikey=c74773216f7bc318b072a88e2891eee4')
# response = Net::HTTP.get(uri)
# json_r = JSON.parse(response)
# p json_r["articles"][0]["description"]

puts "Destroying old articles"
Article.destroy_all
puts "Making articles"

article1 = Article.create!(url: "https://www.bbc.com/sport/football/66499185",
                          title: "England reach first Women's World Cup final",
                          source: "BBC",
                          content: "England reached the Women's World Cup final for the first time as they spoiled co-hosts Australia's party on a historic evening in Sydney.

                          Silencing a sell-out crowd at Stadium Australia with their 3-1 victory, the Lionesses became the first England football team since 1966 to reach a senior final on the world stage.

                          It caps a sensational two years under manager Sarina Wiegman as England, crowned European champions for the first time last year on home soil, showed their superiority and know-how to see off an Australia side spurred on by a nation who have been inspired by the Matildas' success.

                          Ella Toone gave England the lead in the first half with a superb first-time strike which sailed into the top corner.

                          The Lionesses controlled proceedings until the second half when Australia threw everything at them and star striker Sam Kerr - starting her first match of the tournament - struck a 25-yard stunner over goalkeeper Mary Earps' head to make it 1-1.

                          But England, as they so often do, found a way back into the game when Lauren Hemp pounced on a defensive error to restore their lead, before Alessia Russo made sure of victory late on to set up a final with Spain on Sunday.Build-up to this semi-final has dominated every aspect of Australian life this week as cities across the country became absorbed in 'Matildas Mania'.

                          Fans were queueing outside fan parks in Sydney five hours before kick-off, train stations were decorated in yellow and green balloons, shops sold out of merchandise, and newspapers had the players' faces plastered over their front and back pages.

                          All focus was on the co-hosts' attempts to create history, but England quietly went about their business and arrived in Sydney ready to compete in their third successive Women's World Cup semi-final.

                          Their experience of handling big occasions was evident from the first minute as they disrupted Australia's rhythm and made every attempt to frustrate the crowd, taking their time over throw-ins and breaking down dangerous counter-attacks.

                          It worked for large parts, but when Australia fought their way back into the game through Kerr, England had to find another way - and they did.

                          Backs against the wall, England's defence, who have been magnificent throughout the tournament, stepped up to make blocks, tackles and head away relentless balls into the box.

                          \"My thought was 'we're not going to give this away now',\" said Wiegman, reflecting on Australia's equaliser. \"You are never sure. But it was later in the game so we got through.\"

                          Hemp and Russo's flourishing partnership up front ultimately decided the game when they combined late on - Manchester City winger Hemp with a superb no-look pass to set-up Russo.

                          \"That was just an incredible pass,\" added Wiegman. \"The finish was really good too. I'm really happy with the performance and the players themselves are happy too.\"

                          England's celebrations at full-time were initially subdued. They have created history but this is a team of winners and they have not finished yet.

                          Build-up to this semi-final has dominated every aspect of Australian life this week as cities across the country became absorbed in 'Matildas Mania'.

                          Fans were queueing outside fan parks in Sydney five hours before kick-off, train stations were decorated in yellow and green balloons, shops sold out of merchandise, and newspapers had the players' faces plastered over their front and back pages.

                          All focus was on the co-hosts' attempts to create history, but England quietly went about their business and arrived in Sydney ready to compete in their third successive Women's World Cup semi-final.

                          Their experience of handling big occasions was evident from the first minute as they disrupted Australia's rhythm and made every attempt to frustrate the crowd, taking their time over throw-ins and breaking down dangerous counter-attacks.

                          It worked for large parts, but when Australia fought their way back into the game through Kerr, England had to find another way - and they did.

                          Backs against the wall, England's defence, who have been magnificent throughout the tournament, stepped up to make blocks, tackles and head away relentless balls into the box.

                          \"My thought was 'we're not going to give this away now',\" said Wiegman, reflecting on Australia's equaliser. \"You are never sure. But it was later in the game so we got through.\"

                          Hemp and Russo's flourishing partnership up front ultimately decided the game when they combined late on - Manchester City winger Hemp with a superb no-look pass to set-up Russo.

                          \"That was just an incredible pass,\" added Wiegman. \"The finish was really good too. I'm really happy with the performance and the players themselves are happy too.\"

                          England's celebrations at full-time were initially subdued. They have created history but this is a team of winners and they have not finished yet.

                          England's plan to stifle Australia's intensity and quick counter-attacking football worked a treat.

                          From the first minute they showed they were not afraid to play with physicality, going in hard in 50-50 challenges and doing all it took to bring down Kerr and prevent her getting a run at England's defence.

                          Keira Walsh set the tone with a crunching tackle on Kerr within two minutes and Alex Greenwood later came sliding in on the Chelsea striker, earning herself a yellow card, to prevent a dangerous break.

                          With each tackle came a ripple of boos from the home fans, while Earps was in no rush to get things going again on goal-kicks.

                          It was England who controlled things early on - although both teams created a few chances - as they had 70% of the ball in the opening 15 minutes.

                          Their control did not really waver as the first half wore on and the crowd became increasingly frustrated, whistling as England enjoyed prolonged periods of possession and passed through Australia's press.

                          By the time the break arrived with England leading, the deafening roar which had greeted the players on their entrance had turned to polite applause as the Australians were still processing Toone's superb strike.

                          The second half was a different story, however. Kerr's sensational equaliser was followed by a dangerous strike from Cortnee Vine which called Earps into action.

                          Kerr headed another two chances over the bar, while Russo and Lucy Bronze came close at the other end for England.

                          However, it was the Lionesses who were more ruthless, keeping their composure in the big moments and delivering when it mattered.

                          \"Knowing Sam, she will think that goal means nothing. She is a winner,\" said Australia manager Tony Gustavsson.

                          \"I know she's upset that she missed those two chances at the end. We need to support her. She did everything she could tonight.

                          The fact she played 90 minutes is unbelievable. It is a world-class goal and shows what Sam Kerr is about. We promised to leave every single thing out there and every player did.\"

                          England will go into the final full of confidence having overcome every hurdle so far in the tournament.

                          But this has also been a World Cup to remember for the Matildas, who hope to change the perception of women's football in this country forever.

                          It will be hard to ignore their impact and they were given a warm applause on a lap of honour at full-time.")


article2 = Article.create!(url: "https://www.msnbc.com/opinion/msnbc-opinion/kansas-newspaper-police-raid-marion-county-record-rcna99813",
                          title: "This police raid on rural Kansas newspaper is unconscionable and un-American",
                          source: "MSNBC",
                          content: "At first blush, reports of an outrageous police raid on a small newspaper in rural Kansas appear as implausible as the fictional tornado that swept Dorothy and Toto out of that state. But this alarming incident — the stress from which, according to the newspaper’s publisher, contributed to the death of the paper’s 98-year-old co-owner, Joan Meyer — appears to be part of an insidious and growing trend of government censorship of free expression: one that we’ve seen lead to book bans and now threatens the freedom of the press.

                          On Aug. 11, police, with a search warrant in hand, raided the office of the Marion County Record and the home its publisher Eric Meyer shared with his mother, Joan, in Marion, northern Kansas. Police seized digital communications, computers and cellphones. According to Meyer, the police took “everything we have.” Under federal law, journalists are generally protected from these types of paralyzing searches and seizures. Instead, law enforcement is supposed to serve a subpoena for any information it seeks.

                          Marion County Police claim its raid falls within an exception to federal law that applies when there’s probable cause to believe a journalist has committed a crime. The search warrant, which was signed by Magistrate Judge Laura Viar, allowed authorities to look for evidence of identity theft and evidence of criminal use of a computer. Over the weekend, local restaurateur Kari Newell (who reportedly threw a Record reporter out of a public event hosted at her restaurant for Rep. Jake LaTurner, R-Kan.) accused the paper of using illegal means to obtain information about her and her driving record. The paper denies any wrongdoing. According to Meyer, a source provided information about Newell to the paper. After attempts were made to verify the information, Meyer decided not to publish a story.

                          To be clear, receiving information from a source is not a crime. Nor is it a crime to fact-check that information, to publish that information or, in this case, not publish that information. To the contrary: Receiving tips, checking them out and deciding what, if anything, to do with that information if it’s confirmed, is the daily work of journalists and newsrooms. Even if the source who provided the information to the Record obtained it illegally, Supreme Court precedent holds that the paper cannot be held liable for receiving or publishing that information, unless it also participated in the illegal activity.

                          Moreover, in order to obtain a search warrant of a newsroom, even under the county’s claimed exception, law enforcement must establish probable cause by providing an affidavit to the court. Although the search warrant is publicly available, the underlying affidavit was reportedly being withheld by a county attorney who also owns the hotel that houses Newell’s restaurant, though local reports indicate it may be released in the coming days. It’s also been reported that the Record has been investigating the Marion County chief of police, who carried out the raid and has since defended it.

                          Without access to the affidavit, the public cannot begin to assess whether this raid on the small, rural newspaper was in any way justified, but as it stands now, it looks like a dramatic violation of basic press freedoms. Just as alarmingly, the confiscation of The Record’s devices and documents has jeopardized its ability to publish a paper at all, effectively erasing a vital source of news for the Marion community. This wholesale seizure appears not only to have violated federal law, but to have run roughshod over the paper’s First Amendment right to gather and disseminate the news.

                          The implications of the raid potentially stretch far beyond the Record. Sources far from Kansas may now be reluctant to share information with journalists out of fear that their communications and identities may become known to law enforcement if that journalist or newsroom is similarly raided. That’s precisely why protecting sources is vital to journalists’ ability to do their jobs.

                          Due in large part to the county withholding relevant information, the facts here are still largely in dispute. But if the current reporting is true, Marion County appears to be the latest in a line of state and local governments attempting to silence speech they find objectionable. Earlier this year, Florida Gov. Ron DeSantis, who’s seeking the Republican nomination for president, supported an ultimately unsuccessful and unconstitutional bill that would have characterized statements by anonymous sources as presumptively defamatory and characterized allegations of discrimination on the basis of race and sexual and gender identity defamatory per se.

                          At PEN America, we are all too familiar with government efforts to ban books in schools and to censor curriculum with which the government disagrees. If the free press is to remain free, then we must be just as outraged at any and every attempt to similarly censor the press. We can’t wait for a house to fall on us before we demand answers.")

article3 = Article.create!(url: "https://edition.cnn.com/2023/08/11/economy/inflation-rate-spending/index.html",
                          title: "US inflation means families are spending $709 more per month than two years ago",
                          source: "CNN",
                          content: "The typical American household spent $709 more in July than they did two years ago to buy the same goods and services, according to Moody’s Analytics.

                          That figure underscores the cumulative impact high inflation has had on consumer finances — even as price growth has cooled considerably in recent months.

                          “High inflation of the past 2+ years has done lots of economic damage,” Mark Zandi, chief economist at Moody’s Analytics, wrote in a post on X, the platform formerly known as Twitter.

                          Most of that increase in spending is driven by housing costs, which have surged, Zandi told CNN in an email on Friday. He added that families are also spending more at the grocery store; on buying, maintaining and insuring vehicles and on recreational services like cable.

                          Of course, paychecks have also grown over the past two years — but not by as much as the cost of living.

                          Even though prices have soared, real earnings, which adjust for inflation, are stuck at late 2019 levels.

                          “Real earnings remain below what they would have been if not for the pandemic and the Russian war, which is weighing on the collective psyche,” Zandi told CNN in an email on Friday.

                          The good news is that wages are finally starting to outpace inflation and consumer price growth has eased significantly, so much so that many investors are betting the Federal Reserve is done raising interest rates.

                          Looking at just the last year, Zandi calculates that the typical household spent $202 more this July than they did a year ago to buy the same goods and services.

                          That’s significant, but it’s still below the peak of $536 for this year-over-year metric — a record hit back June 2022, when gas prices spiked above $5 a gallon for the first time.

                          Consumer prices increased by a cooler-than-expected 3.2% in July compared with the year before, according to a government report released Wednesday. Even though that was slightly higher than the annual inflation rate in June, most of the impact was driven by calendar effects.

                          “In sum, the report was encouraging,” Bank of America economists wrote in a note to clients on Thursday, adding they “wouldn’t be surprised to see another soft” inflation reading in August.

                          Although month-over-month inflation readings are “still likely to be bumpy,” Bank of America economists said they “believe that the current disinflation is not a ‘head fake.’”")

article4 = Article.create!(url: "https://www.independent.ie/irish-news/queues-at-bank-of-ireland-atms-as-customers-with-no-money-withdraw-up-to-1000-in-cash/a1211513809.html",
                          title: "Queues at Bank of Ireland ATMs as customers with no money withdraw up to €1,000 in cash",
                          source: "Irish Independent",
                          content: "Bank of Ireland’s mobile app and 365online services have been restored after a massive technology break-down allowed customers who have no money in their accounts to get access to funds.
                          This prompted huge queues at ATMs around the country last night, with people mistakenly believing they were getting access to free cash.

                          In some towns the queues were so big gardaí had to control them.

                          Bank of Ireland said this morning it’s mobile app and 365online have now been restored following the blunder as it apologised to customers.")


article5 = Article.new(url: "https://asia.nikkei.com/Economy/Inflation/Japan-s-inflation-re-accelerates-in-June-stays-above-BOJ-target",
                          title: "Japan's inflation re-accelerates in June, stays above BOJ target",
                          source: "Nikkei",
                          content: "TOKYO (Reuters) -- Japan's core consumer inflation re-accelerated in June and stayed above the central bank's 2% target for the 15th straight month, data showed on Friday, adding to recent signs of broadening price pressures.

                          The data comes ahead of the Bank of Japan's closely watched policy meeting next week, when the board will produce fresh quarterly forecasts and debate whether conditions are falling into place to begin phasing out the bank's massive stimulus.

                          The nationwide core consumer price index (CPI), which excludes fresh food costs, rose 3.3% in June from a year earlier, matching a median market forecast. It followed a 3.2% gain in May.

                          The \"core core\" inflation rate, which strips away both fresh food and fuel costs, stood at 4.2% in June after a 4.3% rise in May, the data showed.

                          As inflation perks up, markets are simmering with speculation the BOJ could soon phase out its controversial yield curve control (YCC) policy that is criticized for distorting market pricing and narrowing margins for financial institution.

                          BOJ Gov. Kazuo Ueda's remarks on Tuesday that Japan was still distant from sustainably achieving the bank's 2% target have pushed down the yen and boosted Japanese shares, as investors scaled back bets of a near-term tweak to YCC.

                          Under YCC, the BOJ guides short-term interest rates at -0.1% and buys huge amounts of government bonds to cap the 10-year bond yield around 0% as part of efforts to fire up inflation to its 2% target.")
article5.save!

puts "Destroying old tags"
Tag.destroy_all
puts "Making tags"

Tag.create(country: Country.find_by(name: "Ireland"), article: article4)
Tag.create(country: Country.find_by(name: "United States"), article: article3)
Tag.create(country: Country.find_by(name: "United States"), article: article2, topic: Topic.find(1))
Tag.create(country: Country.find_by(name: "United States"), article: article2, topic: Topic.find(6))
Tag.create(country: Country.find_by(name: "United States"), article: article2, topic: Topic.find(7))
Tag.create(country: Country.find_by(name: "United States"), article: article2, topic: Topic.find(8))
Tag.create(country: Country.find_by(name: "United States"), article: article2, topic: Topic.find(9))
Tag.create(country: Country.find_by(name: "Japan"), article: article5, topic: Topic.find(1))
Tag.create(country: Country.find_by(name: "Japan"), article: article5, topic: Topic.find(2))
Tag.create(country: Country.find_by(name: "Japan"), article: article5, topic: Topic.find(3))
Tag.create(country: Country.find_by(name: "Japan"), article: article5, topic: Topic.find(4))

p "Tags done"

# def news_secret_key
#   ENV["NEWS_API_KEY"]
# end

# def news_dataset
#   api_data = { key: news_secret_key }

#   news = RestClient.get("https://gnews.io/api/v4/top-headlines?country=us&category=general&apikey=#{api_data[:key]}&lang=en")

#   news_array = JSON.parse(news)["articles"]

#   news_array.first(10).each do |s|
#     article = Article.create(title: s["title"], date: s["publishedAt"], content: s["content"], url: s["url"], source: s["source"]["name"], description: s["description"], image_url: s["image"])
#     tag = Tag.create(country: Country.find_by(name: "United States"), article: article, topic: Topic.find(1))
#     p "Created #{article.title}"
#   end
# end

# news_dataset


coolio = User.find(1)
kremlin = Topic.find(2)
coolio.favorite(kremlin)
