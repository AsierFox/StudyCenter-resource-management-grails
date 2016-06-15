
var providerName = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);

var generatePDF = function() {
    var checkboxName = 'offer';
    var selectedOffers = [];
    var allCheckbox = document.getElementsByName(checkboxName);
    var allCheckboxSize = allCheckbox.length;

    for (var i = 0; i < allCheckboxSize; i++) {
        var checkbox = allCheckbox[i];

        if (checkbox.checked) {
            selectedOffers.push(checkbox.value);
        }
    }

    if (!selectedOffers.length) {
        sweetAlert('You need to check an offer', null, 'error');
        return false;
    }
    var selectedOffersSize = selectedOffers.length;

    for (var i = 0; i < selectedOffersSize; i++) {
        var offerRef = selectedOffers[i];

        $.ajax({
            type: 'POST',
            url: '/provider/getProviderOffer',
            data: { "providerName": providerName, "offerRef": offerRef },
            async: false,
            dataType: 'json',
            success: function(data) {
                selectedOffers[i] = data[0];
            }
        });
    }
    createOffersPDF(selectedOffers);

    return false;
};

var createOffersPDF = function(selectedOffers) {
    var providerName = document.getElementById('provider-name').value;
    var pdf = new jsPDF();
    var x = 25;
    var selectedOffersSize = selectedOffers.length;

    // Title
    pdf.setFontSize(25);
    pdf.text(35, x, 'Offer request from ' + providerName);

    x += 15;
    pdf.setFontSize(15);
    pdf.text(20, x, 'Number of offers selected: ' + selectedOffersSize);

    x += 15;
    pdf.setFontSize(18);
    pdf.text(20, x, 'Offers');

    pdf.setFontSize(15);
    for (var i = 0; i < selectedOffersSize; i++) {
        var offer = selectedOffers[i];

        x += 18;
        pdf.text(20, x, 'Offer (' + (i + 1) + '): ' + offer.name);
        x += 15;
        pdf.text(40, x, 'Brand: ' + offer.brand);
        x += 15;
        pdf.text(40, x, 'Description: ' + offer.description);
        x += 15;
        pdf.text(40, x, 'Price: ' + offer.price);
    }

    pdf.save(providerName + '-offers-request.pdf')
};
