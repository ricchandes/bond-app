import consumer from "./consumer"

if(location.pathname.match(/\/rooms\/\d+\/messages\/new/)){


  consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
    <div class="message-box">
<div class="sendname">${data.name}</div>
${data.message.created_at}
<div class="balloon1">
${data.message.text}
</div>
<br/>
</div>`
const comments = document.getElementById("messages")
comments.insertAdjacentHTML('beforeend', html)
const commentForm = document.getElementById("message-form")
commentForm.reset();

  }
})
}