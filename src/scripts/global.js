export function searchToggle() {
    var searchHolder = $('.search-holder');

    if(searchHolder.hasClass('active')){
        searchHolder.removeClass('active');
    }
    else {
        searchHolder.addClass('active');
    }

}