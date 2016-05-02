
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

    createOffersPDF();

    return false;
};

var createOffersPDF = function() {
    var providerName = document.getElementById('provider-name').value;
    var pdf = new jsPDF();

    // Title
    doc.setFontSize(40);
    doc.text(35, 25, 'Offer request from ' + providerName);



    pdf.save(providerName + '-offers-request.pdf')
};
