<?xml version="1.0" encoding="UTF-8"?>
<!--
  feed.xml をブラウザで直接開いた人向けの表示用スタイル。
  Spotify / Apple などの配信サービスはこのファイルを無視して feed.xml をそのまま読む。
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd"
  xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html lang="ja">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title><xsl:value-of select="/rss/channel/title"/> – RSS</title>
<style>
  body{margin:0;background:#fbf8f1;color:#2b2622;font-family:-apple-system,BlinkMacSystemFont,"Hiragino Sans","Yu Gothic UI","Meiryo",sans-serif;line-height:1.7;font-size:16px}
  .wrap{max-width:720px;margin:0 auto;padding:20px 16px 60px}
  .box{background:#fff;border:1px solid #e7dfcf;border-radius:12px;padding:16px;margin:12px 0}
  .warn{background:#fff8e6;border:1px solid #e9d59a;border-radius:12px;padding:14px 16px}
  .warn b{color:#8f6f14}
  a.btn{display:inline-block;margin-top:8px;padding:10px 14px;border-radius:8px;background:#8f6f14;color:#fff;text-decoration:none;font-weight:600}
  h1{font-size:1.25rem;margin:0 0 6px}
  .sub{color:#6f655a;font-size:.9rem}
  .ep{border-top:1px solid #e7dfcf;padding:10px 0}
  .ep:first-child{border-top:0}
  .ep h3{margin:0 0 4px;font-size:1rem}
  code{font-size:.85rem;word-break:break-all;background:#faf7f0;padding:2px 4px;border-radius:4px}
</style>
</head>
<body>
<div class="wrap">
  <div class="warn">
    <b>このページは配信サービス用の「RSSデータ」です。壊れているわけではありません。</b><br/>
    人が見るための番組ページは、下のボタンから開いてください。<br/>
    Spotify / Apple に登録するときは、この画面の URL(アドレス欄)をそのまま貼り付けます。
    <br/>
    <a class="btn" href="{/rss/channel/link}">番組ページを開く</a>
  </div>

  <div class="box">
    <h1><xsl:value-of select="/rss/channel/title"/></h1>
    <div class="sub"><xsl:value-of select="/rss/channel/itunes:author"/></div>
    <p><xsl:value-of select="/rss/channel/description"/></p>
    <div class="sub">RSSのURL: <code><xsl:value-of select="/rss/channel/atom:link[@rel='self']/@href"/></code></div>
  </div>

  <div class="box">
    <xsl:for-each select="/rss/channel/item">
      <div class="ep">
        <h3><xsl:value-of select="title"/></h3>
        <div class="sub"><xsl:value-of select="pubDate"/></div>
        <p><xsl:value-of select="description"/></p>
      </div>
    </xsl:for-each>
    <xsl:if test="not(/rss/channel/item)">
      <div class="sub">まだエピソードはありません。</div>
    </xsl:if>
  </div>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
