export function searchToggle() {
    const searchHolder = $('.search-holder');

    if(searchHolder.hasClass('active')){
        searchHolder.removeClass('active');
    }
    else {
        searchHolder.addClass('active');
    }

}