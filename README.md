# TurboStreams Demo

![turbo-stream-sample](https://user-images.githubusercontent.com/60980/155279685-1057c036-889f-440d-8864-cf7cf9764d3f.gif)

```
$ docker compose run app bin/rails db:create
$ docker compose up
```

Open http://localhost:3000 in your browser.

## Building Turbo Streams App

このデモでは段階的に Turbo Streams を導入し、Turbo Streams で実現できる、次の二つのことを試します。

1. フォーム送信をトリガーにした 2 箇所以上の更新。[Turbo Frames](https://github.com/takeyuweb/rails-turbo-frame-demo) では 1 箇所しか更新できませんでした。
2. ActionCable を利用した WebSocket によるブロードキャスト更新。[Turbo Frames](https://github.com/takeyuweb/rails-turbo-frame-demo) ではリンクかフォーム送信でしか更新できませんでした。

In this demo, we will introduce Turbo Streams in a step-by-step manner and try two things that can be achieved with Turbo Streams:

1. Update two or more locations, triggered by form submissions. [Turbo Frames](https://github.com/takeyuweb/rails-turbo-frame-demo) could only update one location.
2. broadcast update via WebSocket using ActionCable. [Turbo Frames](https://github.com/takeyuweb/rails-turbo-frame-demo) could only update via link or form submission.

### Step 1. without Turbo Streams

一般的なページ遷移を伴うステートレスな Web アプリケーション（メッセージボード）を構築します。

Build a stateless web application (message board) with common page transitions.

https://github.com/takeyuweb/rails-turbo-streams-demo/commit/c222a21cfbb8acaa7e35501dc7341cb171003570

### Step 2. フォーム送信をトリガーにした 2 箇所以上の更新を実現

フォームを送信するとフォームの内容をリセットして、送信したメッセージをメッセージ一覧に追加します。

Update two or more locations triggered by form submissions

When the form is submitted, it resets the form contents and adds the submitted message to the message list.

https://github.com/takeyuweb/rails-turbo-streams-demo/commit/f73c72a715d2db0af4a433953a569cc0f1fee268

### Step 3. ブロードキャスト更新を実現

フォームを送信するとフォームの内容をリセットして、送信したメッセージを現在表示中のすべてのブラウザのメッセージ一覧に追加します。

Enables broadcast updates.

When you submit a form, it resets the form content and adds the submitted message to the list of messages in all currently displayed browsers.

https://github.com/takeyuweb/rails-turbo-streams-demo/commit/21c869543415c337f315853f9b55725e9465aeeb
