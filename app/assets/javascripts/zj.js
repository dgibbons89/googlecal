$(document).ready(function () {
    $('.filter .row').hide();

    // $('label.tagcheck').find('input:checkbox').live('click', function () {
    $('.row.tags').find('input:checkbox').on('click', function () {
    	$(this).parent().removeClass('selected');
        $('.filter .row').hide();
        $('.row.tags').find('input:checked').each(function () {
            $('.row.' + $(this).attr('rel')).show();
            $(this).parent().addClass('selected');
        });
    });
}); 