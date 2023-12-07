import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="render-article"
export default class extends Controller {
  static values = { article: Object };
  static targets = ["button", "modal"];
  connect() {
    console.log("Render Article Controller connected");
  }

  render(event) {
    console.log(this.articleValue);
    console.log(this.buttonTargets);
    console.log(this.modalTarget);
    this.modalTarget.innerHTML = `<div class="container container-md article p-5">
            <%# image_tag article.image_url? ? article.image_url : image_path("TellUsBanner.jpg"),
            class: "img-thumbnail article-image" %>
            <div class="d-flex align-items-center">
              <h2 class="title mt-2 flex-grow-1">Test</h2>
              <%# render partial: "shared/like_article", locals: { article: article } %>
            </div>
            <button class="btn btn-success text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
              Related topics
            </button>
            <div class="collapse" id="collapseExample">
              <div class="card card-body circle">
                <%# <% article.topics.uniq.each do |topic| %>
                  <li class="list-inline-item">
                    <p><span class="badge">
                        <%# link_to toggle_favorite_topic_path(topic), data: {"turbo-method": :patch} do %>
                          <i data-toggle-heart-target="icon" data-action="click->toggle-heart#toggle" class="fa-solid fa-thumbtack <%# user_signed_in? && current_user.favorited?(topic) ? "" : "text-secondary" %>" style="color: #26630c;"></i>
                          <%# end %>
                        </span>
                        <span data-toggle-heart-target="newTopic"><%# link_to topic.name, topic, style: "color: black; text-decoration: none;" %></span></p>
                    </li>
                    <%# end %>
                  </div>
                </div>
                <p class="content mt-3"><%# article.content %>.</p>
                <%# link_to "Read the original article#{article.source.present? ? " at #{article.source}" : ""}", article.url, class: "btn btn-secondary rounded mt-2" %>
              </div>`;
  }
}
