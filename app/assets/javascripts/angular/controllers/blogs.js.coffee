@app.controller 'BlogsCtrl', @BlogsCtrl = ($scope, $resource) ->
  Post = $resource('/blogs_all')
  Post.query (result) ->
    $scope.blogs = result
    data = result
    width = 960
    height = 500
    radius = Math.min(width, height) / 2
    color = d3.scale.ordinal().range([
      "#98abc5"
      "#8a89a6"
      "#7b6888"
      "#6b486b"
      "#a05d56"
      "#d0743c"
      "#ff8c00"
    ])
    arc = d3.svg.arc().outerRadius(radius - 10).innerRadius(0)
    pie = d3.layout.pie().sort(null).value((d) ->
      d.rating
    )
    svg = d3.select("body").append("svg").attr("width", width).attr("height", height).append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")   

    data.forEach (d) ->
      d.rating = +d.rating

    g = svg.selectAll(".arc").data(pie(data)).enter().append("g").attr("class", "arc")
    g.append("path").attr("d", arc).style "fill", (d) ->
      color(d.data.title)

    g.append("text").attr("transform", (d) ->
      "translate(" + arc.centroid(d) + ")"
    ).attr("dy", ".35em").style("text-anchor", "middle").text (d) ->
      d.data.title