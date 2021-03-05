# A List

AList is a tool for sharing lists of things with your friends. It could be a list of five books you read this summer, a list of five essential gardening tools or a list of your favorite funny twitter accounts - the point is that you can group stuff together, smack some context on it and then share it to social media in a seamless way.

The goal is to present your list in a way that it can be shared on social media, so we'll use [twitter cards](https://developer.twitter.com/en/docs/twitter-for-websites/cards/overview/summary-card-with-large-image) with generated images for each list.

## How It Works

Navigate to alist.link/<your_twitter_handle> to get started. It'll have you log in and then you can start listing things. Navigate to alist.link/<someone else's twitter handle> to see what lists that person has published.

## What is a LIST?

- A list is a set of up to five "things", as well as a Title and a short (300 characters) summary. Each item can optionally have some text appended to contextualize it as well.
- A list can be ordered, unordered or named (or "template list").

An ordered list can look like this:

```
Top Five Marvel Movies
1. Black Panther - come on it was easily the best one!
2. Doctor Strange - I loved the way he had to learn to process his arrogance
3. Spider Man: Far from Home - this was just a trip
4. ...
5. ...
```

An unordered list can look like this:

```
FAVORITE BOOKS
* GNOMON
* PORTRAIT OF THE ARTIST AS A YOUNG MAN
* TO THE LIGHTHOUSE
* ...
* ...
```

Finally, a named list (or template list) can look like this:

```
My Twitter Follows as Adventuring Party
Tank: @jhooks
Healer: @liminalwarmth
Rogue: @visakanv
Caster: @lagrangian
Support: @ahandvanish
```

Note: list can contain any combination of types of thing - so you can do something like this:

```
Things that got me through the pandemic:
* @ahandvanish
* Wandavision on Disney Plus
* Dark on Netflix
* Amazon Product Link of some sort?
* whatever
```

## What is a THING?

Each "type" of thing requires a database table, with a polymorphic "Things" category that closes over all the different types.

1. Media (Books, movies, tv shows, music, comics)
2. Consumer Products (e.g. amazon referal links)
3. Apps
4. Twitter Accounts
5. AList Lists
6. Articles/Blog Posts (careful here, I don't want spammers using this)

## Additional Notes

I'm going to have Stripe integration, and I think that I'll use it by allowing users to upgrade to a cheap "premium" membership where they can have six items in their lists instead of five.

## Thoughts on Implementation

Need the following Elixir contexts in my app:

LinkBuilder - we don't want user-generated links shared anywhere, we want users to e.g. find waht they're looking for via an API and add it to the list. If the item is an amazon item, we'll generate a monetizing link for it when we render the list. If it's a twitter account we'll build that link at render time, etc.

RenderCard - we need some behavior around generating cards from lists. There needs to be a function that takes a List and returns a CardMetadata struct.

# Alist

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
