window.addEventListener('load', function(){
  const pullDownButton = document.getElementById("boxform")
  const pullDownChild = document.querySelectorAll(".form-check-input")
  console.log(pullDownButton)

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:#FFBEDA;")
  })

  pullDownChild.forEach(function(list) {
    list.addEventListener('click', function() {
      console.log(list)
    })
  })
})