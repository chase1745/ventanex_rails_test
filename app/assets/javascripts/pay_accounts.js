$(document).on('ready turbolinks:load', function() {
    $('.hide-btn').click(function() {
        const id = $(this).attr('id').split('-')[0];
        let accountNumberElement = $('#' + id + '-account-number');

        if ($(this).html() === 'hide') {
            hideAccountNumber(accountNumberElement, $(this));

            $(this).html('show');
        } else {
            // Account number saved in data when hidden
            const fullAccountNumber = $(this).data('account-number');
            accountNumberElement.html(fullAccountNumber);

            $(this).html('hide');
        }
    })
});

function hideAccountNumber(accountNumberElement, btnElement) {
    const fullAccountNumber = accountNumberElement.html();
    const newAccountNumber = fullAccountNumber.replace(/.(?=.{4})/g, '*');
    accountNumberElement.html(newAccountNumber);

    // Save account num in data for show
    btnElement.data('account-number', fullAccountNumber);
}