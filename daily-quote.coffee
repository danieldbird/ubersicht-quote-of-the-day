command: "
quote=$(curl --silent http://www.goodreads.com/quotes_of_the_day/rss | awk 'NR==38' | sed -e 's/&lt;[^&gt;]*&gt;//g');
author=$(curl --silent http://www.goodreads.com/quotes_of_the_day/rss | awk 'NR==42' | sed -e 's/<[^>]*>//g');

echo '\"'$quote'\"';
echo - $author;
";

refreshFrequency: '1h'

style: """
  bottom: 35px
  right: 55px
  color: #fff
  font-family: Helvetica Neue
  .output
    width: 350px
    font-size: 20px
  .author
    padding-top: 5px;
    text-transform: capitalize
    font-size: 14px
    text-align: right
    
"""

render: (output) -> """
  <div class="output">
    <div class="quote"></div>
    <div class="author"></div>
  </div>
"""

update: (output, domEl) ->
  item = output.split('\n');

  $(domEl).find(".quote").html(item[0]);
  $(domEl).find(".author").html(item[1]);