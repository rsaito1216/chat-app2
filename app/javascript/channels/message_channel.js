import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const text = `<p>${data.content.content}</p>`;
    const createdAt = `<p>${data.time}</p>`;
    const Name = `<p>${data.user.name}</p>`;
    const HTML = `
    <div class="message">
      <div class="upper-message">
        <div class="message-user">
          <p>${Name}</p>
        </div>
        <div class="message-date">
          <p>${createdAt}</p>
        </div>
      </div>
        <div class="message-content">
          <p>${text}</p>
        </div>
     </div>
    `
    const comments = document.getElementById('message_area');
    comments.insertAdjacentHTML('afterbegin', HTML);
    const newComment = document.getElementById('message_content');
    newComment.value='';
  }
});