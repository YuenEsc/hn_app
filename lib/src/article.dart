class Article {
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentsCount;

  const Article(
      {this.text, this.domain, this.by, this.age, this.score, this.commentsCount});
}

final articles = [
  Article(
      by: "greatwave1",
      commentsCount: 60,
      age: "2 hours",
      score: 173,
      text: "Show HN: Dashboard for tracking insider trading at S&P 500 companies",
      domain: "https://www.quiverquant.com/sources/insidertrading"),
  Article(
      by: "atomlib",
      commentsCount: 41,
      score: 188,
      age: "16 hours",
      text: "Enemy AI: chasing a player without Navigation2D or A* pathfinding",
      domain: "https://abitawake.com/news/articles/enemy-ai-chasing-a-player-without-navigation2d-or-a-star-pathfinding"),
  Article(
      by: "jameslk",
      commentsCount: 36,
      score: 41,
      text: "Seen everywhere in last U.S. crisis, moral hazard is nowhere in this one",
      domain: "https://www.reuters.com/article/idUSKCN21U0GV"),
  Article(
      by: "pagade",
      commentsCount: 15,
      score: 137,
      age: "1 day",
      text: "How to Speak (2018) [video]",
      domain: "https://ocw.mit.edu/resources/res-tll-005-how-to-speak-january-iap-2018/how-to-speak/index.htm"),
  Article(
      by: "lukestateson",
      commentsCount: 94,
      age: "3 days",
      score: 144,
      text: "Social Distancing Is Bringing Drive-In Theaters Back to Life",
      domain: "https://www.atlasobscura.com/articles/drive-in-theaters-adapt-to-coronavirus"),
  Article(
      by: "bottle2",
      commentsCount: 11,
      score: 32,
      text: "Surveillance Capitalism",
      domain: "https://en.wikipedia.org/wiki/Surveillance_capitalism"),
  Article(
      by: "transitivebs",
      commentsCount: 3,
      score: 28,
      text: "Show HN: Search your Twitter history with Algolia",
      domain: "https://github.com/saasify-sh/twitter-search"),
  Article(
      by: "jandeboevrie",
      commentsCount: 16,
      score: 103,
      text: "Rediscovering CardDAV",
      domain: "https://jpmens.net/2020/04/12/rediscovering-carddav/"),
  Article(
      by: "aluket",
      commentsCount: 1,
      score: 13,
      age: "18 hours",
      text: "Entropy and Life",
      domain: "https://en.wikipedia.org/wiki/Entropy_and_life"),
  Article(
      by: "lwhsiao",
      commentsCount: 224,
      score: 361,
      text: "Bored? How about trying a Linux speed run?",
      domain: "https://rachelbythebay.com/w/2020/04/11/pengrun/"),
  Article(
      by: "bottle2",
      commentsCount: 18,
      age: "1 week",
      score: 53,
      text: "The cost of virtualizing CS conferences",
      domain: "https://rachitnigam.com/post/virtual-cs-conferences/"),
  Article(
      by: "kiyanwang",
      commentsCount: 4,
      score: 45,
      text: "Technology-budgeting/handbook.md at master · 18F/technology-budgeting",
      domain: "https://github.com/18F/technology-budgeting/blob/master/handbook.md"),
  Article(
      by: "wallflower",
      commentsCount: 0,
      score: 29,
      text: "The New Science of Seeing Around Corners (2018)",
      domain: "https://www.quantamagazine.org/the-new-science-of-seeing-around-corners-20180830/"),
  Article(
      by: "pcr910303",
      commentsCount: 1,
      age: "2 weeks",
      score: 33,
      text: "So You Want to Be a (Compiler) Wizard",
      domain: "https://belkadan.com/blog/2016/05/So-You-Want-To-Be-A-Compiler-Wizard/"),
  Article(
      by: "chrnad",
      commentsCount: 86,
      age: "3 hours",
      score: 153,
      text: "Fastmail Labels Beta",
      domain: "https://beta.fastmail.com/help/receive/labels-beta.html"),
  Article(
      by: "Lind5",
      commentsCount: 64,
      age: "16 hours",
      score: 102,
      text: "Why It’s So Hard to Create New Processors",
      domain: "https://semiengineering.com/why-its-so-hard-to-create-new-processors/"),
  Article(
      by: "smoo",
      commentsCount: 1,
      score: 8,
      age: "1 week",
      text: "Show HN: Spatially aware group video calls from the browser",
      domain: "https://party.mookerj.ee"),
  Article(
      by: "nlolks",
      commentsCount: 65,
      age: "8 hours",
      score: 99,
      text: "Deprecating password authentication in GitHub API",
      domain: "https://developer.github.com/changes/2020-02-14-deprecating-password-auth/"),
  Article(
      by: "dgski",
      commentsCount: 10,
      age: "16 hours",
      score: 20,
      text: "Show HN: Storystreamer – Snap/Instagram Stories UI Inspired News Reader",
      domain: "https://storystreamer.live/"),
  Article(
      by: "Tomte",
      commentsCount: 19,
      age: "8 hours",
      score: 93,
      text: "“Samsung Rising” goes deep on corruption, chaebols, and corporate chaos",
      domain: "https://www.theverge.com/2020/4/10/21216092/samsung-rising-book-interview-geoffrey-cain")
];