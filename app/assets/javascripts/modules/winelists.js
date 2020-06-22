$(function() {

  let tabs = $(".wine_item");

  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".WineContent").removeClass("show").eq(index).addClass("show");
  }

  tabs.click(tabSwitch);
});