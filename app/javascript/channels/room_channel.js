import consumer from "channels/consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    const parser = new DOMParser();
    const data_dom = parser.parseFromString(data.html, "text/html");
    const author = document.getElementById('Signed-In-Author');
    const messageContainer = document.getElementById('messages');
    if(data_dom.querySelector("#message").classList.contains(author.value)) {
      messageContainer.innerHTML = messageContainer.innerHTML + data.html;
    } else {
      data_dom.querySelector("#message").classList.remove('owner');
      messageContainer.innerHTML = messageContainer.innerHTML + data_dom.documentElement.innerHTML;
    }


  }
});
